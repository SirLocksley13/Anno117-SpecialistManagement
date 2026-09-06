#!/usr/bin/env python3
import argparse
import hashlib
import json
import shutil
import tempfile
from pathlib import Path
import xml.etree.ElementTree as ET
import zipfile

CANDIDATE_VERSION = "1.1.1-test-controls1"
TEST_VERSION = "1.1.1-test-controls1-smoke1"
PRODUCTION_VERSION = "1.1.0"
MOD_ID = "specialist-management-v0546"
PRODUCTION_FOLDER = "SpecialistManagement_v1.1.0"
OPEN_TEXT_ID = 2008618510
CORE_VERSION = "1.0.1"
CORE_MOD_ID = "sirlocksley-parchment-controls-core"
CORE_FOLDER = "SirLocksley Parchment Controls Core"
CORE_TEXT_BASE = 2088800100


def shared_command(slot: int) -> str:
    slot = int(slot)
    parts = []
    for i in range(1, 13):
        name = f"SirLocksleyPC{i:02d}"
        parts.append(
            f"if {name} ~= nil and {name}.Handle ~= nil then "
            f"{name}.Handle({name},{slot}) end"
        )
    return "; ".join(parts)


def _open_binding_xml() -> str:
    return f'''  <ModOp GUID="2001271" Add="ShortcutConfig/InputBindings">
    <Item>
      <Command>SpecialistFinderRC.Open(SpecialistFinderRC)</Command>
      <Text>{OPEN_TEXT_ID}</Text>
      <Active>Session</Active>
      <Configurable>1</Configurable>
      <Identifier>SirLocksleySpecialistManagementOpen</Identifier>
      <AvailableOnPlatforms>PC</AvailableOnPlatforms>
      <HideInOptionMenu>0</HideInOptionMenu>
      <AllowMultipleShortcuts>1</AllowMultipleShortcuts>
      <InputTypes>
        <Modern><KeyType>Control;Alt;I</KeyType></Modern>
        <Legacy><KeyType>Control;Alt;I</KeyType></Legacy>
      </InputTypes>
    </Item>
  </ModOp>'''


def patch_assets_xml(text: str) -> str:
    # Keep all non-shortcut assets byte-for-byte except the one legacy shortcut ModOp.
    signatures = [
        '<ModOp Type="add" GUID="2001271" Path="/Values/ShortcutConfig/InputBindings">',
        '<ModOp Type="add" GUID="2001271" Path="/Values/ShortcutConfig/InputBindings" >',
    ]
    start = -1
    sig = None
    for candidate in signatures:
        start = text.find(candidate)
        if start >= 0:
            sig = candidate
            break
    if start < 0:
        raise AssertionError("Legacy Specialist Management shortcut ModOp not found")
    end = text.find("</ModOp>", start)
    if end < 0:
        raise AssertionError("Legacy shortcut ModOp has no closing tag")
    end += len("</ModOp>")
    old = text[start:end]

    required_old = [
        "SpecialistFinderRC:Open()",
        "SpecialistFinderStatisticsFirstV020",
        "SpecialistManagementJumpReport1V057",
        "SpecialistManagementJumpReport9V057",
        "SpecialistManagementBackToMenuV110Test6",
    ]
    missing = [s for s in required_old if s not in old]
    if missing:
        raise AssertionError(f"Legacy shortcut block differs from protected v1.1.0: missing {missing}")
    if old.count("<Item>") != 11:
        raise AssertionError(f"Expected 11 legacy shortcut items, found {old.count('<Item>')}")

    patched = text[:start] + _open_binding_xml() + text[end:]
    # Static safety assertions.
    forbidden = [
        "SpecialistFinderRC:JumpReport1()",
        "SpecialistFinderRC:JumpReport9()",
        "SpecialistFinderRC:BackToMenu()",
        "SpecialistManagementJumpReport1V057",
        "SpecialistManagementBackToMenuV110Test6",
    ]
    for token in forbidden:
        if token in patched:
            raise AssertionError(f"Legacy private shortcut survived migration: {token}")
    if patched.count("SirLocksleySpecialistManagementOpen") != 1:
        raise AssertionError("Expected exactly one Specialist Management opener identifier")
    ET.fromstring(patched)
    return patched


def patch_modinfo(text: str, version: str = CANDIDATE_VERSION) -> str:
    data = json.loads(text)
    if data.get("ModID") != MOD_ID:
        raise AssertionError(f"Unexpected ModID: {data.get('ModID')}")
    if str(data.get("Version")) != PRODUCTION_VERSION:
        raise AssertionError(f"Expected protected v{PRODUCTION_VERSION}, found {data.get('Version')}")
    data["Version"] = version
    data["version"] = version
    # Keep product name and gameplay metadata unchanged.
    return json.dumps(data, ensure_ascii=False, indent=2) + "\n"


def patch_lua(text: str) -> str:
    old_prefix = 'local PREFIX = "[Specialist Management 1.1.0 / Finder 0.14.13 Patch 2] "'
    new_prefix = f'local PREFIX = "[Specialist Management {CANDIDATE_VERSION} / Finder 0.14.13 Patch 2] "'
    if text.count(old_prefix) != 1:
        raise AssertionError("Protected v1.1.0 PREFIX not found exactly once")
    text = text.replace(old_prefix, new_prefix, 1)

    old_banner = 'local banner=SpecialistFinder.SMT("<<< CTRL+ALT+0 — BACK TO SPECIALIST MANAGEMENT >>>","<<< CTRL+ALT+0 — ZURÜCK ZU SPECIALIST MANAGEMENT >>>")'
    new_banner = 'local banner=SpecialistFinder.SMT("<<< BACK TO SPECIALIST MANAGEMENT >>>","<<< ZURÜCK ZU SPECIALIST MANAGEMENT >>>")'
    if text.count(old_banner) != 1:
        raise AssertionError("Hard-coded Ctrl+Alt+0 report banner not found exactly once")
    text = text.replace(old_banner, new_banner, 1)

    marker = "\nreturn SpecialistFinder"
    pos = text.rfind(marker)
    if pos < 0:
        raise AssertionError("Final return SpecialistFinder marker not found")
    if "SirLocksleyPC03" in text:
        raise AssertionError("PC03 consumer already exists unexpectedly")

    handler = r'''

-- Patch 2 shared parchment controls consumer.
-- PC03 is the permanent Specialist Management consumer slot.
SirLocksleyPC03 = {}
function SirLocksleyPC03:Handle(slot)
slot=tonumber(slot) or -1
if SpecialistFinderRC == nil or SpecialistFinderRC.SpecialistReportOpen ~= true then
return false
end
log("SHARED PARCHMENT CONTROL | consumer=PC03 | slot="..tostring(slot).." | active=true")
if slot==0 then
return SpecialistFinderRC:BackToMenu()
end
if slot>=1 and slot<=9 then
return SpecialistFinderRC:JumpReportItem(slot)
end
return false
end
'''
    text = text[:pos] + handler + text[pos:]
    return text


def add_open_label(text: str, language: str) -> str:
    if f"<LineId>{OPEN_TEXT_ID}</LineId>" in text:
        return text
    labels = {
        "german": "Spezialistenverwaltung - Öffnen",
        "french": "Gestion des spécialistes - Ouvrir",
    }
    label = labels.get(language.lower(), "Specialist Management - Open")
    needle = '<ModOp Add="/TextExport/Texts[1]">'
    idx = text.find(needle)
    if idx < 0:
        raise AssertionError(f"Localization insertion point missing for {language}")
    idx += len(needle)
    block = f'''\n    <Text>\n      <Text>{label}</Text>\n      <LineId>{OPEN_TEXT_ID}</LineId>\n    </Text>'''
    patched = text[:idx] + block + text[idx:]
    ET.fromstring(patched)
    return patched


def make_shared_core_assets() -> str:
    lines = ["<ModOps>", '  <ModOp GUID="2001271" Add="ShortcutConfig/InputBindings">']
    for slot in range(1, 10):
        text_id = CORE_TEXT_BASE + slot
        lines.extend([
            "    <Item>",
            f"      <Command>{shared_command(slot)}</Command>",
            f"      <Text>{text_id}</Text>",
            "      <Active>Session</Active>",
            "      <Configurable>1</Configurable>",
            f"      <Identifier>SirLocksleyParchmentSelect{slot}</Identifier>",
            "      <AvailableOnPlatforms>PC</AvailableOnPlatforms>",
            "      <HideInOptionMenu>0</HideInOptionMenu>",
            "      <AllowMultipleShortcuts>1</AllowMultipleShortcuts>",
            "      <InputTypes>",
            f"        <Modern><KeyType>Control;Alt;Digit{slot}</KeyType></Modern>",
            f"        <Legacy><KeyType>Control;Alt;Digit{slot}</KeyType></Legacy>",
            "      </InputTypes>",
            "    </Item>",
        ])
    lines.extend([
        "    <Item>",
        f"      <Command>{shared_command(0)}</Command>",
        f"      <Text>{CORE_TEXT_BASE + 10}</Text>",
        "      <Active>Session</Active>",
        "      <Configurable>1</Configurable>",
        "      <Identifier>SirLocksleyParchmentBack</Identifier>",
        "      <AvailableOnPlatforms>PC</AvailableOnPlatforms>",
        "      <HideInOptionMenu>0</HideInOptionMenu>",
        "      <AllowMultipleShortcuts>1</AllowMultipleShortcuts>",
        "      <InputTypes>",
        "        <Modern><KeyType>Control;Alt;Digit0</KeyType></Modern>",
        "        <Legacy><KeyType>Control;Alt;Digit0</KeyType></Legacy>",
        "      </InputTypes>",
        "    </Item>",
        "  </ModOp>",
        "</ModOps>",
        "",
    ])
    xml_text = "\n".join(lines)
    ET.fromstring(xml_text)
    return xml_text


def make_core_modinfo() -> str:
    data = {
        "ModID": CORE_MOD_ID,
        "Version": CORE_VERSION,
        "Anno": 8,
        "ModName": "SirLocksley Parchment Controls Core",
        "Category": {"English": "Utility"},
        "Description": "Shared native configurable parchment controls for SirLocksley utility mods.",
        "CreatorName": "Dr. Enrico Handrick / SirLocksley13",
        "GameSetup": {
            "RequiresNewGame": False,
            "SafeToRemove": True,
            "Multiplayer": False,
            "Campaign": False,
        },
    }
    return json.dumps(data, ensure_ascii=False, indent=2) + "\n"


def make_core_texts(language: str) -> str:
    lang = language.lower()
    if lang == "german":
        entry = "Pergamentsteuerung - Eintrag {}"
        back = "Pergamentsteuerung - Zurück"
    elif lang == "french":
        entry = "Commandes du parchemin - Entrée {}"
        back = "Commandes du parchemin - Retour"
    else:
        entry = "Parchment Controls - Entry {}"
        back = "Parchment Controls - Back"
    lines = ["<ModOps>", '  <ModOp Add="/TextExport/Texts[1]">']
    for slot in range(1, 10):
        lines.extend([
            "    <Text>",
            f"      <Text>{entry.format(slot)}</Text>",
            f"      <LineId>{CORE_TEXT_BASE + slot}</LineId>",
            "    </Text>",
        ])
    lines.extend([
        "    <Text>",
        f"      <Text>{back}</Text>",
        f"      <LineId>{CORE_TEXT_BASE + 10}</LineId>",
        "    </Text>",
        "  </ModOp>",
        "</ModOps>",
        "",
    ])
    out = "\n".join(lines)
    ET.fromstring(out)
    return out


def inject_smoke_harness(lua_text: str) -> str:
    marker = "\nreturn SpecialistFinder"
    pos = lua_text.rfind(marker)
    if pos < 0:
        raise AssertionError("Cannot inject smoke harness: final return missing")
    harness = r'''

-- TEST-ONLY controls registration/isolation smoke harness.
local _controlsSmokeOriginalLoad=SpecialistFinder.Load
local _controlsSmokeOriginalTick=SpecialistFinder.Tick
function SpecialistFinder:Load(...)
local result=nil
if type(_controlsSmokeOriginalLoad)=="function" then
result=_controlsSmokeOriginalLoad(self,...)
end
self.ControlsSmokeTicks=0
self.ControlsSmokeDone=false
system.log("[Specialist Management Controls Smoke 1] TEST_READY | testId=specialist-management-controls-registration-smoke-001 | productionBaseline=1.1.0 | testVersion=1.1.1-test-controls1-smoke1 | gameplayWrites=0")
return result
end
function SpecialistFinder:Tick(...)
local result=nil
if type(_controlsSmokeOriginalTick)=="function" then
result=_controlsSmokeOriginalTick(self,...)
end
if self.ControlsSmokeDone~=true then
self.ControlsSmokeTicks=(tonumber(self.ControlsSmokeTicks) or 0)+1
if self.ControlsSmokeTicks>=5 then
self.ControlsSmokeDone=true
system.log("[Specialist Management Controls Smoke 1] TEST_STARTED | target=native-configurable-opener-plus-shared-PC03-registration | gameplayWrites=0")
local function hasShortcut(identifier)
local ok,value=pcall(function()
return ShortcutManager~=nil
and type(ShortcutManager.HasShortcutTooltip)=="function"
and ShortcutManager:HasShortcutTooltip(identifier)
end)
return ok and value==true
end
local opener=hasShortcut("SirLocksleySpecialistManagementOpen")
local shared1=hasShortcut("SirLocksleyParchmentSelect1")
local sharedBack=hasShortcut("SirLocksleyParchmentBack")
local pc03=(SirLocksleyPC03~=nil and type(SirLocksleyPC03.Handle)=="function")
local inactiveEntry=false
local inactiveBack=false
if pc03 then
local ok1,v1=pcall(function() return SirLocksleyPC03:Handle(1) end)
local ok0,v0=pcall(function() return SirLocksleyPC03:Handle(0) end)
inactiveEntry=ok1 and v1==false
inactiveBack=ok0 and v0==false
end
local pass=opener and shared1 and sharedBack and pc03 and inactiveEntry and inactiveBack
local detail="opener="..tostring(opener).." | sharedEntry1="..tostring(shared1).." | sharedBack="..tostring(sharedBack).." | pc03="..tostring(pc03).." | inactiveEntrySafe="..tostring(inactiveEntry).." | inactiveBackSafe="..tostring(inactiveBack).." | gameplayWrites=0"
if pass then
system.log("[Specialist Management Controls Smoke 1] TEST_DONE | result=PASS | "..detail)
else
system.log("[Specialist Management Controls Smoke 1] TEST_FAILED | result=FAIL | "..detail)
end
end
end
return result
end
'''
    return lua_text[:pos] + harness + lua_text[pos:]


def copy_source(repo: Path, target: Path):
    ignore = shutil.ignore_patterns(".git", ".github", "dist", "__pycache__")
    shutil.copytree(repo, target, ignore=ignore)


def build_candidate_tree(repo: Path, target: Path, include_core: bool = True, version: str = CANDIDATE_VERSION, smoke: bool = False):
    copy_source(repo, target)

    modinfo = target / "modinfo.json"
    modinfo.write_text(patch_modinfo(modinfo.read_text(encoding="utf-8"), version=version), encoding="utf-8")

    assets = target / "data/base/config/export/assets.xml"
    assets.write_text(patch_assets_xml(assets.read_text(encoding="utf-8")), encoding="utf-8")

    lua = target / "specialistfinder/specialist-finder.lua"
    lua_text = patch_lua(lua.read_text(encoding="utf-8"))
    if smoke:
        lua_text = inject_smoke_harness(lua_text)
    lua.write_text(lua_text, encoding="utf-8")

    gui = target / "data/base/config/gui"
    for path in sorted(gui.glob("texts_*.xml")):
        language = path.stem.replace("texts_", "")
        path.write_text(add_open_label(path.read_text(encoding="utf-8"), language), encoding="utf-8")

    if include_core:
        core = target / CORE_FOLDER
        (core / "data/base/config/export").mkdir(parents=True, exist_ok=True)
        (core / "data/base/config/gui").mkdir(parents=True, exist_ok=True)
        (core / "modinfo.json").write_text(make_core_modinfo(), encoding="utf-8")
        (core / "data/base/config/export/assets.xml").write_text(make_shared_core_assets(), encoding="utf-8")
        languages = [
            "chinese", "english", "french", "german", "italian", "japanese",
            "korean", "polish", "portuguese", "russian", "spanish", "taiwanese"
        ]
        for language in languages:
            (core / f"data/base/config/gui/texts_{language}.xml").write_text(make_core_texts(language), encoding="utf-8")

    validate_tree(target, include_core=include_core, expected_version=version, smoke=smoke)


def validate_tree(root: Path, include_core: bool, expected_version: str, smoke: bool):
    info = json.loads((root / "modinfo.json").read_text(encoding="utf-8"))
    assert info["ModID"] == MOD_ID
    assert info["Version"] == expected_version
    ET.parse(root / "data/base/config/export/assets.xml")
    for p in (root / "data/base/config/gui").glob("texts_*.xml"):
        ET.parse(p)
    assets = (root / "data/base/config/export/assets.xml").read_text(encoding="utf-8")
    assert "SirLocksleySpecialistManagementOpen" in assets
    assert "SpecialistManagementJumpReport1V057" not in assets
    assert "SpecialistManagementBackToMenuV110Test6" not in assets
    lua = (root / "specialistfinder/specialist-finder.lua").read_text(encoding="utf-8")
    assert "SirLocksleyPC03" in lua
    assert "CTRL+ALT+0 — BACK" not in lua
    if smoke:
        assert "TEST_READY" in lua and "TEST_STARTED" in lua and "TEST_DONE" in lua and "TEST_FAILED" in lua
    if include_core:
        core = root / CORE_FOLDER
        cinfo = json.loads((core / "modinfo.json").read_text(encoding="utf-8"))
        assert cinfo["ModID"] == CORE_MOD_ID and cinfo["Version"] == CORE_VERSION
        croot = ET.parse(core / "data/base/config/export/assets.xml").getroot()
        assert len(croot.findall(".//Item")) == 10
        assert shared_command(1) in (core / "data/base/config/export/assets.xml").read_text(encoding="utf-8")
    else:
        # Runner compatibility: the test ZIP must contain exactly one modinfo.json.
        assert len(list(root.rglob("modinfo.json"))) == 1


def zip_tree(source: Path, zip_path: Path, wrapper: str | None = None):
    zip_path.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
        for p in sorted(source.rglob("*")):
            if not p.is_file():
                continue
            rel = p.relative_to(source).as_posix()
            arc = f"{wrapper}/{rel}" if wrapper else rel
            z.write(p, arc)


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def make_manifest() -> dict:
    return {
        "schemaVersion": 1,
        "frameworkVersion": "0.7",
        "testId": "specialist-management-controls-registration-smoke-001",
        "name": "Specialist Management v1.1.1 controls registration / inactive isolation smoke",
        "testType": "smoke",
        "targetMod": {
            "folder": PRODUCTION_FOLDER,
            "modId": MOD_ID,
            "productionVersion": PRODUCTION_VERSION,
            "testVersion": TEST_VERSION,
        },
        "testModZip": "Anno117_Test_Mod.zip",
        "automation": {
            "startupProfile": "recovered-v0.6.24",
            "timeoutSeconds": 120,
            "requiredMarkers": ["TEST_READY", "TEST_STARTED", "TEST_DONE"],
            "passMarker": "TEST_DONE",
            "failMarker": "TEST_FAILED",
            "captureFinalScreenshot": True,
            "closeAnnoAfterTest": True,
            "requiredLogContains": [
                "result=PASS",
                "opener=true",
                "sharedEntry1=true",
                "sharedBack=true",
                "pc03=true",
                "inactiveEntrySafe=true",
                "inactiveBackSafe=true",
                "gameplayWrites=0",
            ],
            "numericAssertions": [],
        },
    }


def make_manual_checklist() -> str:
    return f'''# Specialist Management v{CANDIDATE_VERSION} — Controls Test Checklist

Protected baseline: v{PRODUCTION_VERSION}
Scope: controls only. Do not evaluate new specialist-analysis features in this build.

## Automated first step

Copy the included `Anno117_Test_Job.zip` to your Automation workflow exactly as usual and run `Run-Anno117-Testing.cmd`.
The smoke test checks:
- the new configurable opener is registered;
- the shared Entry 1 and Back identifiers are present;
- Specialist Management exposes reserved consumer `SirLocksleyPC03`;
- Entry/Back are safely ignored while Specialist Management parchment is inactive;
- no gameplay writes occur.

Upload the resulting `Anno117_ChatGPT_Result_specialist-management-controls-registration-smoke-001_*.zip` to ChatGPT.

## Manual controls validation after the smoke passes

1. Open Settings -> Controls.
2. Confirm one clean row: `Specialist Management - Open` with default Ctrl+Alt+I.
3. Confirm the shared `Parchment Controls - Entry 1..9` and `Parchment Controls - Back` rows exist only once.
4. In gameplay, Ctrl+Alt+I opens Specialist Management.
5. Open a Specialist Management parchment report and verify Entry 1..9 select their mapped rows; Back returns to Specialist Management.
6. Close Specialist Management and verify shared Entry/Back do not cause Specialist Management actions.
7. Remap `Specialist Management - Open` to another unused shortcut.
8. Verify the new shortcut opens it and Ctrl+Alt+I no longer does.
9. Fully restart Anno and verify the remap persists.
10. Use Reset to Default and verify Ctrl+Alt+I is restored.
11. Smoke-test one stored-specialist exact warehouse jump to confirm navigation behavior was not changed.

Do not promote the opener Identifier/Command pair to final production until these runtime checks pass.
'''


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()
    repo = Path(args.repo).resolve()
    out = Path(args.out).resolve()
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)

    with tempfile.TemporaryDirectory() as td:
        tmp = Path(td)
        candidate = tmp / "candidate"
        smoke = tmp / "smoke"
        build_candidate_tree(repo, candidate, include_core=True, version=CANDIDATE_VERSION, smoke=False)
        build_candidate_tree(repo, smoke, include_core=False, version=TEST_VERSION, smoke=True)

        candidate_zip = out / f"Specialist_Management_v{CANDIDATE_VERSION}.zip"
        zip_tree(candidate, candidate_zip, wrapper=PRODUCTION_FOLDER)

        test_mod_zip = out / "Anno117_Test_Mod.zip"
        zip_tree(smoke, test_mod_zip, wrapper=PRODUCTION_FOLDER)

        # Runner hard guard: exactly one modinfo in test mod ZIP.
        with zipfile.ZipFile(test_mod_zip, "r") as z:
            mis = [n for n in z.namelist() if n.lower().endswith("/modinfo.json") or n.lower() == "modinfo.json"]
            assert len(mis) == 1, mis

        manifest_path = out / "Anno117_Test_Manifest.json"
        manifest_path.write_text(json.dumps(make_manifest(), indent=2) + "\n", encoding="utf-8")

        job_zip = out / "Anno117_Test_Job.zip"
        with zipfile.ZipFile(job_zip, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            z.write(manifest_path, "Anno117_Test_Manifest.json")
            z.write(test_mod_zip, "Anno117_Test_Mod.zip")

        checklist = out / "README_CONTROLS_TEST.txt"
        checklist.write_text(make_manual_checklist(), encoding="utf-8")

        checksums = out / "SHA256SUMS.txt"
        checksum_targets = [candidate_zip, job_zip, test_mod_zip, manifest_path]
        checksums.write_text("".join(f"{sha256(p)}  {p.name}\n" for p in checksum_targets), encoding="utf-8")

        package_zip = out / f"Specialist_Management_v{CANDIDATE_VERSION}_Package.zip"
        with zipfile.ZipFile(package_zip, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            z.write(candidate_zip, candidate_zip.name)
            z.write(job_zip, "READY_TO_COPY/Anno117_Test_Job.zip")
            z.write(checklist, checklist.name)
            z.write(checksums, checksums.name)

        # Final structural verification.
        for p in [candidate_zip, test_mod_zip, job_zip, package_zip]:
            with zipfile.ZipFile(p, "r") as z:
                bad = z.testzip()
                assert bad is None, f"Corrupt member {bad} in {p.name}"

        print("BUILD_OK")
        print(f"candidate={candidate_zip.name} sha256={sha256(candidate_zip)}")
        print(f"job={job_zip.name} sha256={sha256(job_zip)}")
        print(f"package={package_zip.name} sha256={sha256(package_zip)}")


if __name__ == "__main__":
    main()
