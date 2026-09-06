import json
import sys
import unittest
from pathlib import Path
import xml.etree.ElementTree as ET

TOOLS = Path(__file__).resolve().parent
sys.path.insert(0, str(TOOLS))

import build_controls_candidate as build


class ControlsMigrationTests(unittest.TestCase):
    def test_shared_command_uses_all_12_reserved_consumers_exactly_once(self):
        cmd = build.shared_command(4)
        for i in range(1, 13):
            name = f"SirLocksleyPC{i:02d}"
            self.assertEqual(cmd.count(f"{name}.Handle({name},4)"), 1)
        self.assertTrue(cmd.startswith("if SirLocksleyPC01 ~= nil and SirLocksleyPC01.Handle ~= nil then"))
        self.assertTrue(cmd.endswith("SirLocksleyPC12.Handle(SirLocksleyPC12,4) end"))

    def test_shared_core_has_one_configurable_1_to_9_plus_back_set(self):
        xml_text = build.make_shared_core_assets()
        root = ET.fromstring(xml_text)
        items = root.findall(".//Item")
        self.assertEqual(len(items), 10)
        ids = [item.findtext("Identifier") for item in items]
        self.assertEqual(ids[:9], [f"SirLocksleyParchmentSelect{i}" for i in range(1, 10)])
        self.assertEqual(ids[9], "SirLocksleyParchmentBack")
        for item in items:
            self.assertEqual(item.findtext("Configurable"), "1")
            self.assertEqual(item.findtext("HideInOptionMenu"), "0")
            self.assertEqual(item.findtext("AllowMultipleShortcuts"), "1")
        self.assertEqual(items[0].findtext("InputTypes/Modern/KeyType"), "Control;Alt;Digit1")
        self.assertEqual(items[9].findtext("InputTypes/Modern/KeyType"), "Control;Alt;Digit0")
        self.assertEqual(items[9].findtext("Command"), build.shared_command(0))

    def test_specialist_assets_remove_private_number_rows_and_make_open_configurable(self):
        source = '''<ModOps>\n  <ModOp Type="add" GUID="2001271" Path="/Values/ShortcutConfig/InputBindings">\n    <Item><Command>SpecialistFinderRC:Open()</Command><Identifier>SpecialistFinderStatisticsFirstV020</Identifier><InputTypes><Modern><KeyType>Control;Alt;I</KeyType></Modern></InputTypes></Item>\n    <Item><Command>SpecialistFinderRC:JumpReport1()</Command><Identifier>SpecialistManagementJumpReport1V057</Identifier></Item>\n    <Item><Command>SpecialistFinderRC:BackToMenu()</Command><Identifier>SpecialistManagementBackToMenuV110Test6</Identifier></Item>\n  </ModOp>\n  <Asset><Template>TextPopup</Template></Asset>\n</ModOps>'''
        patched = build.patch_assets_xml(source)
        root = ET.fromstring(patched)
        shortcut_items = []
        for modop in root.findall("ModOp"):
            if modop.get("GUID") == "2001271" and (
                modop.get("Add") == "ShortcutConfig/InputBindings" or
                modop.get("Path") == "/Values/ShortcutConfig/InputBindings"
            ):
                shortcut_items.extend(modop.findall("Item"))
        self.assertEqual(len(shortcut_items), 1)
        opener = shortcut_items[0]
        self.assertEqual(opener.findtext("Command"), "SpecialistFinderRC.Open(SpecialistFinderRC)")
        self.assertEqual(opener.findtext("Identifier"), "SirLocksleySpecialistManagementOpen")
        self.assertEqual(opener.findtext("Configurable"), "1")
        self.assertEqual(opener.findtext("InputTypes/Modern/KeyType"), "Control;Alt;I")
        self.assertNotIn("JumpReport1V057", patched)
        self.assertNotIn("BackToMenuV110Test6", patched)

    def test_lua_patch_adds_pc03_active_parchment_gate_and_neutral_back_banner(self):
        source = '''local SpecialistFinder = {}\nlocal PREFIX = "[Specialist Management 1.1.0 / Finder 0.14.13 Patch 2] "\nlocal function decorateSpecialistReport(report)\nlocal banner=SpecialistFinder.SMT("<<< CTRL+ALT+0 — BACK TO SPECIALIST MANAGEMENT >>>","<<< CTRL+ALT+0 — ZURÜCK ZU SPECIALIST MANAGEMENT >>>")\nreturn banner.."\\n\\n"..tostring(report or "")\nend\nreturn SpecialistFinder\n'''
        patched = build.patch_lua(source)
        self.assertIn("1.1.1-test-controls1", patched)
        self.assertIn("SirLocksleyPC03", patched)
        self.assertIn("SpecialistFinderRC.SpecialistReportOpen ~= true", patched)
        self.assertIn("SpecialistFinderRC:JumpReportItem(slot)", patched)
        self.assertIn("SpecialistFinderRC:BackToMenu()", patched)
        self.assertNotIn("CTRL+ALT+0 — BACK", patched)
        self.assertNotIn("CTRL+ALT+0 — ZURÜCK", patched)

    def test_modinfo_patch_preserves_mod_id_and_updates_test_version(self):
        src = json.dumps({"ModID":"specialist-management-v0546","Version":"1.1.0","version":"1.1.0","ModName":"Specialist Management"})
        patched = json.loads(build.patch_modinfo(src))
        self.assertEqual(patched["ModID"], "specialist-management-v0546")
        self.assertEqual(patched["Version"], "1.1.1-test-controls1")
        self.assertEqual(patched["version"], "1.1.1-test-controls1")


if __name__ == "__main__":
    unittest.main(verbosity=2)
