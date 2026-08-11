local SpecialistFinder = {}
local PREFIX = "[Specialist Finder Auto-Close Before Scan 0.14.13] "
local VERIFIED_PROFILES = {
[42618] = {
name = "Collegiate of Aeneas",
rarity = "Rare",
niche = "Seafaring",
targets = "Ships",
scope = "",
effects = "Seafaring Captain; Discovery Radius +50%; Movement Speed +10%",
notes = "Affects Ship:",
credit = "3,750"
},
[44078] = {
name = "Sailer",
rarity = "Common",
niche = "Economy",
targets = "Sailmaker, and Sails Chain",
scope = "Sailmaker, and Sails Chain in range",
effects = "Productivity +10%",
notes = "",
credit = "750"
},
[50665] = {
name = "Prime Mantler",
rarity = "Rare",
niche = "Nature",
targets = "Cloaks Chain",
scope = "Cloaks Chain in range",
effects = "Productivity +20%",
notes = "",
credit = "4,500"
},
[51321] = {
name = "Tullus Caecilius Cornutus, Arval Brother of Insitor",
rarity = "Epic",
niche = "Nature",
targets = "Arable Farms",
scope = "Arable Farms in range",
effects = "Workforce Needed -40%; Upkeep Cost -80%",
notes = "",
credit = "20,000"
},
[51328] = {
name = "Vesseler",
rarity = "Common",
niche = "Research",
targets = "Victuallers",
scope = "Victuallers in range",
effects = "Workforce Needed -25%; Upkeep Cost -50%",
notes = "",
credit = "500"
},
[51336] = {
name = "Hestian Culinarian",
rarity = "Rare",
niche = "Economy",
targets = "Kitchens",
scope = "Kitchens in range",
effects = "Workforce Needed -33%; Upkeep Cost -66%",
notes = "",
credit = "3,000"
},
[51386] = {
name = "Libertine",
rarity = "Common",
niche = "Civic",
targets = "Pileus Felter",
scope = "Pileus Felter in range",
effects = "Prestige Area Effect +0.5",
notes = "",
credit = "750"
},
[51466] = {
name = "Materialist Medicus",
rarity = "Rare",
niche = "Nature",
targets = "Medici",
scope = "Medici in range",
effects = "Health Area Effect +1",
notes = "",
credit = "4,500"
},
[51523] = {
name = "Tolupist",
rarity = "Rare",
niche = "Research",
targets = "Stringer",
scope = "Stringer in range",
effects = "Knowledge Area Effect +1",
notes = "",
credit = "4,500"
},
[51587] = {
name = "Galerius Natta, Prime Prospector",
rarity = "Epic",
niche = "Civic",
targets = "Marble Quarry",
scope = "Marble Quarry in range",
effects = "Prestige Area Effect +1.5",
notes = "",
credit = "30,000"
},
[51847] = {
name = "Calchas of Colchis, Avian Auspex",
rarity = "Epic",
niche = "Research",
targets = "Residences",
scope = "Residences in range",
effects = "Knowledge from Bird Tongues in Aspic, if supplied +3",
notes = "",
credit = "25,000"
},
[51851] = {
name = "Sartorist",
rarity = "Common",
niche = "Research",
targets = "Residences",
scope = "Residences in range",
effects = "Knowledge from Pileus, if supplied +1",
notes = "",
credit = "625"
},
[64949] = {
name = "Preacher",
rarity = "Common",
niche = "Religion",
targets = "Residences",
scope = "Residences in range",
effects = "Belief +0.6",
notes = "",
credit = "687"
},
[64950] = {
name = "Scholast",
rarity = "Common",
niche = "Research",
targets = "Residences",
scope = "Residences in range",
effects = "Knowledge +0.6",
notes = "",
credit = "687"
},
[64951] = {
name = "Optimate",
rarity = "Common",
niche = "Civic",
targets = "Residences",
scope = "Residences in range",
effects = "Prestige +0.6",
notes = "",
credit = "687"
},
[64964] = {
name = "Senuacus, Dousing Dozer",
rarity = "Epic",
niche = "Military",
targets = "Residences",
scope = "Residences in range",
effects = "Fire Safety +1.8",
notes = "",
credit = "27,500"
},
[71552] = {
name = "Steerswoman",
rarity = "Common",
niche = "Seafaring",
targets = "Ships",
scope = "",
effects = "Seafaring Captain; Movement Speed +10%",
notes = "Affects Ship:",
credit = "625"
},
[71571] = {
name = "Gastraphetus, Ballistic Brave",
rarity = "Epic",
niche = "Military",
targets = "Ships",
scope = "",
effects = "Military Captain; Ship Scorpion Attack range +25%; Ship Scorpion Attack speed +35%",
notes = "Affects Ship:",
credit = "27,500"
},
[92874] = {
name = "Titus Faber, Master of Tasks",
rarity = "Epic",
niche = "Economy",
targets = "Libertus Residence",
scope = "Libertus Residence in range",
effects = "Workforce from residents +25%",
notes = "",
credit = "30,000"
},
[106539] = {
name = "Upholder",
rarity = "Common",
niche = "Military",
targets = "Towers",
scope = "Towers in range",
effects = "Hitpoints +15%",
notes = "",
credit = "562"
},
[106549] = {
name = "Wareholder",
rarity = "Common",
niche = "Military",
targets = "Trading Posts, Warehouses, and Depot",
scope = "Trading Posts, Warehouses, and Depot in range",
effects = "Hitpoints +50%; Self-repair speed +100%",
notes = "",
credit = "562"
},
[106710] = {
name = "High-strung Conductor",
rarity = "Rare",
niche = "Seafaring",
targets = "Ships",
scope = "",
effects = "Seafaring Captain; Workforce Needed -25%; Goods Transfer Speed +40%; Province Transfer Speed +15%",
notes = "Affects Ship:",
credit = "4,500"
},
[106712] = {
name = "Farah, Iconic Emissary",
rarity = "Epic",
niche = "Seafaring",
targets = "Ships",
scope = "",
effects = "Seafaring Captain; Discovery Radius +100%; Goods Transfer Speed +60%; Province Transfer Speed +30%",
notes = "Affects Ship:",
credit = "30,000"
},
[106714] = {
name = "Abiding Closehauler",
rarity = "Rare",
niche = "Seafaring",
targets = "Ships",
scope = "",
effects = "Seafaring Captain; Unfavourable Wind Impact -60%; Favourable Wind Angle +25; Province Transfer Speed +20%",
notes = "Affects Ship:",
credit = "4,500"
},
[140338] = {
name = "Cursory Bursarius",
rarity = "Rare",
niche = "Finance",
targets = "Residences",
scope = "Residences in range",
effects = "Income +1.2",
notes = "",
credit = "4,125"
},
[140344] = {
name = "Inflammatory Flamincia",
rarity = "Rare",
niche = "Religion",
targets = "Residences",
scope = "Residences in range",
effects = "Belief +1.2",
notes = "",
credit = "4,125"
},
[140388] = {
name = "Ascendant Endorser",
rarity = "Rare",
niche = "Civic",
targets = "Residences",
scope = "Residences in range",
effects = "Prestige +1.2",
notes = "",
credit = "4,125"
},
[140405] = {
name = "Pharmacognostic",
rarity = "Rare",
niche = "Nature",
targets = "Residences",
scope = "Residences in range",
effects = "Health +1.2",
notes = "",
credit = "4,125"
},
[140407] = {
name = "Iron-Grade Ironist",
rarity = "Rare",
niche = "Culture",
targets = "Residences",
scope = "Residences in range",
effects = "Happiness +1.2",
notes = "",
credit = "4,125"
}
}
local KNOWN_SPECIALISTS = {
[42618] = { name = "Collegiate of Aeneas" },
[44078] = { name = "Sailer" },
[44083] = { name = "Seamster" },
[50665] = { name = "Prime Mantler" },
[51321] = { name = "Tullus Caecilius Cornutus, Arval Brother of Insitor" },
[51328] = { name = "Vesseler" },
[51336] = { name = "Hestian Culinarian" },
[51386] = { name = "Libertine" },
[51466] = { name = "Materialist Medicus" },
[51523] = { name = "Tolupist" },
[51587] = { name = "Galerius Natta, Prime Prospector" },
[51847] = { name = "Calchas of Colchis, Avian Auspex" },
[51851] = { name = "Sartorist" },
[64949] = { name = "Preacher" },
[64950] = { name = "Scholast" },
[64951] = { name = "Optimate" },
[64964] = { name = "Senuacus, Dousing Dozer" },
[71552] = { name = "Steerswoman" },
[71571] = { name = "Gastraphetus, Ballistic Brave" },
[92874] = { name = "Titus Faber, Master of Tasks" },
[106539] = { name = "Upholder" },
[106549] = { name = "Wareholder" },
[106710] = { name = "High-strung Conductor" },
[106712] = { name = "Farah, Iconic Emissary" },
[106714] = { name = "Abiding Closehauler" },
[140338] = { name = "Cursory Bursarius" },
[140344] = { name = "Inflammatory Flamincia" },
[140388] = { name = "Ascendant Endorser" },
[140405] = { name = "Pharmacognostic" },
[140407] = { name = "Iron-Grade Ironist" }
}
local function log(message)
system.log(PREFIX .. tostring(message))
end
local function safe(callback)
local ok, value = pcall(callback)
if ok then return value end
return nil
end
local function read(object, key)
return safe(function()
return object and object[key]
end)
end
local function valueText(value)
if value == nil then return "nil" end
local ok, text = pcall(tostring, value)
if ok then return text end
return "<tostring-error>"
end
local function numberFrom(value)
local direct = tonumber(value)
if direct ~= nil then return direct end
return tonumber(valueText(value))
end
local function sameNativeValue(left, right)
return valueText(left) == valueText(right)
end
local function getGroup(propertyName)
if Properties == nil
or Properties[propertyName] == nil
or Scripts == nil
or type(Scripts.GetObjectGroupByProperty) ~= "function" then
return {}
end
return safe(function()
return Scripts:GetObjectGroupByProperty(
Properties[propertyName]
) or {}
end) or {}
end
local function countTable(source)
local count = 0
for _ in pairs(source or {}) do
count = count + 1
end
return count
end
local function normalizeGuid(value)
local direct = tonumber(value)
if direct ~= nil and direct > 0 then return direct end
for _, field in ipairs({
"GUID", "Guid", "ItemGUID", "ItemGuid",
"SpecialistGUID", "SpecialistGuid",
"AssetGUID", "AssetGuid",
"RefGUID", "RefGuid"
}) do
local candidate = tonumber(read(value, field))
if candidate ~= nil and candidate > 0 then
return candidate
end
end
return 0
end
local function assetInfo(guid)
guid = tonumber(guid) or 0
if guid <= 0 then
return {
guid = 0,
name = "",
rarity = "",
niche = "",
targets = "",
effects = "",
verified = false
}
end
local profile = VERIFIED_PROFILES[guid]
local known = KNOWN_SPECIALISTS[guid]
local asset = safe(function()
return type(ItemAssetData) == "function"
and ItemAssetData(guid) or nil
end)
local function clean(value)
local text = valueText(value)
if text == "nil" then return "" end
return text
end
local name = profile and profile.name
or known and known.name
or clean(read(asset, "Text"))
return {
guid = guid,
name = name,
rarity = profile and profile.rarity
or clean(read(asset, "Rarity")),
niche = profile and profile.niche
or clean(read(asset, "Niche")),
targets = profile and profile.targets
or clean(
read(asset, "FormattedTarget")
or read(asset, "Target")
),
effects = profile and profile.effects
or "<numerical profile not yet verified>",
verified = profile ~= nil
}
end
local function currentSession()
return valueText(safe(function()
return GameSession and GameSession.SessionGUID
end))
end
local function isOwned(object)
local owned = read(object, "IsOwnedByCurrentParticipant")
if owned ~= nil then return owned == true end
local owner = numberFrom(read(object, "Owner"))
return owner == 41
end
local function arrayHelper(arrayValue)
if arrayValue == nil then return nil end
local helperKey = string.match(
valueText(arrayValue),
"^(PhoenixArray<[^>]+>)"
)
if helperKey == nil then return nil end
local haloRoot = rawget(_G, "halo")
local helper = type(haloRoot) == "table"
and haloRoot[helperKey] or nil
if type(helper) ~= "table"
or type(helper.GetSize) ~= "function"
or type(helper.GetElement) ~= "function" then
return nil
end
return helper
end
local function arraySize(arrayValue)
local helper = arrayHelper(arrayValue)
if helper == nil then return 0 end
return tonumber(safe(function()
return helper.GetSize(arrayValue)
end)) or 0
end
local function arrayElement(arrayValue, index)
local helper = arrayHelper(arrayValue)
if helper == nil then return nil end
return safe(function()
return helper.GetElement(arrayValue, index)
end)
end
local function warehouseGrid()
local uiRoot = rawget(_G, "ui")
if uiRoot == nil then uiRoot = rawget(_G, "UI") end
return safe(function()
return uiRoot
and uiRoot.Scenes
and uiRoot.Scenes.OMKontorWarehouse
and uiRoot.Scenes.OMKontorWarehouse.SceneData
and uiRoot.Scenes.OMKontorWarehouse.SceneData.NewOMKontorWarehouse
and uiRoot.Scenes.OMKontorWarehouse.SceneData.NewOMKontorWarehouse.Storage
and uiRoot.Scenes.OMKontorWarehouse.SceneData.NewOMKontorWarehouse.Storage.ItemsGrid
end)
end
local function warehouseRow(button)
local base = read(button, "BaseData")
local tip = read(base, "InfoTip")
local interaction = read(button, "Interaction")
local context = read(interaction, "Context")
local guid = normalizeGuid(read(tip, "RefGUID"))
if guid == 0 then
guid = normalizeGuid(read(context, "Guid"))
end
local amount = tonumber(read(base, "Amount")) or 1
if amount < 1 then amount = 1 end
return {
guid = guid,
amount = amount,
itemType = valueText(read(base, "Type")),
icon = string.lower(valueText(read(base, "Icon")))
}
end
local function isSpecialistRow(row)
if row == nil or row.guid <= 0 then return false end
if KNOWN_SPECIALISTS[row.guid] ~= nil then
return true
end
if string.find(
row.icon,
"items_specialist",
1,
true
) then
return true
end
return row.itemType == "1353802289"
or row.itemType == "1439785852"
end
local SpecialistFinder = {
Cache = {},
StoredCache = {},
EmptySlotsCache = {},
SnapshotCache = {},
ScanChanges = {},
StoredRows = {},
ChangesReportReadySession = nil,
PageJumpTargets = {},
ActiveReportMarker = nil,
PendingReportJump = nil,
PendingJumpDelayTicks = 0,
PendingJumpReady = false,
JumpExecuting = false,
InfoTipWatch = nil,
ScrollBehaviorWatch = nil,
MenuPendingTicks = 0,
PopupWatchTicks = 0,
PendingMarker = nil,
MarkerSeenTick = nil,
WriteDone = false,
ScanReadySession = nil,
ScanReadySessions = {},
AutoScanResumeMarker = nil,
AutoScanResumeMode = nil,
AutoScanResumeTicks = 0,
AutoScanResumeInProgress = false,
MenuSessionActive = false,
MenuWasVisible = false,
ReportPopupSeenForCycle = false,
PopupWasVisible = false,
MenuReturnPendingTicks = 0,
ReturnRequestProbeTicks = 0,
ReturnRequestArmed = false,
ReturnStorylineIndex = 0,
ActiveReturnStorylineGUID = nil,
CloseDetectionTicks = 0,
WarehouseProbe = {
active = false,
ticks = 0,
warehouseID = nil,
warehouseIDText = "",
warehouseGUID = 0,
areaID = "",
areaName = "",
originalID = nil,
originalIDText = "",
selected = false,
jumpIssued = false
}
}
local function cacheSessionInventory(sessionGUID, rows)
local unique = {}
local copies = 0
for _, row in ipairs(rows) do
unique[row.guid] = true
copies = copies + 1
end
SpecialistFinder.Cache[sessionGUID] = {
rows = rows,
unique = unique,
copies = copies
}
local cachedSessions = 0
local cachedPlacements = 0
local cachedUnique = {}
for _, sessionData in pairs(SpecialistFinder.Cache) do
cachedSessions = cachedSessions + 1
cachedPlacements =
cachedPlacements + (sessionData.copies or 0)
for guid in pairs(sessionData.unique or {}) do
cachedUnique[guid] = true
end
end
log("EQUIPPED CACHE SUMMARY"
.. " | cachedSessions=" .. tostring(cachedSessions)
.. " | cachedPlacements=" .. tostring(cachedPlacements)
.. " | cachedUniqueSpecialists=" .. tostring(
countTable(cachedUnique)
)
.. " | instruction=switch province and press Ctrl+Alt+S again"
.. " to add another session")
end
local function scanCurrentSessionSockets()
local sessionGUID = currentSession()
local group = getGroup("ItemContainer")
local rows = {}
local emptyRows = {}
local buildings = 0
local buildingTypes = {}
local islands = {}
local unique = {}
local verifiedPlacements = 0
local validObjectIDs = 0
log("========== COMPLETE EQUIPPED INVENTORY START ==========")
log("EQUIPPED INVENTORY CONTEXT"
.. " | currentSession=" .. tostring(sessionGUID)
.. " | itemContainerObjects=" .. tostring(
countTable(group)
)
.. " | knownCampaniaSpecialists=" .. tostring(
countTable(KNOWN_SPECIALISTS)
)
.. " | verifiedProfiles=" .. tostring(
countTable(VERIFIED_PROFILES)
)
.. " | nativeIDHandling=true"
.. " | readOnly=true")
for _, object in pairs(group) do
if isOwned(object)
and valueText(read(object, "SessionGuid")) == sessionGUID then
local container = read(object, "ItemContainer")
local sockets = read(container, "Sockets")
if type(sockets) == "table"
and countTable(sockets) > 0 then
buildings = buildings + 1
local objectGUID =
numberFrom(read(object, "GUID")) or 0
local buildingAsset = assetInfo(objectGUID)
local shipOwner = read(object, "ShipModuleOwner")
local isShip = shipOwner ~= nil
local specialistHost = isShip
or objectGUID == 87351 -- Latium Guest House
or objectGUID == 31032 -- Latium Governor's Villa
or objectGUID == 89911 -- legacy/alternate Officium
or objectGUID == 31031 -- legacy/alternate Governor Villa
or objectGUID == 87350 -- Albion Officium (proven in 2026-08-09 log)
or objectGUID == 31050 -- Albion Governor Villa (proven in 2026-08-09 log)
local buildingType
if objectGUID == 87351 then
buildingType = "Guest House"
elseif objectGUID == 31032 then
buildingType = "Governor's Villa"
elseif objectGUID == 89911 or objectGUID == 87350 then
buildingType = "Officium"
elseif objectGUID == 31031 or objectGUID == 31050 then
buildingType = "Governor Villa"
elseif buildingAsset.name ~= "" then
buildingType = buildingAsset.name
else
buildingType =
"Socket Building " .. tostring(objectGUID)
end
buildingTypes[buildingType] =
(buildingTypes[buildingType] or 0) + 1
local area = read(object, "Area")
local areaID = valueText(read(area, "ID"))
local areaName = valueText(
read(area, "CityName")
)
islands[areaID .. ":" .. areaName] = true
local objectIDRaw = read(object, "ID")
local objectIDText = valueText(objectIDRaw)
if objectIDText ~= "nil"
and objectIDText ~= "0" then
validObjectIDs = validObjectIDs + 1
end
local objectName = valueText(
read(read(object, "Nameable"), "Name")
)
if objectName == "nil" then objectName = "" end
local seenSocketSlots = {}
for slotKey, socketValue in pairs(sockets) do
local normalizedSlot = tonumber(slotKey) or slotKey
seenSocketSlots[normalizedSlot] = true
local guid = normalizeGuid(socketValue)
if guid > 0 then
local info = assetInfo(guid)
unique[guid] = true
if info.verified then
verifiedPlacements =
verifiedPlacements + 1
end
local row = {
sessionGUID = sessionGUID,
areaID = areaID,
areaName = areaName,
buildingType = buildingType,
buildingGUID = objectGUID,
objectIDRaw = objectIDRaw,
objectID = objectIDText,
objectName = objectName,
slot = normalizedSlot,
guid = guid,
name = info.name,
rarity = info.rarity,
niche = info.niche,
targets = info.targets,
effects = info.effects,
verified = info.verified,
isShip = isShip
}
rows[#rows + 1] = row
elseif specialistHost then
emptyRows[#emptyRows + 1] = {
sessionGUID = sessionGUID,
areaID = areaID,
areaName = areaName,
buildingType = buildingType,
buildingGUID = objectGUID,
objectIDRaw = objectIDRaw,
objectID = objectIDText,
objectName = objectName,
slot = normalizedSlot,
isShip = isShip
}
end
end
-- Anno omits empty specialist socket positions from CPropertyItemContainer.Sockets
-- for several specialist hosts. Reconstruct only where an omitted position is proven to
-- represent a usable empty socket. Guest House and Officium are proven at three positions.
-- Governor Villa missing positions are NOT inferred: prestige can keep a slot locked, and
-- an omitted Villa socket therefore cannot safely be called an empty opportunity.
local expectedHostSlots = 0
if objectGUID == 87351 then expectedHostSlots = 3
elseif objectGUID == 87350 or objectGUID == 89911 then expectedHostSlots = 3
end
if expectedHostSlots > 0 then
for expectedSlot = 1, expectedHostSlots do
if not seenSocketSlots[expectedSlot] then
emptyRows[#emptyRows + 1] = {
sessionGUID = sessionGUID,
areaID = areaID,
areaName = areaName,
buildingType = buildingType,
buildingGUID = objectGUID,
objectIDRaw = objectIDRaw,
objectID = objectIDText,
objectName = objectName,
slot = expectedSlot,
isShip = false,
inferredMissingSocket = true
}
end
end
end
end
end
end
table.sort(rows, function(a, b)
if a.areaName ~= b.areaName then
return a.areaName < b.areaName
end
if a.buildingType ~= b.buildingType then
return a.buildingType < b.buildingType
end
if a.objectName ~= b.objectName then
return a.objectName < b.objectName
end
if a.objectID ~= b.objectID then
return a.objectID < b.objectID
end
return tostring(a.slot) < tostring(b.slot)
end)
table.sort(emptyRows, function(a,b)
if a.sessionGUID ~= b.sessionGUID then return tostring(a.sessionGUID) < tostring(b.sessionGUID) end
if a.areaName ~= b.areaName then return tostring(a.areaName) < tostring(b.areaName) end
if a.buildingType ~= b.buildingType then return tostring(a.buildingType) < tostring(b.buildingType) end
if a.objectName ~= b.objectName then return tostring(a.objectName) < tostring(b.objectName) end
return tostring(a.slot) < tostring(b.slot)
end)
SpecialistFinder.EmptySlotsCache[sessionGUID] = emptyRows
log("EMPTY SPECIALIST SLOT SUMMARY"
.. " | session="..tostring(sessionGUID)
.. " | detectedEmptySlots="..tostring(#emptyRows)
.. " | specialistHostsOnly=true"
.. " | shipDetection=ShipModuleOwner"
.. " | readOnly=true")
for _,er in ipairs(emptyRows) do
log("EMPTY SPECIALIST SLOT"
.. " | session="..tostring(er.sessionGUID)
.. " | areaName="..tostring(er.areaName)
.. " | buildingType="..tostring(er.buildingType)
.. " | objectName="..tostring(er.objectName)
.. " | objectID="..tostring(er.objectID)
.. " | slot="..tostring(er.slot)
.. " | isShip="..tostring(er.isShip))
end

for _, row in ipairs(rows) do
log("EQUIPPED SPECIALIST"
.. " | sessionGUID=" .. tostring(row.sessionGUID)
.. " | areaID=" .. tostring(row.areaID)
.. " | areaName=" .. tostring(row.areaName)
.. " | buildingType=" .. tostring(row.buildingType)
.. " | objectName=" .. tostring(row.objectName)
.. " | buildingGUID=" .. tostring(row.buildingGUID)
.. " | objectID=" .. tostring(row.objectID)
.. " | slot=" .. tostring(row.slot)
.. " | guid=" .. tostring(row.guid)
.. " | name=" .. tostring(row.name)
.. " | rarity=" .. tostring(row.rarity)
.. " | niche=" .. tostring(row.niche)
.. " | targets=" .. tostring(row.targets)
.. " | effectProfileVerified=" .. tostring(
row.verified
)
.. " | effects=" .. tostring(row.effects))
end
local buildingTypeRows = {}
for name, count in pairs(buildingTypes) do
buildingTypeRows[#buildingTypeRows + 1] =
tostring(name) .. "=" .. tostring(count)
end
table.sort(buildingTypeRows)
log("COMPLETE EQUIPPED INVENTORY SUMMARY"
.. " | currentSession=" .. tostring(sessionGUID)
.. " | socketBuildings=" .. tostring(buildings)
.. " | buildingsWithValidObjectID=" .. tostring(
validObjectIDs
)
.. " | equippedPlacements=" .. tostring(#rows)
.. " | uniqueSpecialistGUIDs=" .. tostring(
countTable(unique)
)
.. " | islands=" .. tostring(countTable(islands))
.. " | verifiedEffectPlacements=" .. tostring(
verifiedPlacements
)
.. " | buildingTypes=" .. table.concat(
buildingTypeRows,
"; "
)
.. " | exactSlots=true"
.. " | nativeObjectIDs=true"
.. " | windowRequired=false"
.. " | readOnly=true")
cacheSessionInventory(sessionGUID, rows)
log("========== COMPLETE EQUIPPED INVENTORY END ==========")
end
local function currentSelectedObjectID()
local candidates = {
safe(function()
return Selection
and Selection.Object
and Selection.Object.ID
end),
safe(function()
return Selection
and Selection.PickedObject
and Selection.PickedObject.ID
end),
safe(function()
return Selection and Selection.SelectedObjectID
end)
}
for _, value in ipairs(candidates) do
local textValue = valueText(value)
if textValue ~= "nil" and textValue ~= "0" then
return value
end
end
return nil
end
local function firstMainWarehouse()
local sessionGUID = currentSession()
local candidates = {}
local group = getGroup("Warehouse")
local ownedInSession = 0
local mainGUIDMatches = 0
local warehousePropertyMatches = 0
local validIDMatches = 0
for _, object in pairs(group) do
if isOwned(object)
and valueText(read(object, "SessionGuid")) == sessionGUID then
ownedInSession = ownedInSession + 1
local guid = numberFrom(read(object, "GUID")) or 0
local warehouseProperty = read(object, "Warehouse")
if warehouseProperty ~= nil then
warehousePropertyMatches =
warehousePropertyMatches + 1
end
if guid == 3406 then
mainGUIDMatches = mainGUIDMatches + 1
end
local objectIDRaw = read(object, "ID")
local objectIDText = valueText(objectIDRaw)
local validID = objectIDText ~= "nil"
and objectIDText ~= "0"
if validID then
validIDMatches = validIDMatches + 1
end
if validID
and (guid == 3406 or warehouseProperty ~= nil) then
local area = read(object, "Area")
candidates[#candidates + 1] = {
object = object,
objectID = objectIDRaw,
objectIDText = objectIDText,
objectGUID = guid,
areaID = valueText(read(area, "ID")),
areaName = valueText(read(area, "CityName")),
preferred = guid == 3406 and 0 or 1
}
end
end
end
table.sort(candidates, function(a, b)
if a.preferred ~= b.preferred then
return a.preferred < b.preferred
end
if a.areaName ~= b.areaName then
return a.areaName < b.areaName
end
return a.objectIDText < b.objectIDText
end)
log("AUTO-WAREHOUSE CANDIDATE SUMMARY"
.. " | currentSession=" .. tostring(sessionGUID)
.. " | warehouseGroupObjects=" .. tostring(
countTable(group)
)
.. " | ownedInCurrentSession=" .. tostring(
ownedInSession
)
.. " | mainGUID3406Matches=" .. tostring(
mainGUIDMatches
)
.. " | warehousePropertyMatches=" .. tostring(
warehousePropertyMatches
)
.. " | validNativeIDs=" .. tostring(
validIDMatches
)
.. " | candidates=" .. tostring(#candidates))
return candidates[1]
end
local function logWarehouseGrid(grid, probe)
local types = 0
local copies = 0
local unique = {}
for index = 0, arraySize(grid) - 1 do
local row = warehouseRow(arrayElement(grid, index))
if isSpecialistRow(row) then
local info = assetInfo(row.guid)
types = types + 1
copies = copies + row.amount
unique[row.guid] = true
local storedInfo = assetInfo(row.guid)
SpecialistFinder.StoredRows[#SpecialistFinder.StoredRows + 1] = {
sessionGUID = currentSession(),
areaID = probe.areaID,
areaName = probe.areaName,
warehouseIDRaw = probe.warehouseID,
warehouseID = probe.warehouseIDText,
guid = row.guid,
amount = row.amount,
name = storedInfo.name,
rarity = storedInfo.rarity,
niche = storedInfo.niche,
targets = storedInfo.targets,
effects = storedInfo.effects,
verified = storedInfo.verified
}
log("AUTO-WAREHOUSE STORED SPECIALIST"
.. " | areaID=" .. tostring(probe.areaID)
.. " | areaName=" .. tostring(probe.areaName)
.. " | warehouseID=" .. tostring(
probe.warehouseIDText
)
.. " | rowIndex=" .. tostring(index)
.. " | guid=" .. tostring(row.guid)
.. " | name=" .. tostring(info.name)
.. " | quantity=" .. tostring(row.amount)
.. " | rarity=" .. tostring(info.rarity)
.. " | niche=" .. tostring(info.niche)
.. " | targets=" .. tostring(info.targets)
.. " | effectProfileVerified=" .. tostring(
info.verified
)
.. " | effects=" .. tostring(info.effects))
end
end
log("AUTO-WAREHOUSE CAPTURE SUCCESS"
.. " | areaID=" .. tostring(probe.areaID)
.. " | areaName=" .. tostring(probe.areaName)
.. " | warehouseID=" .. tostring(probe.warehouseIDText)
.. " | specialistTypes=" .. tostring(types)
.. " | totalCopies=" .. tostring(copies)
.. " | uniqueSpecialistGUIDs=" .. tostring(
countTable(unique)
)
.. " | selectionOnly=true"
.. " | unknownClicks=false")
end
local function restoreOriginalSelection(probe)
if probe.originalID == nil
or sameNativeValue(
probe.originalID,
probe.warehouseID
) then
return
end
safe(function()
if Selection
and type(Selection.SelectByID) == "function" then
Selection:SelectByID(probe.originalID)
end
end)
safe(function()
if Scripts
and type(Scripts.JumpToObject) == "function" then
Scripts:JumpToObject(probe.originalID)
end
end)
log("AUTO-WAREHOUSE RESTORE"
.. " | originalObjectID=" .. tostring(
probe.originalIDText
))
end
local function finishWarehouseProbe(reason)
local probe = SpecialistFinder.WarehouseProbe
log("AUTO-WAREHOUSE PROBE SUMMARY"
.. " | reason=" .. tostring(reason)
.. " | ticks=" .. tostring(probe.ticks)
.. " | warehouseID=" .. tostring(
probe.warehouseIDText
)
.. " | warehouseGUID=" .. tostring(
probe.warehouseGUID
)
.. " | areaID=" .. tostring(probe.areaID)
.. " | areaName=" .. tostring(probe.areaName)
.. " | selected=" .. tostring(probe.selected)
.. " | jumpIssued=" .. tostring(
probe.jumpIssued
)
.. " | readOnlyInventory=true"
.. " | reversibleSelection=true")
restoreOriginalSelection(probe)
SpecialistFinder.WarehouseProbe = {
active = false,
ticks = 0,
warehouseID = nil,
warehouseIDText = "",
warehouseGUID = 0,
areaID = "",
areaName = "",
originalID = nil,
originalIDText = "",
selected = false,
jumpIssued = false
}
end
function SpecialistFinder:StartWarehouseProbe()
if self.WarehouseProbe.active then
log("AUTO-WAREHOUSE PROBE"
.. " | reason=already active")
return true
end
local warehouse = firstMainWarehouse()
if warehouse == nil or warehouse.objectID == nil then
log("AUTO-WAREHOUSE PROBE ERROR"
.. " | reason=no usable owned warehouse"
.. " in current session after native-ID scan")
return true
end
local originalID = currentSelectedObjectID()
self.WarehouseProbe = {
active = true,
ticks = 0,
warehouseID = warehouse.objectID,
warehouseIDText = warehouse.objectIDText,
warehouseGUID = warehouse.objectGUID,
areaID = warehouse.areaID,
areaName = warehouse.areaName,
originalID = originalID,
originalIDText = valueText(originalID),
selected = false,
jumpIssued = false
}
log("========== AUTO-WAREHOUSE SELECTION PROBE START ==========")
log("AUTO-WAREHOUSE TARGET"
.. " | currentSession=" .. tostring(
currentSession()
)
.. " | areaID=" .. tostring(warehouse.areaID)
.. " | areaName=" .. tostring(
warehouse.areaName
)
.. " | warehouseGUID=" .. tostring(
warehouse.objectGUID
)
.. " | warehouseID=" .. tostring(
warehouse.objectIDText
)
.. " | originalObjectID=" .. tostring(
self.WarehouseProbe.originalIDText
)
.. " | nativeIDPreserved=true"
.. " | method=Selection.SelectByID"
.. " plus Scripts.JumpToObject"
.. " | no click or activation method used")
self.WarehouseProbe.selected =
safe(function()
if Selection
and type(Selection.SelectByID) == "function" then
Selection:SelectByID(warehouse.objectID)
return true
end
return false
end) == true
self.WarehouseProbe.jumpIssued =
safe(function()
if Scripts
and type(Scripts.JumpToObject) == "function" then
Scripts:JumpToObject(warehouse.objectID)
return true
end
return false
end) == true
return true
end
local function truncateText(value, limit)
local textValue = valueText(value)
limit = limit or 900
if #textValue <= limit then return textValue end
return string.sub(textValue, 1, limit) .. "...<truncated>"
end
local function helperKeyFor(arrayValue)
return string.match(
valueText(arrayValue),
"^(PhoenixArray<[^>]+>)"
) or ""
end
local function typeInfoText(object)
for _, functionName in ipairs({
"getTypeInfo",
"getTypeInfoDeprecated"
}) do
local inspector = rawget(_G, functionName)
if type(inspector) == "function" then
local result = safe(function()
return inspector(object)
end)
if result ~= nil then
log("WAREHOUSE UI TYPEINFO"
.. " | function=" .. tostring(functionName)
.. " | object=" .. truncateText(object, 180)
.. " | value=" .. truncateText(result, 1400))
end
end
end
end
local function fieldSummary(object, fields)
local rows = {}
for _, field in ipairs(fields) do
local value = read(object, field)
if value ~= nil then
rows[#rows + 1] =
tostring(field) .. "=" .. truncateText(value, 220)
end
end
return table.concat(rows, "; ")
end
local function inspectInteraction(label, interaction)
if interaction == nil then return end
log("WAREHOUSE UI INTERACTION"
.. " | label=" .. tostring(label)
.. " | value=" .. truncateText(interaction, 220)
.. " | fields=" .. fieldSummary(
interaction,
{
"IsSelected", "IsFocused", "IsEnabled",
"IsLocked", "AppearDisabled", "Context",
"Tooltip", "InfoTip", "Action", "Index",
"ID", "Guid", "GUID"
}
))
typeInfoText(interaction)
local context = read(interaction, "Context")
if context ~= nil then
log("WAREHOUSE UI CONTEXT"
.. " | label=" .. tostring(label)
.. " | value=" .. truncateText(context, 300)
.. " | fields=" .. fieldSummary(
context,
{
"Index", "ID", "Guid", "GUID",
"Type", "Value", "Text", "Name",
"Tab", "Filter", "Category"
}
))
typeInfoText(context)
end
end
local function inspectArrayValue(label, arrayValue, maxElements)
local helperKey = helperKeyFor(arrayValue)
local helper = arrayHelper(arrayValue)
local size = arraySize(arrayValue)
log("WAREHOUSE UI ARRAY"
.. " | label=" .. tostring(label)
.. " | valueType=" .. type(arrayValue)
.. " | value=" .. truncateText(arrayValue, 240)
.. " | helperKey=" .. tostring(helperKey)
.. " | helperAvailable=" .. tostring(helper ~= nil)
.. " | size=" .. tostring(size))
typeInfoText(arrayValue)
if helper == nil then
if type(arrayValue) == "table" then
log("WAREHOUSE UI TABLE"
.. " | label=" .. tostring(label)
.. " | entries=" .. tostring(countTable(arrayValue)))
end
return size
end
local limit = math.min(size, maxElements or 12)
for index = 0, limit - 1 do
local element = arrayElement(arrayValue, index)
log("WAREHOUSE UI ARRAY ELEMENT"
.. " | label=" .. tostring(label)
.. " | index=" .. tostring(index)
.. " | valueType=" .. type(element)
.. " | value=" .. truncateText(element, 220)
.. " | fields=" .. fieldSummary(
element,
{
"Text", "Label", "Name", "Headline",
"IsSelected", "IsActive", "IsEnabled",
"AppearDisabled", "Index", "Value",
"Type", "Guid", "GUID", "ID",
"Icon", "Tooltip", "InfoTip",
"FocusedIndex", "SelectedIndex"
}
))
typeInfoText(element)
local interaction =
read(element, "Interaction")
or read(element, "InteractionData")
or read(element, "ButtonInteraction")
inspectInteraction(
tostring(label) .. "[" .. tostring(index) .. "]",
interaction
)
end
return size
end
local function warehouseStorage()
local uiRoot = rawget(_G, "ui")
if uiRoot == nil then uiRoot = rawget(_G, "UI") end
return safe(function()
return uiRoot
and uiRoot.Scenes
and uiRoot.Scenes.OMKontorWarehouse
and uiRoot.Scenes.OMKontorWarehouse.SceneData
and uiRoot.Scenes.OMKontorWarehouse.SceneData.NewOMKontorWarehouse
and uiRoot.Scenes.OMKontorWarehouse.SceneData.NewOMKontorWarehouse.Storage
end)
end
local function rawTypeInfo(object)
local inspector = rawget(_G, "getTypeInfo")
if type(inspector) ~= "function" then return nil end
return safe(function()
return inspector(object)
end)
end
local function discoverObjectProperties(label, object, maxProperties)
if object == nil then
log("WAREHOUSE ACTION OBJECT"
.. " | label=" .. tostring(label)
.. " | available=false")
return
end
local info = rawTypeInfo(object)
log("WAREHOUSE ACTION OBJECT"
.. " | label=" .. tostring(label)
.. " | available=true"
.. " | valueType=" .. tostring(type(object))
.. " | value=" .. truncateText(object, 260)
.. " | typeInfo=" .. truncateText(info, 1800))
if type(info) ~= "string" then return end
local names = {}
local seen = {}
for name in string.gmatch(info, '\"([%w_]+)\"%s*:%s*%{\"Alias\"') do
if not seen[name] then
seen[name] = true
names[#names + 1] = name
end
end
table.sort(names)
local limit = math.min(#names, maxProperties or 40)
for index = 1, limit do
local name = names[index]
local value = read(object, name)
log("WAREHOUSE ACTION PROPERTY"
.. " | owner=" .. tostring(label)
.. " | name=" .. tostring(name)
.. " | valueType=" .. tostring(type(value))
.. " | value=" .. truncateText(value, 300))
if value ~= nil
and (type(value) == "userdata" or type(value) == "table") then
local nestedInfo = rawTypeInfo(value)
if nestedInfo ~= nil then
log("WAREHOUSE ACTION PROPERTY TYPEINFO"
.. " | owner=" .. tostring(label)
.. " | name=" .. tostring(name)
.. " | typeInfo=" .. truncateText(nestedInfo, 1300))
end
end
end
log("WAREHOUSE ACTION PROPERTY SUMMARY"
.. " | owner=" .. tostring(label)
.. " | discovered=" .. tostring(#names)
.. " | logged=" .. tostring(limit))
end
local function inspectNamedGlobalService(name, value)
log("WAREHOUSE GLOBAL CAPABILITY"
.. " | name=" .. tostring(name)
.. " | valueType=" .. tostring(type(value))
.. " | value=" .. truncateText(value, 260))
local info = rawTypeInfo(value)
if info ~= nil then
log("WAREHOUSE GLOBAL CAPABILITY TYPEINFO"
.. " | name=" .. tostring(name)
.. " | typeInfo=" .. truncateText(info, 3000))
end
local mt = safe(function() return getmetatable(value) end)
if mt ~= nil then
log("WAREHOUSE GLOBAL CAPABILITY METATABLE"
.. " | name=" .. tostring(name)
.. " | metatableType=" .. tostring(type(mt))
.. " | metatable=" .. truncateText(mt, 1000)
.. " | metatableTypeInfo=" .. truncateText(rawTypeInfo(mt), 1800))
end
local candidateNames = {
"ProcessEvent", "FireShortcut", "TriggerShortcut", "ExecuteShortcut",
"Press", "Release", "Click", "MouseClick", "SendInput", "InjectInput",
"SetCursorPosition", "GetCursorPosition", "Activate", "Select", "Interact"
}
local found = {}
for _, candidateName in ipairs(candidateNames) do
local candidate = read(value, candidateName)
if candidate ~= nil then
found[#found + 1] = candidateName .. ":" .. tostring(type(candidate))
end
end
log("WAREHOUSE GLOBAL NAMED MEMBER PROBE"
.. " | name=" .. tostring(name)
.. " | members=" .. table.concat(found, ","))
if type(value) ~= "table" then return end
local rows = {}
local ok = pcall(function()
for key, candidate in pairs(value) do
local lower = string.lower(tostring(key))
if type(candidate) == "function"
and (
string.find(lower, "input", 1, true)
or string.find(lower, "shortcut", 1, true)
or string.find(lower, "click", 1, true)
or string.find(lower, "press", 1, true)
or string.find(lower, "action", 1, true)
or string.find(lower, "interact", 1, true)
or string.find(lower, "select", 1, true)
or string.find(lower, "activate", 1, true)
or string.find(lower, "tab", 1, true)
) then
rows[#rows + 1] = tostring(key)
end
end
end)
table.sort(rows)
log("WAREHOUSE GLOBAL FUNCTION SUMMARY"
.. " | name=" .. tostring(name)
.. " | pairsReadable=" .. tostring(ok)
.. " | matchingFunctions=" .. table.concat(rows, ","))
end
local function inspectWarehouseActionLayer()
log("========== WAREHOUSE ACTION LAYER DISCOVERY START ==========")
local uiRoot = rawget(_G, "ui") or rawget(_G, "UI")
local scene = safe(function()
return uiRoot and uiRoot.Scenes and uiRoot.Scenes.OMKontorWarehouse
end)
local sceneData = safe(function()
return scene and scene.SceneData
end)
local warehouseData = safe(function()
return sceneData and sceneData.NewOMKontorWarehouse
end)
local storage = safe(function()
return warehouseData and warehouseData.Storage
end)
discoverObjectProperties("OMKontorWarehouse.Scene", scene, 50)
discoverObjectProperties("OMKontorWarehouse.SceneData", sceneData, 50)
discoverObjectProperties("NewOMKontorWarehouse", warehouseData, 80)
discoverObjectProperties("NewOMKontorWarehouse.Storage", storage, 40)
local globalMatches = {}
local ok = pcall(function()
for key, value in pairs(_G) do
local name = tostring(key)
local lower = string.lower(name)
if string.find(lower, "input", 1, true)
or string.find(lower, "shortcut", 1, true)
or string.find(lower, "mouse", 1, true)
or string.find(lower, "keyboard", 1, true)
or string.find(lower, "cursor", 1, true)
or string.find(lower, "interaction", 1, true)
or string.find(lower, "uiaction", 1, true)
or string.find(lower, "navigation", 1, true) then
globalMatches[#globalMatches + 1] = { name = name, value = value }
end
end
end)
table.sort(globalMatches, function(a, b)
return a.name < b.name
end)
log("WAREHOUSE GLOBAL DISCOVERY SUMMARY"
.. " | pairsReadable=" .. tostring(ok)
.. " | matches=" .. tostring(#globalMatches)
.. " | policy=read-only-capability-discovery")
local limit = math.min(#globalMatches, 40)
for index = 1, limit do
inspectNamedGlobalService(
globalMatches[index].name,
globalMatches[index].value
)
end
log("========== WAREHOUSE ACTION LAYER DISCOVERY END ==========")
end
local function inspectWarehouseState(tick)
local storage = warehouseStorage()
log("========== WAREHOUSE UI STATE START ==========")
log("WAREHOUSE UI STATE"
.. " | tick=" .. tostring(tick)
.. " | storageAvailable=" .. tostring(storage ~= nil)
.. " | storage=" .. truncateText(storage, 220))
if storage == nil then
log("========== WAREHOUSE UI STATE END ==========")
return
end
typeInfoText(storage)
log("WAREHOUSE UI STORAGE FIELDS"
.. " | tick=" .. tostring(tick)
.. " | fields=" .. fieldSummary(
storage,
{
"FocusedIndex", "ScrollPosition",
"SelectedIndex", "ActiveTabIndex",
"CurrentTab", "SearchInput"
}
))
for _, field in ipairs({
"Tabs",
"GoodsFilter",
"ItemsFilter",
"ItemsFilter02",
"GoodsGrid",
"ItemsGrid"
}) do
local value = read(storage, field)
local maxElements =
(field == "ItemsGrid" or field == "GoodsGrid")
and 4 or 16
inspectArrayValue(
"Storage." .. tostring(field),
value,
maxElements
)
end
local goodsSize = arraySize(read(storage, "GoodsGrid"))
local itemsSize = arraySize(read(storage, "ItemsGrid"))
log("WAREHOUSE UI GRID COMPARISON"
.. " | tick=" .. tostring(tick)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | conclusion="
.. (
goodsSize > 0
and itemsSize == 0
and "goods-view-likely-active"
or "needs-structure-review"
))
log("========== WAREHOUSE UI STATE END ==========")
end
local AUTO_ITEMS_METHOD_CANDIDATES = {
{ target = "Tabs", method = "SetSelectedIndex", argument = 2 },
{ target = "Tabs", method = "SelectIndex", argument = 2 },
{ target = "Tabs", method = "SetActiveIndex", argument = 2 },
{ target = "Tabs", method = "ActivateIndex", argument = 2 },
{ target = "Tabs", method = "SelectTab", argument = 2 },
{ target = "Tabs", method = "ActivateTab", argument = 2 },
{ target = "Tabs", method = "SetTab", argument = 2 },
{ target = "Tabs", method = "ChangeTab", argument = 2 },
{ target = "Storage", method = "SetSelectedIndex", argument = 2 },
{ target = "Storage", method = "SetActiveTabIndex", argument = 2 },
{ target = "Storage", method = "SelectTab", argument = 2 },
{ target = "Storage", method = "ActivateTab", argument = 2 },
{ target = "Storage", method = "ChangeTab", argument = 2 },
{ target = "Storage", method = "OpenItems", noArgument = true },
{ target = "Storage", method = "ShowItems", noArgument = true },
{ target = "Storage", method = "OpenItemsTab", noArgument = true },
{ target = "Storage", method = "ShowItemsTab", noArgument = true }
}
local function automaticItemsTarget(storage, targetName)
if targetName == "Tabs" then
return read(storage, "Tabs")
end
return storage
end
local function discoverAutomaticItemsMethods(probe, storage)
probe.autoItemsCandidates = {}
probe.autoItemsCandidateIndex = 0
probe.autoItemsSuccess = false
probe.autoItemsInspectDone = true
local tabs = read(storage, "Tabs")
log("AUTO ITEMS INITIALIZATION READY"
.. " | selectedIndexBefore=" .. valueText(read(tabs, "SelectedIndex"))
.. " | itemsGridSizeBefore=" .. tostring(arraySize(read(storage, "ItemsGrid")))
.. " | method=Tabs.SelectedIndex write plus one UI tick wait"
.. " | manualClickExpected=false")
end
local function attemptNextAutomaticItemsMethod(probe, storage)
probe.autoItemsCandidateIndex = (probe.autoItemsCandidateIndex or 0) + 1
local candidate = probe.autoItemsCandidates
and probe.autoItemsCandidates[probe.autoItemsCandidateIndex]
or nil
if candidate == nil then
return false
end
local target = automaticItemsTarget(storage, candidate.target)
local methodValue = read(target, candidate.method)
local ok, resultOrError = pcall(function()
if candidate.noArgument then
return methodValue(target)
end
return methodValue(target, candidate.argument)
end)
probe.autoItemsAttemptTick = probe.ticks
probe.autoItemsCurrentMethod = tostring(candidate.target)
.. "." .. tostring(candidate.method)
log("AUTO ITEMS METHOD ATTEMPT"
.. " | number=" .. tostring(probe.autoItemsCandidateIndex)
.. " | total=" .. tostring(#probe.autoItemsCandidates)
.. " | method=" .. tostring(probe.autoItemsCurrentMethod)
.. " | argument=" .. tostring(candidate.noArgument and "none" or candidate.argument)
.. " | callSuccess=" .. tostring(ok)
.. " | returnOrError=" .. truncateText(resultOrError, 300)
.. " | inventoryMutation=false")
return true
end
local function allMainWarehouses()
local sessionGUID = currentSession()
local byArea = {}
local ownedWarehouseObjects = 0
for _, object in pairs(getGroup("Warehouse")) do
if isOwned(object)
and valueText(read(object, "SessionGuid")) == sessionGUID then
local warehouseProperty = read(object, "Warehouse")
local objectID = read(object, "ID")
local objectIDText = valueText(objectID)
local area = read(object, "Area")
local areaID = valueText(read(area, "ID"))
local areaName = valueText(read(area, "CityName"))
local guid = numberFrom(read(object, "GUID")) or 0
local validID = objectID ~= nil and objectIDText ~= "nil" and objectIDText ~= "0"
local validArea = areaID ~= "" and areaID ~= "nil" and areaID ~= "0"
if warehouseProperty ~= nil and validID and validArea then
ownedWarehouseObjects = ownedWarehouseObjects + 1
local candidate = {
object = object,
objectID = objectID,
objectIDText = objectIDText,
objectGUID = guid,
areaID = areaID,
areaName = areaName,
preferred = guid == 3406 and 0 or 1
}
local existing = byArea[areaID]
if existing == nil
or candidate.preferred < existing.preferred
or (candidate.preferred == existing.preferred and candidate.objectIDText < existing.objectIDText) then
byArea[areaID] = candidate
end
end
end
end
local candidates = {}
for _, candidate in pairs(byArea) do candidates[#candidates + 1] = candidate end
table.sort(candidates, function(a, b)
if a.areaName ~= b.areaName then return a.areaName < b.areaName end
return a.objectIDText < b.objectIDText
end)
local guidSummary = {}
for _, candidate in ipairs(candidates) do
local key=tostring(candidate.objectGUID or 0)
guidSummary[key]=(guidSummary[key] or 0)+1
end
local guidParts={}
for guid,count in pairs(guidSummary) do guidParts[#guidParts+1]=guid.."x"..tostring(count) end
table.sort(guidParts)
log("PROVINCE-NEUTRAL WAREHOUSE LIST"
.. " | session="..tostring(sessionGUID)
.. " | ownedWarehouseObjects="..tostring(ownedWarehouseObjects)
.. " | uniqueAreas="..tostring(#candidates)
.. " | selectedGUIDs="..table.concat(guidParts, ",")
.. " | rule=one warehouse-capable object per island; prefer Roman main GUID 3406 when present")
return candidates
end
local function updateProbeTarget(probe, target)
probe.warehouseID = target.objectID
probe.warehouseIDText = target.objectIDText
probe.warehouseGUID = target.objectGUID or 0
probe.areaID = target.areaID
probe.areaName = target.areaName
end
local function selectWarehouseTarget(probe, target, reason)
updateProbeTarget(probe, target)
local selected = safe(function()
if Selection
and type(Selection.SelectByID) == "function" then
Selection:SelectByID(target.objectID)
return true
end
return false
end) == true
local jumped = safe(function()
if Scripts
and type(Scripts.JumpToObject) == "function" then
Scripts:JumpToObject(target.objectID)
return true
end
return false
end) == true
log("MULTI-WAREHOUSE TARGET"
.. " | reason=" .. tostring(reason)
.. " | index=" .. tostring(probe.currentIndex)
.. " | total=" .. tostring(#probe.candidates)
.. " | areaID=" .. tostring(target.areaID)
.. " | areaName=" .. tostring(target.areaName)
.. " | warehouseID=" .. tostring(target.objectIDText)
.. " | selected=" .. tostring(selected)
.. " | jumpIssued=" .. tostring(jumped))
probe.selected = selected
probe.jumpIssued = jumped
probe.switchTick = probe.ticks
probe.phase = "wait-after-switch"
end
local function captureCurrentWarehouse(probe, storage, reason)
local itemsGrid = read(storage, "ItemsGrid")
local itemsSize = arraySize(itemsGrid)
local goodsSize = arraySize(read(storage, "GoodsGrid"))
local selectedIndex = valueText(
read(read(storage, "Tabs"), "SelectedIndex")
)
log("MULTI-WAREHOUSE ITEMS READY"
.. " | reason=" .. tostring(reason)
.. " | index=" .. tostring(probe.currentIndex)
.. " | areaID=" .. tostring(probe.areaID)
.. " | areaName=" .. tostring(probe.areaName)
.. " | warehouseID=" .. tostring(probe.warehouseIDText)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize))
logWarehouseGrid(itemsGrid, probe)
probe.capturedWarehouses =
(probe.capturedWarehouses or 0) + 1
probe.lastCapturedIndex = probe.currentIndex
end
local function snapshotLocationSignature(row)
return tostring(row.areaID or "").."|"..tostring(row.objectID or "").."|"..tostring(row.slot or "")
end
local function snapshotSetSignature(set)
local parts={}
for key in pairs(set or {}) do parts[#parts+1]=key end
table.sort(parts)
return table.concat(parts,";")
end
local function buildSessionSnapshot(session)
local byGuid={}
local storedRows=SpecialistFinder.StoredCache[session] or {}
for _,row in ipairs(storedRows) do
local a=byGuid[row.guid]
if not a then
a={guid=row.guid,name=row.name or "",stored=0,equipped=0,locations={}}
byGuid[row.guid]=a
end
a.stored=a.stored+(row.amount or 1)
if (not a.name or a.name=="") and row.name then a.name=row.name end
end
local sessionData=SpecialistFinder.Cache[session]
for _,row in ipairs(sessionData and sessionData.rows or {}) do
local a=byGuid[row.guid]
if not a then
a={guid=row.guid,name=row.name or "",stored=0,equipped=0,locations={}}
byGuid[row.guid]=a
end
a.equipped=a.equipped+1
a.locations[snapshotLocationSignature(row)]=true
if (not a.name or a.name=="") and row.name then a.name=row.name end
end
for _,a in pairs(byGuid) do
a.total=a.stored+a.equipped
a.locationSignature=snapshotSetSignature(a.locations)
end
return byGuid
end
local function finalizeScanCachesAndChanges()
local session=currentSession()
SpecialistFinder.StoredCache[session]=SpecialistFinder.StoredRows
local current=buildSessionSnapshot(session)
local previous=SpecialistFinder.SnapshotCache[session]
local changes={baseline=previous==nil,acquired={},lost={},newlyEquipped={},becameUnused={},moved={},newEmptySlots={},filledSlots={},replacedSlots={}}
if previous then
local union={}
for guid in pairs(previous) do union[guid]=true end
for guid in pairs(current) do union[guid]=true end
for guid in pairs(union) do
local p=previous[guid] or {guid=guid,name="",stored=0,equipped=0,total=0,locationSignature=""}
local c=current[guid] or {guid=guid,name=p.name,stored=0,equipped=0,total=0,locationSignature=""}
local name=(c.name and c.name~="") and c.name or p.name or ("GUID "..tostring(guid))
if (c.total or 0)>(p.total or 0) then changes.acquired[#changes.acquired+1]={guid=guid,name=name,delta=(c.total or 0)-(p.total or 0)} end
if (c.total or 0)<(p.total or 0) then changes.lost[#changes.lost+1]={guid=guid,name=name,delta=(p.total or 0)-(c.total or 0)} end
if (c.equipped or 0)>(p.equipped or 0) then changes.newlyEquipped[#changes.newlyEquipped+1]={guid=guid,name=name,delta=(c.equipped or 0)-(p.equipped or 0)} end
if (p.equipped or 0)>0 and (c.equipped or 0)==0 and (c.stored or 0)>0 then changes.becameUnused[#changes.becameUnused+1]={guid=guid,name=name,stored=c.stored or 0} end
if (c.equipped or 0)>0 and (p.equipped or 0)==(c.equipped or 0) and (p.locationSignature or "")~=(c.locationSignature or "") then
changes.moved[#changes.moved+1]={guid=guid,name=name,equipped=c.equipped or 0}
end
end
end
local currentEmpty={}
for _,er in ipairs((SpecialistFinder.EmptySlotsCache or {})[tostring(session)] or {}) do
local sig=tostring(er.objectID)..":"..tostring(er.slot)
currentEmpty[sig]=er
end
local previousEmpty=SpecialistFinder.EmptySlotSnapshotCache and SpecialistFinder.EmptySlotSnapshotCache[tostring(session)] or nil
if previousEmpty then
for sig,er in pairs(currentEmpty) do
if not previousEmpty[sig] then changes.newEmptySlots[#changes.newEmptySlots+1]=er end
end
for sig,er in pairs(previousEmpty) do
if not currentEmpty[sig] then changes.filledSlots[#changes.filledSlots+1]=er end
end
end
-- Enrich empty-slot changes with the specialist involved so What Changed can describe the player's action.
local currentEquippedBySlot={}
for _,row in ipairs((SpecialistFinder.Cache[session] and SpecialistFinder.Cache[session].rows) or {}) do
currentEquippedBySlot[tostring(row.objectID)..":"..tostring(row.slot)]=row
end
for _,er in ipairs(changes.filledSlots) do
local row=currentEquippedBySlot[tostring(er.objectID)..":"..tostring(er.slot)]
if row then er.filledWithGuid=row.guid; er.filledWithName=row.name; er.currentRow=row end
end
if previous then
for _,er in ipairs(changes.newEmptySlots) do
local locationSig=tostring(er.areaID or "").."|"..tostring(er.objectID or "").."|"..tostring(er.slot or "")
for guid,a in pairs(previous) do
if a.locations and a.locations[locationSig] then
er.removedGuid=guid; er.removedName=a.name; break
end
end
end
-- Detect direct occupied-slot replacements even when the slot was never empty between scans.
for _,row in ipairs((SpecialistFinder.Cache[session] and SpecialistFinder.Cache[session].rows) or {}) do
local locationSig=snapshotLocationSignature(row)
for guid,a in pairs(previous) do
if guid~=row.guid and a.locations and a.locations[locationSig] then
changes.replacedSlots[#changes.replacedSlots+1]={areaID=row.areaID,areaName=row.areaName,buildingType=row.buildingType,objectName=row.objectName,objectIDRaw=row.objectIDRaw,objectID=row.objectID,slot=row.slot,isShip=row.isShip,oldGuid=guid,oldName=a.name,newGuid=row.guid,newName=row.name,currentRow=row}
break
end
end
end
end
SpecialistFinder.EmptySlotSnapshotCache=SpecialistFinder.EmptySlotSnapshotCache or {}
SpecialistFinder.EmptySlotSnapshotCache[tostring(session)]=currentEmpty
local function sortChanges(list)
table.sort(list,function(a,b) return tostring(a.name or a.areaName or "")<tostring(b.name or b.areaName or "") end)
end
sortChanges(changes.acquired); sortChanges(changes.lost); sortChanges(changes.newlyEquipped); sortChanges(changes.becameUnused); sortChanges(changes.moved); sortChanges(changes.newEmptySlots); sortChanges(changes.filledSlots); sortChanges(changes.replacedSlots)
SpecialistFinder.ScanChanges[session]=changes
SpecialistFinder.SnapshotCache[session]=current
log("SCAN CHANGE SNAPSHOT".." | session="..tostring(session).." | baseline="..tostring(changes.baseline)
.." | acquired="..tostring(#changes.acquired).." | lost="..tostring(#changes.lost)
.." | newlyEquipped="..tostring(#changes.newlyEquipped).." | becameUnused="..tostring(#changes.becameUnused)
.." | moved="..tostring(#changes.moved).." | newEmptySlots="..tostring(#changes.newEmptySlots).." | filledSlots="..tostring(#changes.filledSlots).." | replacedSlots="..tostring(#changes.replacedSlots))
end

local function finishMultiWarehouse(probe, reason)
log("ONE-CLICK MULTI-WAREHOUSE SUMMARY"
.. " | reason=" .. tostring(reason)
.. " | candidates=" .. tostring(#(probe.candidates or {}))
.. " | capturedWarehouses=" .. tostring(
probe.capturedWarehouses or 0
)
.. " | tabPersistenceConfirmed=" .. tostring(
probe.tabPersistenceConfirmed == true
)
.. " | manualClicksRequired=" .. tostring(
probe.manualClicksObserved or 0
)
.. " | automaticItemsInitialization=" .. tostring(
probe.autoItemsSuccess == true
)
.. " | automaticMethod=" .. tostring(
probe.autoItemsCurrentMethod or ""
)
.. " | currentIndex=" .. tostring(
probe.currentIndex or 0
)
.. " | readOnlyInventory=true"
.. " | navigationOnly=true")
probe.active = false
probe.phase = "finished"
scanCurrentSessionSockets()
finalizeScanCachesAndChanges()
local finishedSession=tostring(currentSession() or "")
SpecialistFinder.ScanReadySession = finishedSession
SpecialistFinder.ScanReadySessions[finishedSession] = true
if SpecialistFinder.AutoScanResumeMode=="changes" then
SpecialistFinder.ChangesReportReadySession=finishedSession
end
if SpecialistFinder.AutoScanResumeInProgress and SpecialistFinder.AutoScanResumeMarker then
SpecialistFinder.MenuPendingTicks = 0
SpecialistFinder.AutoScanResumeTicks = 6
log("INTEGRATED DATA READY"
.. " | storedRows=" .. tostring(#SpecialistFinder.StoredRows)
.. " | equippedRows=" .. tostring(
SpecialistFinder.Cache[currentSession()]
and #(SpecialistFinder.Cache[currentSession()].rows or {})
or 0
)
.. " | autoResumeReport=" .. tostring(SpecialistFinder.AutoScanResumeMode or "")
.. " | reportOpensAfterTicks=6")
else
SpecialistFinder.MenuPendingTicks = 2
log("INTEGRATED DATA READY"
.. " | storedRows=" .. tostring(#SpecialistFinder.StoredRows)
.. " | equippedRows=" .. tostring(
SpecialistFinder.Cache[currentSession()]
and #(SpecialistFinder.Cache[currentSession()].rows or {})
or 0
)
.. " | menuOpensAfterTicks=2")
end
if SpecialistFinder.BackgroundScanPaper then
local scene=ui and ui.Scenes and ui.Scenes.TextPopup or nil
local sd=scene and read(scene,"SceneData") or nil
local content=sd and read(sd,"Content") or nil
local equippedCount=(SpecialistFinder.Cache[currentSession()] and #(SpecialistFinder.Cache[currentSession()].rows or {})) or 0
if content then
local doneText="SPECIALIST SCAN COMPLETE\n\nStored specialist rows: "..tostring(#SpecialistFinder.StoredRows).."\nEquipped placements: "..tostring(equippedCount).."\n\nThis paper will close automatically."
local doneOk,doneErr=pcall(function() content.Text=doneText end)
log("BACKGROUND SCAN PAPER COMPLETE | success="..tostring(doneOk).." | error="..tostring(doneErr or ""))
else
log("BACKGROUND SCAN PAPER COMPLETE | success=false | reason=paperNotOpen")
end
SpecialistFinder.BackgroundScanPaper=false
SpecialistFinder.AutoCloseScanPaperTicks=1
SpecialistFinder.AutoCloseVerifyTicks=nil
SpecialistFinder.AutoClosePopAttempts=0
log("BACKGROUND SCAN PAPER AUTO-CLOSE ARMED | delayTicks=1 | completionVisibleBeforeClose=true | verifiedClose=true")
end
log("========== ONE-CLICK MULTI-WAREHOUSE PROBE END ==========")
end
local function continueAfterFirstWarehouse(probe, storage, reason, manualClicks)
probe.manualClicksObserved = manualClicks or 0
captureCurrentWarehouse(probe, storage, reason)
if #probe.candidates <= 1 then
finishMultiWarehouse(probe, "only one main warehouse available")
return
end
probe.currentIndex = 2
selectWarehouseTarget(
probe,
probe.candidates[probe.currentIndex],
"test whether Items tab persists"
)
end
function SpecialistFinder:ScanTick()
local probe = self.WarehouseProbe
if probe.active ~= true then return end
probe.ticks = probe.ticks + 1
local storage = warehouseStorage()
if storage == nil then
if probe.ticks == 1
or probe.ticks == 10
or probe.ticks == 30 then
log("ONE-CLICK WAIT"
.. " | phase=" .. tostring(probe.phase)
.. " | tick=" .. tostring(probe.ticks)
.. " | storageAvailable=false")
end
if probe.ticks >= 120 then
finishMultiWarehouse(
probe,
"timeout: warehouse UI unavailable"
)
end
return
end
local itemsGrid = read(storage, "ItemsGrid")
local itemsSize = arraySize(itemsGrid)
local goodsSize = arraySize(read(storage, "GoodsGrid"))
local selectedIndex = valueText(
read(read(storage, "Tabs"), "SelectedIndex")
)
local itemsFilterSize = arraySize(
read(read(storage, "ItemsFilter"), "Array")
)
local itemsReady = selectedIndex == "2"
and itemsSize > 0
and itemsFilterSize > 0
if probe.phase == "await-auto-items" then
if probe.autoItemsInspectDone ~= true then
discoverAutomaticItemsMethods(probe, storage)
end
if itemsReady then
probe.autoItemsSuccess = true
log("AUTO ITEMS INITIALIZATION ALREADY AVAILABLE"
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | freshItemsState=true"
.. " | manualClicksRequired=0")
continueAfterFirstWarehouse(
probe,
storage,
"first warehouse Items grid already initialized",
0
)
return
end
if itemsSize > 0 and not itemsReady then
log("AUTO ITEMS STALE GRID REJECTED"
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | reason=nonzero grid without active initialized Items state")
end
if #(probe.autoItemsCandidates or {}) > 0 then
probe.phase = "auto-items-method-wait"
if not attemptNextAutomaticItemsMethod(probe, storage) then
probe.phase = "await-manual-items"
end
return
end
if probe.autoItemsStorageSeenTick == nil then
probe.autoItemsStorageSeenTick = probe.ticks
log("AUTO ITEMS CONTROLLER SETTLE"
.. " | storageAvailable=true"
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | waitTicks=1"
.. " | reason=avoid warehouse tab-controller startup race")
return
end
if (probe.ticks - probe.autoItemsStorageSeenTick) < 1 then
return
end
local tabs = read(storage, "Tabs")
local scene = ui and ui.Scenes and ui.Scenes.OMKontorWarehouse
and ui.Scenes.OMKontorWarehouse.Scene or nil
local sceneFocus = read(scene, "SceneFocus")
local requestFocus = read(sceneFocus, "RequestSceneFocus")
local writeOk, writeErr = pcall(function()
tabs.SelectedIndex = 2
end)
local focusOk, focusResult = false, "not available"
if type(requestFocus) == "function" then
focusOk, focusResult = pcall(function()
return requestFocus(sceneFocus)
end)
end
probe.autoItemsAttemptTick = probe.ticks
probe.phase = "auto-items-property-wait"
log("AUTO ITEMS INITIALIZATION ATTEMPT"
.. " | selectedIndexWrite=2"
.. " | writeSuccess=" .. tostring(writeOk)
.. " | writeError=" .. truncateText(writeErr, 240)
.. " | requestSceneFocusAvailable=" .. tostring(type(requestFocus) == "function")
.. " | requestSceneFocusSuccess=" .. tostring(focusOk)
.. " | focusReturnOrError=" .. truncateText(focusResult, 240)
.. " | inventoryMutation=false"
.. " | simulatedClick=false")
return
end
if probe.phase == "auto-items-property-wait" then
local elapsed = probe.ticks - (probe.autoItemsAttemptTick or probe.ticks)
if itemsReady then
probe.autoItemsSuccess = true
log("AUTO ITEMS INITIALIZATION SUCCESS"
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | manualClicksRequired=0")
continueAfterFirstWarehouse(probe, storage,
"first warehouse after automatic Items initialization", 0)
return
end
if elapsed >= 6 then
log("AUTO ITEMS INITIALIZATION FAILED"
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | fallback=one real Items click")
probe.phase = "await-manual-items"
probe.instructionLogged = false
end
return
end
if probe.phase == "auto-items-method-wait" then
local elapsed = probe.ticks - (probe.autoItemsAttemptTick or probe.ticks)
if itemsReady then
probe.autoItemsSuccess = true
log("AUTO ITEMS INITIALIZATION SUCCESS"
.. " | method=" .. tostring(probe.autoItemsCurrentMethod)
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | freshItemsState=true"
.. " | manualClicksRequired=0")
continueAfterFirstWarehouse(
probe,
storage,
"first warehouse after automatic Items initialization",
0
)
return
end
if elapsed >= 4 then
log("AUTO ITEMS METHOD RESULT"
.. " | method=" .. tostring(probe.autoItemsCurrentMethod)
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | initialized=false")
if attemptNextAutomaticItemsMethod(probe, storage) then
return
end
log("AUTO ITEMS INITIALIZATION FAILED"
.. " | attemptedMethods=" .. tostring(#(probe.autoItemsCandidates or {}))
.. " | fallback=one real Items click"
.. " | inventoryMutation=false")
probe.phase = "await-manual-items"
probe.instructionLogged = false
return
end
return
end
if probe.phase == "await-manual-items" then
if probe.instructionLogged ~= true then
probe.instructionLogged = true
log("MANUAL ITEMS CLICK REQUIRED"
.. " | areaName=" .. tostring(probe.areaName)
.. " | instruction=automatic initialization was unavailable; click the warehouse Items/Specialists tab once and then do not click anything else"
.. " | currentSelectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize))
end
if itemsReady then
log("REAL ITEMS TAB ACTIVATION DETECTED"
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | freshItemsState=true"
.. " | itemsFilter02Size=" .. tostring(
arraySize(
read(read(storage, "ItemsFilter02"), "Array")
)
))
continueAfterFirstWarehouse(
probe,
storage,
"first warehouse after one real player click",
1
)
return
end
if probe.ticks >= 180 then
finishMultiWarehouse(
probe,
"timeout: automatic initialization failed and no manual Items-tab activation detected"
)
end
return
end
if probe.phase == "wait-after-switch" then
local elapsed = probe.ticks - probe.switchTick
if elapsed == 1 or elapsed == 3 or elapsed == 6 then
log("MULTI-WAREHOUSE SWITCH STATE"
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | index=" .. tostring(probe.currentIndex)
.. " | areaName=" .. tostring(probe.areaName)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | goodsGridSize=" .. tostring(goodsSize)
.. " | itemsGridSize=" .. tostring(itemsSize))
end
if elapsed < 1 then return end
if itemsReady then
probe.tabPersistenceConfirmed = true
log("ADAPTIVE WAREHOUSE READY"
.. " | elapsedTicks=" .. tostring(elapsed)
.. " | index=" .. tostring(probe.currentIndex)
.. " | areaName=" .. tostring(probe.areaName)
.. " | selectedIndex=" .. tostring(selectedIndex)
.. " | itemsGridSize=" .. tostring(itemsSize)
.. " | itemsFilterSize=" .. tostring(itemsFilterSize)
.. " | fixedDelayAvoided=true")
captureCurrentWarehouse(
probe,
storage,
"Items view persisted after automatic warehouse change"
)
if probe.currentIndex >= #probe.candidates then
finishMultiWarehouse(
probe,
"captured all main warehouses with adaptive one-tick readiness"
)
return
end
probe.currentIndex = probe.currentIndex + 1
selectWarehouseTarget(
probe,
probe.candidates[probe.currentIndex],
"continue automatic multi-warehouse capture"
)
return
end
if goodsSize > 0 and itemsSize == 0 then
finishMultiWarehouse(
probe,
"Items tab did not persist after switching warehouse"
)
return
end
if elapsed >= 12 then
finishMultiWarehouse(
probe,
"timeout: switched warehouse grids did not stabilize"
)
end
end
end
function SpecialistFinder:Load()
log("Load completed | Ctrl+Alt+I scans automatically and opens the stable six-choice menu | v0.14.13: when a report is requested without current scan data, shows a short scan message, automatically closes the parchment before warehouse navigation begins, then safely scans and resumes the requested report; single return icon protection and labeled reports retained; persistent Close retained; Ctrl+Alt+R force rescan | scanner and inventory logic unchanged | readOnlyInventory=true")
end
function SpecialistFinder:RunGeneral()
self.StoredRows = {}
self.Cache[currentSession()] = nil
self.EmptySlotsCache[currentSession()] = nil
self.ScanReadySession = nil
self.ScanReadySessions[currentSession()] = nil
self.MenuPendingTicks = 0
self.PopupWatchTicks = 0
log("========== SPECIALIST FINDER INTEGRATED SCAN START ==========")
local candidates = allMainWarehouses()
if #candidates == 0 then
log("ONE-CLICK MULTI-WAREHOUSE ERROR"
.. " | reason=no owned main warehouse candidates")
return true
end
local started = self:StartWarehouseProbe()
if started ~= true then
log("ONE-CLICK MULTI-WAREHOUSE ERROR"
.. " | reason=automatic warehouse opening failed")
return true
end
self.WarehouseProbe.candidates = candidates
self.WarehouseProbe.currentIndex = 1
self.WarehouseProbe.capturedWarehouses = 0
self.WarehouseProbe.manualClicksObserved = 0
self.WarehouseProbe.tabPersistenceConfirmed = false
self.WarehouseProbe.phase = "await-auto-items"
self.WarehouseProbe.instructionLogged = false
self.WarehouseProbe.autoItemsInspectDone = false
self.WarehouseProbe.autoItemsCandidates = {}
self.WarehouseProbe.autoItemsCandidateIndex = 0
self.WarehouseProbe.autoItemsSuccess = false
updateProbeTarget(
self.WarehouseProbe,
candidates[1]
)
log("ONE-CLICK MULTI-WAREHOUSE CONTEXT"
.. " | currentSession=" .. tostring(currentSession())
.. " | mainWarehouses=" .. tostring(#candidates)
.. " | firstArea=" .. tostring(candidates[1].areaName)
.. " | instruction=wait while automatic Items initialization is probed; click Items only if the log requests it")
return true
end
function SpecialistFinder:RunFocused()
return self:RunGeneral()
end
local FILTER_STORYLINE_GUID = 2008628201
local RETURN_STORYLINE_GUIDS = {2008628370,2008628373,2008628376,2008628379,2008628382,2008628385,2008628388,2008628391,2008628394,2008628397,2008628400,2008628403}
local FILTER_MARKERS = {
SF_V014_BEST = true,
SF_V014_UNUSED = true,
SF_V014_IMPROVE = true,
SF_V014_PURPOSE = true,
SF_V014_ALL = true,
SF_V014_RESCAN = true,
SF_V041_BEST_USE_NOW = true,
SF_V041_BEST_SPARES = true,
SF_V041_BEST_STRONG_UNUSED = true,
SF_V041_BEST_NEEDS_REVIEW = true,
SF_V050_EMPTY_SLOTS_P1 = true,
SF_V050_EMPTY_SLOTS_P2 = true,
SF_V050_EMPTY_SLOTS_P3 = true,
SF_V050_EMPTY_SLOTS_P4 = true,
SF_V050_EMPTY_SLOTS_P5 = true,
SF_V050_EMPTY_SLOTS_P6 = true,
SF_V050_EMPTY_SLOTS_P7 = true,
SF_V050_EMPTY_SLOTS_P8 = true,
SF_V050_EMPTY_SLOTS_P9 = true,
SF_V050_EMPTY_SLOTS_P10 = true,
SF_V050_EMPTY_SLOTS_P11 = true,
SF_V050_EMPTY_SLOTS_P12 = true,
SF_V050_CHANGES = true,
SF_V050_SHIPS = true,
SF_V050_EMPIRE = true,
SF_FILTER_COMPLETE = true,
SF_FILTER_OPPORTUNITIES = true,
SF_FILTER_UNUSED = true,
SF_FILTER_EQUIPPED = true,
SF_FILTER_RESCAN = true,
SF_FILTER_LOCATIONS = true
}
for i=1,3 do FILTER_MARKERS["SF_V014_BEST_P"..tostring(i)] = true end
for i=1,6 do FILTER_MARKERS["SF_V014_UNUSED_P"..tostring(i)] = true end
for i=1,6 do FILTER_MARKERS["SF_V014_PURPOSE_P"..tostring(i)] = true end
for i=1,6 do FILTER_MARKERS["SF_V014_ALL_P"..tostring(i)] = true end
local function cleanText(value)
local s = tostring(value or "")
if s == "nil" then return "" end
return s
end
local function rarityRank(r)
local ranks = {Legendary=5, Epic=4, Rare=3, Uncommon=2, Common=1}
return ranks[cleanText(r)] or 0
end
local function trimText(value)
local s=cleanText(value)
return (string.gsub(s,"^%s*(.-)%s*$","%1"))
end
local function mergeProfile(target,row)
if not target or not row then return end
if trimText(target.name)=="" and trimText(row.name)~="" then target.name=row.name end
if trimText(target.rarity)=="" and trimText(row.rarity)~="" then target.rarity=row.rarity end
if trimText(target.niche)=="" and trimText(row.niche)~="" then target.niche=row.niche end
if trimText(target.targets)=="" and trimText(row.targets)~="" then target.targets=row.targets end
if trimText(target.effects)=="" and trimText(row.effects)~="" then target.effects=row.effects end
if row.verified then target.verified=true end
end
local function aggregateCurrentProvince()
local byGuid = {}
for _, row in ipairs(SpecialistFinder.StoredRows or {}) do
local a = byGuid[row.guid]
if not a then
a = {guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={}}
byGuid[row.guid]=a
else
mergeProfile(a,row)
end
a.stored = a.stored + (row.amount or 1)
a.storedLocations[#a.storedLocations+1] = cleanText(row.areaName) .. " warehouse x" .. tostring(row.amount or 1)
a.storedRefs[#a.storedRefs+1] = {
sessionGUID=row.sessionGUID,
objectIDRaw=row.warehouseIDRaw,
objectID=row.warehouseID,
areaName=row.areaName,
guid=row.guid,
kind="warehouse"
}
end
local sessionData = SpecialistFinder.Cache[currentSession()]
for _, row in ipairs(sessionData and sessionData.rows or {}) do
local a = byGuid[row.guid]
if not a then
a = {guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={}}
byGuid[row.guid]=a
else
mergeProfile(a,row)
end
a.equipped = a.equipped + 1
local where = cleanText(row.areaName) .. " — " .. cleanText(row.buildingType)
if cleanText(row.objectName) ~= "" then where = where .. " " .. cleanText(row.objectName) end
where = where .. " — slot " .. tostring(row.slot)
a.equippedLocations[#a.equippedLocations+1] = where
a.equippedRefs[#a.equippedRefs+1] = {
sessionGUID=row.sessionGUID,
objectIDRaw=row.objectIDRaw,
objectID=row.objectID,
areaName=row.areaName,
buildingType=row.buildingType,
objectName=row.objectName,
slot=row.slot,
kind=row.isShip and "ship" or "equipped"
}
end
local list={}
for _,a in pairs(byGuid) do
a.total=a.stored+a.equipped
list[#list+1]=a
end
return list
end
local function provinceLabel(session)
local value=tostring(session or "")
if value=="3245" then return "Latium" end
if value=="6627" then return "Albion" end
return "Province "..value
end
local function aggregateEmpire()
local byGuid={}
for session,storedRows in pairs(SpecialistFinder.StoredCache or {}) do
for _,row in ipairs(storedRows or {}) do
local a=byGuid[row.guid]
if not a then
a={guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={},provinceStored={},provinceEquipped={}}
byGuid[row.guid]=a
else mergeProfile(a,row) end
local amount=row.amount or 1
a.stored=a.stored+amount
a.provinceStored[session]=(a.provinceStored[session] or 0)+amount
a.storedLocations[#a.storedLocations+1]=provinceLabel(session).." / "..cleanText(row.areaName).." warehouse x"..tostring(amount)
a.storedRefs[#a.storedRefs+1]={
sessionGUID=session,
objectIDRaw=row.warehouseIDRaw,
objectID=row.warehouseID,
areaName=row.areaName,
guid=row.guid,
kind="warehouse"
}
end
end
for session,sessionData in pairs(SpecialistFinder.Cache or {}) do
for _,row in ipairs(sessionData and sessionData.rows or {}) do
local a=byGuid[row.guid]
if not a then
a={guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={},provinceStored={},provinceEquipped={}}
byGuid[row.guid]=a
else mergeProfile(a,row) end
a.equipped=a.equipped+1
a.provinceEquipped[session]=(a.provinceEquipped[session] or 0)+1
local where=provinceLabel(session).." / "..cleanText(row.areaName).." / "..cleanText(row.buildingType)
if cleanText(row.objectName)~="" then where=where.." "..cleanText(row.objectName) end
where=where.." / slot "..tostring(row.slot)
a.equippedLocations[#a.equippedLocations+1]=where
a.equippedRefs[#a.equippedRefs+1]={
sessionGUID=session,
objectIDRaw=row.objectIDRaw,
objectID=row.objectID,
areaName=row.areaName,
buildingType=row.buildingType,
objectName=row.objectName,
slot=row.slot,
kind=row.isShip and "ship" or "equipped"
}
end
end
local list={}
for _,a in pairs(byGuid) do a.total=a.stored+a.equipped; list[#list+1]=a end
return list
end
local function jumpRefInCurrentSession(ref)
if not ref or ref.objectIDRaw==nil then return nil end
if tostring(ref.sessionGUID or "")~=tostring(currentSession()) then return nil end
return ref
end
local function firstCurrentRef(refs)
for _,ref in ipairs(refs or {}) do
local usable=jumpRefInCurrentSession(ref)
if usable then return usable end
end
return nil
end
local function preferredJumpRef(a, preference)
if not a then return nil end
if preference=="equipped" then
return firstCurrentRef(a.equippedRefs) or firstCurrentRef(a.storedRefs)
end
return firstCurrentRef(a.storedRefs) or firstCurrentRef(a.equippedRefs)
end
local function resetPageJumpTargets(marker)
SpecialistFinder.PageJumpTargets={}
SpecialistFinder.ActiveReportMarker=tostring(marker or "")
end
local function registerPageJump(slot, ref, label)
slot=tonumber(slot) or 0
if slot<1 or slot>9 then return "" end
ref=jumpRefInCurrentSession(ref)
if not ref then return "" end
SpecialistFinder.PageJumpTargets[slot]={
objectIDRaw=ref.objectIDRaw,
objectID=ref.objectID,
sessionGUID=ref.sessionGUID,
label=tostring(label or ""),
kind=ref.kind or "",
guid=ref.guid,
direct=ref.direct==true
}
local jumpKeyLabels={[1]="Ctrl+Alt+1",[2]="Ctrl+Alt+2",[3]="Ctrl+Alt+3",[4]="Ctrl+Alt+4",[5]="Ctrl+Alt+5",[6]="Ctrl+Alt+6",[7]="Ctrl+Alt+7",[8]="Ctrl+Alt+8",[9]="Ctrl+Alt+9"}
return " {"..tostring(jumpKeyLabels[slot] or ("Jump "..tostring(slot))).."}"
end

function SpecialistFinder:WarehouseSearchInput()
local storage=warehouseStorage()
local outer=storage and read(storage,"SearchInput") or nil
local inner=outer and read(outer,"SearchInput") or nil
return storage,outer,inner
end

function SpecialistFinder:ClearWarehouseSearch(reason)
local storage,outer,inner=self:WarehouseSearchInput()
if not inner then return false end
local before=tostring(read(inner,"Text") or "")
if before=="" then return true end
local writeOk,writeErr=pcall(function() inner.Text="" end)
local callOk,callErr=false,""
local okGet,method=pcall(function() return inner.TextFinished end)
if okGet and type(method)=="function" then
local ok,res=pcall(function() return inner:TextFinished() end)
callOk=ok
if not ok then callErr=tostring(res) end
end
log("WAREHOUSE SEARCH RESET"
.." | reason="..tostring(reason or "")
.." | before="..tostring(before)
.." | writeSuccess="..tostring(writeOk)
.." | writeError="..tostring(writeErr or "")
.." | TextFinishedSuccess="..tostring(callOk)
.." | TextFinishedError="..tostring(callErr)
.." | inventoryMutation=false")
return writeOk and callOk
end

function SpecialistFinder:WarehouseTargetButton(targetGuid)
local grid=warehouseGrid()
local size=arraySize(grid)
for i=0,size-1 do
local button=arrayElement(grid,i)
local row=warehouseRow(button)
if row and tonumber(row.guid)==tonumber(targetGuid) and tonumber(targetGuid or 0)>0 then
return button,i,size
end
end
return nil,-1,size
end

function SpecialistFinder:ExecutePendingReportJump()
local pending=self.PendingReportJump
if not pending then return false end
if not self.PendingJumpReady then return false end
self.PendingReportJump=nil
self.PendingJumpReady=false
self.PendingJumpDelayTicks=0
self.JumpExecuting=true
local target=pending.target
local selected=false
local jumped=false
local selectErr=""
local jumpErr=""
if target and target.kind=="warehouse" then
self:ClearWarehouseSearch("before specialist warehouse jump")
end
if target and target.objectIDRaw~=nil then
selected,selectErr=pcall(function()
if Selection and type(Selection.SelectByID)=="function" then
Selection:SelectByID(target.objectIDRaw)
end
end)
jumped,jumpErr=pcall(function()
if Scripts and type(Scripts.JumpToObject)=="function" then
Scripts:JumpToObject(target.objectIDRaw)
end
end)
end
self.PageJumpTargets={}
self.ActiveReportMarker=nil
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
self.ReportMenuReopenedForCycle=false
self.MenuSessionActive=false
self.MenuWasVisible=false
self.ReportPopupSeenForCycle=false
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=false
self.PopupWasVisible=false
self.PopupWatchTicks=0
self.JumpExecuting=false
if target and target.kind=="warehouse" and (jumped or selected) then
self.InfoTipWatch=nil
self.SearchInputMethodWatch={
label=tostring(target.label or ""),
targetGuid=tonumber(target.guid) or 0,
ticks=40,
delayTicks=1,
stage="wait-destination-grid",
beforeGridSize=-1
}
log("WAREHOUSE SPECIALIST LOCATE ARMED"
.." | label="..tostring(target.label or "")
.." | targetGuid="..tostring(target.guid or "")
.." | delayTicks=1"
.." | readiness=destination ItemsGrid must contain target GUID before search executes"
.." | then=Text write + TextFinished + RequestFocus on rebuilt target row"
.." | inventoryMutation=false")
end
log("REPORT SHORTCUT JUMP EXECUTED"
.." | slot="..tostring(pending.slot)
.." | label="..tostring(target and target.label or "")
.." | objectID="..tostring(target and target.objectID or "")
.." | session="..tostring(target and target.sessionGUID or "")
.." | selected="..tostring(selected)
.." | jumped="..tostring(jumped)
.." | selectionError="..tostring(selectErr or "")
.." | jumpError="..tostring(jumpErr or "")
.." | popUICount=0"
.." | helperDismissed=true"
.." | inventoryMutation=false")
return jumped or selected
end
local function infoTipManagerSummary(manager)
if manager==nil then return "manager=nil" end
return fieldSummary(manager,{
"RefGuid","RefGUID","RefOid","RefOID","RefOidAsBool",
"RefTextId","RefTextID","IsRefOidSet","IsContextEmpty",
"Guid","GUID","Visible","IsVisible","Active","IsActive",
"Text","Title","Headline","Description",
"ItemGuid","ItemGUID","AssetGuid","AssetGUID",
"Context","Source","Owner","Target"
})
end

local function infoTipObjectSummary(tip)
if tip==nil then return "tip=nil" end
return fieldSummary(tip,{
"RefGuid","RefGUID","RefOid","RefOID","RefTextId","RefTextID",
"InfotipGuid","InfotipGUID","AreaScope","SessionScope",
"Guid","GUID","Visible","IsVisible",
"Text","Title","Headline","Description","Icon",
"Context","Source","Owner","Target"
})
end

function SpecialistFinder:TickInfoTipWatch()
local w=self.InfoTipWatch
if not w then return false end
w.ticks=(w.ticks or 0)-1
if (w.delayTicks or 0)>0 then
w.delayTicks=w.delayTicks-1
return false
end

local grid=warehouseGrid()
local size=arraySize(grid)
local targetButton=nil
local targetIndex=nil
for i=0,size-1 do
local button=arrayElement(grid,i)
local row=warehouseRow(button)
if row and tonumber(row.guid)==tonumber(w.targetGuid) and tonumber(w.targetGuid or 0)>0 then
targetButton=button
targetIndex=i
break
end
end

if targetButton and not w.loggedTarget then
local base=read(targetButton,"BaseData")
local tip=base and read(base,"InfoTip") or nil
local interaction=read(targetButton,"Interaction") or read(targetButton,"InteractionData") or read(targetButton,"ButtonInteraction")
local context=interaction and read(interaction,"Context") or nil
log("INFOTIP TARGET ROW"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | rowIndex="..tostring(targetIndex)
.." | rowInfoTip="..infoTipObjectSummary(tip)
.." | interaction="..fieldSummary(interaction,{"Context","InfoTip","Tooltip","IsSelected","IsFocused","Action"})
.." | context="..fieldSummary(context,{
"Guid","GUID","RefGuid","RefGUID","RefOid","RefOID",
"ItemGuid","ItemGUID","AssetGuid","AssetGUID",
"Index","Type","Value","Text","Name","Source","Owner","Target"
})
.." | button="..fieldSummary(targetButton,{
"ID","Guid","GUID","Index","Interaction","BaseData","InfoTip","Tooltip",
"OnHover","OnMouseEnter","OnMouseLeave","MouseEnter","MouseLeave",
"EventHover","EventMouseEnter","EventMouseLeave"
})
.." | base="..fieldSummary(base,{
"ID","Guid","GUID","Index","InfoTip","Tooltip","Interaction",
"OnHover","OnMouseEnter","OnMouseLeave","EventHover","EventMouseEnter","EventMouseLeave"
})
.." | action="..fieldSummary(action,{
"ID","Guid","GUID","Index","Context","Source","Target",
"EventPrimary","EventSecondary","EventHover","EventMouseEnter","EventMouseLeave",
"OnHover","OnMouseEnter","OnMouseLeave","Hover","MouseEnter","MouseLeave"
})
.." | writesPerformed=false")
local base=read(targetButton,"BaseData")
local action=interaction and read(interaction,"Action") or nil
log("INFOTIP TARGET OBJECTS"
.." | button="..tostring(targetButton)
.." | base="..tostring(base)
.." | interaction="..tostring(interaction)
.." | action="..tostring(action)
.." | context="..tostring(context)
.." | infotip="..tostring(tip)
.." | writesPerformed=false")
typeInfoText(targetButton)
typeInfoText(base)
typeInfoText(interaction)
typeInfoText(action)
typeInfoText(tip)
typeInfoText(context)
w.loggedTarget=true
end

local focusInteraction=nil
if targetButton then
focusInteraction=read(targetButton,"Interaction") or read(targetButton,"InteractionData") or read(targetButton,"ButtonInteraction")
end

if targetButton and focusInteraction and not w.requestFocusTried then
w.requestFocusTried=true
local interaction=focusInteraction
local beforeFocused=read(interaction,"IsFocused")
local ok=false
local result=nil
local err=""
local directAvailable=false
local accessOk,requestFocus=pcall(function() return interaction.RequestFocus end)
if accessOk and type(requestFocus)=="function" then
directAvailable=true
local callOk,callResult=pcall(function() return interaction:RequestFocus() end)
ok=callOk
result=callResult
if not callOk then err=tostring(callResult) end
else
err="direct RequestFocus unavailable"
end
local afterFocused=read(interaction,"IsFocused")
log("INFOTIP NATIVE REQUESTFOCUS DIRECT"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | beforeFocused="..tostring(beforeFocused)
.." | afterFocused="..tostring(afterFocused)
.." | directMethodAvailable="..tostring(directAvailable)
.." | methodAccessSuccess="..tostring(accessOk)
.." | callSuccess="..tostring(ok)
.." | result="..tostring(result)
.." | error="..tostring(err)
.." | noEventPrimary=true"
.." | noEventSecondary=true"
.." | noClick=true"
.." | inventoryMutation=false")
end

local manager=rawget(_G,"InfoTip")
local currentGuid=normalizeGuid(manager and (read(manager,"RefGuid") or read(manager,"RefGUID")) or 0)
local managerSignature=infoTipManagerSummary(manager)

if managerSignature~=w.lastManagerSignature then
log("INFOTIP MANAGER STATE CHANGE"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | previousGuid="..tostring(w.lastGuid)
.." | currentGuid="..tostring(currentGuid)
.." | isTarget="..tostring(currentGuid==tonumber(w.targetGuid))
.." | manager="..managerSignature
.." | writesPerformed=false")
if manager~=nil and w.lastManagerSignature=="" then typeInfoText(manager) end
w.lastGuid=currentGuid
w.lastManagerSignature=managerSignature
end

if w.ticks<=0 then
log("INFOTIP WATCH COMPLETE"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | finalGuid="..tostring(w.lastGuid)
.." | targetObserved="..tostring(w.lastGuid==tonumber(w.targetGuid))
.." | writesPerformed=false"
.." | inventoryMutation=false")
self.InfoTipWatch=nil
end
return true
end


local function scrollWatchPropertyNames(object)
if object==nil then return {} end
local info=rawTypeInfo(object)
if type(info)~="string" then return {} end
local names,seen={},{}
for name in string.gmatch(info, '\"([%w_]+)\"%s*:%s*%{\"Alias\"') do
if not seen[name] then
seen[name]=true
names[#names+1]=name
end
end
table.sort(names)
return names
end

local function scrollWatchScalar(value)
local t=type(value)
if t=="number" or t=="boolean" or t=="string" then
return t..":"..tostring(value)
end
return nil
end

local function scrollWatchKeyword(name)
local lower=string.lower(tostring(name or ""))
for _,word in ipairs({"scroll","offset","position","index","page","view","viewport","list","grid","content","focus","visible","range","slider"}) do
if string.find(lower,word,1,true) then return true end
end
return false
end

local function scrollWatchRoots()
local uiRoot=rawget(_G,"ui") or rawget(_G,"UI")
local scene=safe(function() return uiRoot and uiRoot.Scenes and uiRoot.Scenes.OMKontorWarehouse end)
local sceneData=safe(function() return scene and scene.SceneData end)
local warehouseData=safe(function() return sceneData and sceneData.NewOMKontorWarehouse end)
local storage=safe(function() return warehouseData and warehouseData.Storage end)
return {
{label="Scene",object=scene},
{label="SceneData",object=sceneData},
{label="Warehouse",object=warehouseData},
{label="Storage",object=storage}
}
end

local function scrollWatchBuildSchema(roots)
local schema={}
for _,root in ipairs(roots or {}) do
local object=root.object
if object~=nil then
local names=scrollWatchPropertyNames(object)
schema[root.label]={object=object,names=names,nested={}}
for _,name in ipairs(names) do
if scrollWatchKeyword(name) then
local value=read(object,name)
if value~=nil and (type(value)=="userdata" or type(value)=="table") then
local nestedNames=scrollWatchPropertyNames(value)
if #nestedNames>0 then
schema[root.label].nested[name]={object=value,names=nestedNames}
end
end
end
end
end
end
return schema
end

local function scrollWatchSnapshot(schema)
local snap={}
for rootLabel,entry in pairs(schema or {}) do
for _,name in ipairs(entry.names or {}) do
local scalar=scrollWatchScalar(read(entry.object,name))
if scalar~=nil then snap[rootLabel.."."..name]=scalar end
end
for nestedName,nested in pairs(entry.nested or {}) do
for _,name in ipairs(nested.names or {}) do
local scalar=scrollWatchScalar(read(nested.object,name))
if scalar~=nil then snap[rootLabel.."."..nestedName.."."..name]=scalar end
end
end
end
return snap
end

local function scrollWatchDiff(before,after)
local changes={}
for key,value in pairs(after or {}) do
local old=before and before[key] or nil
if old~=nil and old~=value then
changes[#changes+1]={key=key,before=old,after=value}
end
end
table.sort(changes,function(a,b) return a.key<b.key end)
return changes
end

function SpecialistFinder:TickScrollBehaviorWatch()
local w=self.ScrollBehaviorWatch
if not w then return false end
w.ticks=(w.ticks or 0)-1
if (w.delayTicks or 0)>0 then
w.delayTicks=w.delayTicks-1
return false
end
w.pollCountdown=(w.pollCountdown or 0)-1
if w.pollCountdown>0 then return false end
w.pollCountdown=w.pollEvery or 3
if not w.initialized then
w.roots=scrollWatchRoots()
w.propertyNames=scrollWatchBuildSchema(w.roots)
w.lastSnapshot=scrollWatchSnapshot(w.propertyNames)
w.initialized=true
local rootCount,scalarCount,nestedCount=0,0,0
for _,entry in pairs(w.propertyNames or {}) do
rootCount=rootCount+1
for _ in pairs(entry.nested or {}) do nestedCount=nestedCount+1 end
end
for _ in pairs(w.lastSnapshot or {}) do scalarCount=scalarCount+1 end
log("SCROLL BEHAVIOR BASELINE"
.." | label="..tostring(w.label)
.." | roots="..tostring(rootCount)
.." | nestedKeywordObjects="..tostring(nestedCount)
.." | scalarProperties="..tostring(scalarCount)
.." | storageScrollPosition="..tostring(read(warehouseStorage(),"ScrollPosition"))
.." | instruction=perform one real manual scroll now"
.." | writesPerformed=false")
return true
end
local current=scrollWatchSnapshot(w.propertyNames)
local changes=scrollWatchDiff(w.lastSnapshot,current)
if #changes>0 then
local storage=warehouseStorage()
local currentScroll=storage and read(storage,"ScrollPosition") or nil
local rows={}
local sawScroll=false
for _,change in ipairs(changes) do
rows[#rows+1]=change.key..":"..change.before.."->"..change.after
if string.find(string.lower(change.key),"scroll",1,true) then sawScroll=true end
end
w.changeCount=(w.changeCount or 0)+#changes
if sawScroll then w.scrollChangeCount=(w.scrollChangeCount or 0)+1 end
log("SCROLL BEHAVIOR CHANGE"
.." | label="..tostring(w.label)
.." | changedCount="..tostring(#changes)
.." | storageScrollPosition="..tostring(currentScroll)
.." | changes="..truncateText(table.concat(rows," || "),3200)
.." | writesPerformed=false")
w.lastSnapshot=current
end
if w.ticks<=0 then
log("SCROLL BEHAVIOR WATCH COMPLETE"
.." | label="..tostring(w.label)
.." | totalScalarChanges="..tostring(w.changeCount or 0)
.." | pollsWithScrollNamedChanges="..tostring(w.scrollChangeCount or 0)
.." | interpretation=compare SCROLL BEHAVIOR CHANGE lines around the real manual visual movement"
.." | writesPerformed=false"
.." | inventoryMutation=false")
self.ScrollBehaviorWatch=nil
end
return true
end

function SpecialistFinder:TickSearchInputMethodWatch()
local w=self.SearchInputMethodWatch
if not w then return false end
w.ticks=(w.ticks or 0)-1
if (w.delayTicks or 0)>0 then
w.delayTicks=w.delayTicks-1
return false
end

if w.stage=="wait-destination-grid" then
local button,rowIndex,gridSize=self:WarehouseTargetButton(w.targetGuid)
if not button then
if w.ticks<=0 then
log("WAREHOUSE SPECIALIST LOCATE TIMEOUT"
.." | stage=wait-destination-grid"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | gridSize="..tostring(gridSize)
.." | inventoryMutation=false")
self.SearchInputMethodWatch=nil
end
return false
end
local storage,outer,inner=self:WarehouseSearchInput()
if not inner then return false end
w.beforeGridSize=gridSize
local before=tostring(read(inner,"Text") or "")
local writeOk,writeErr=pcall(function() inner.Text=tostring(w.label or "") end)
local after=tostring(read(inner,"Text") or "")
local methodAvailable=false
local callOk=false
local callErr=""
local okGet,method=pcall(function() return inner.TextFinished end)
if okGet and type(method)=="function" then
methodAvailable=true
local ok,res=pcall(function() return inner:TextFinished() end)
callOk=ok
if not ok then callErr=tostring(res) end
end
log("WAREHOUSE SPECIALIST SEARCH COMMIT"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | destinationRowIndex="..tostring(rowIndex)
.." | beforeGridSize="..tostring(gridSize)
.." | beforeText="..tostring(before)
.." | afterText="..tostring(after)
.." | writeSuccess="..tostring(writeOk)
.." | writeError="..tostring(writeErr or "")
.." | methodAvailable="..tostring(methodAvailable)
.." | TextFinishedSuccess="..tostring(callOk)
.." | TextFinishedError="..tostring(callErr)
.." | inventoryMutation=false")
if not (writeOk and methodAvailable and callOk) then
-- Safe fallback: focus the target in the unfiltered list rather than retrying unsafe UI events.
local interaction=read(button,"Interaction")
local focusOk=false
if interaction then
local okGetFocus,methodFocus=pcall(function() return interaction.RequestFocus end)
if okGetFocus and type(methodFocus)=="function" then
focusOk=pcall(function() interaction:RequestFocus() end)
end
end
log("WAREHOUSE SPECIALIST LOCATE FALLBACK"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | RequestFocusSuccess="..tostring(focusOk)
.." | inventoryMutation=false")
self.SearchInputMethodWatch=nil
return true
end
w.stage="wait-filtered-grid"
w.delayTicks=1
return true
end

if w.stage=="wait-filtered-grid" then
local button,rowIndex,gridSize=self:WarehouseTargetButton(w.targetGuid)
if not button then
if w.ticks<=0 then
log("WAREHOUSE SPECIALIST LOCATE TIMEOUT"
.." | stage=wait-filtered-grid"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | gridSize="..tostring(gridSize)
.." | inventoryMutation=false")
self.SearchInputMethodWatch=nil
end
return false
end
local interaction=read(button,"Interaction")
local beforeFocused=interaction and read(interaction,"IsFocused") or nil
local focusAvailable=false
local focusOk=false
local focusErr=""
if interaction then
local okGet,method=pcall(function() return interaction.RequestFocus end)
if okGet and type(method)=="function" then
focusAvailable=true
local ok,res=pcall(function() return interaction:RequestFocus() end)
focusOk=ok
if not ok then focusErr=tostring(res) end
end
end
local afterFocused=interaction and read(interaction,"IsFocused") or nil
local _,_,inner=self:WarehouseSearchInput()
local currentText=tostring(inner and read(inner,"Text") or "")
log("WAREHOUSE SPECIALIST LOCATE SUCCESS"
.." | label="..tostring(w.label)
.." | targetGuid="..tostring(w.targetGuid)
.." | filteredGridSize="..tostring(gridSize)
.." | targetRowIndex="..tostring(rowIndex)
.." | searchText="..tostring(currentText)
.." | RequestFocusAvailable="..tostring(focusAvailable)
.." | RequestFocusSuccess="..tostring(focusOk)
.." | beforeFocused="..tostring(beforeFocused)
.." | afterFocused="..tostring(afterFocused)
.." | focusError="..tostring(focusErr)
.." | inventoryMutation=false")
self.SearchInputMethodWatch=nil
return true
end

if w.ticks<=0 then self.SearchInputMethodWatch=nil end
return false
end

function SpecialistFinder:JumpReportItem(slot)
slot=tonumber(slot) or 0
if self.PendingReportJump or self.JumpExecuting then
log("REPORT SHORTCUT JUMP DUPLICATE IGNORED | slot="..tostring(slot).." | reason=jump already pending")
return false
end
local target=self.PageJumpTargets and self.PageJumpTargets[slot] or nil
if not target then
log("REPORT SHORTCUT JUMP IGNORED | slot="..tostring(slot).." | reason=no mapped item on current parchment")
return false
end
if tostring(target.sessionGUID or "")~=tostring(currentSession()) then
log("REPORT SHORTCUT JUMP IGNORED | slot="..tostring(slot).." | reason=target is in another province | targetSession="..tostring(target.sessionGUID))
return false
end
self.PendingReportJump={slot=slot,target=target,marker=self.ActiveReportMarker}
if target.direct==true or target.kind=="empty-slot" or target.kind=="placement-host" then
local isWarehouse=target.kind=="warehouse"
if isWarehouse then self:ClearWarehouseSearch("before direct report warehouse jump") end
log("DIRECT REPORT JUMP REQUESTED | slot="..tostring(slot)
.." | marker="..tostring(self.ActiveReportMarker)
.." | label="..tostring(target.label or "")
.." | kind="..tostring(target.kind or "")
.." | objectID="..tostring(target.objectID or "")
.." | behavior=close parchment and jump directly; no return helper")
local closeOk,closeErr=pcall(function()
if Scripts and type(Scripts.PopUI)=="function" then Scripts:PopUI() end
end)
local selectOk,selectErr=false,""
local jumpOk,jumpErr=false,""
if target.objectIDRaw~=nil then
selectOk,selectErr=pcall(function()
if Selection and type(Selection.SelectByID)=="function" then Selection:SelectByID(target.objectIDRaw) end
end)
jumpOk,jumpErr=pcall(function()
if Scripts and type(Scripts.JumpToObject)=="function" then Scripts:JumpToObject(target.objectIDRaw) end
end)
end
self.PendingReportJump=nil
self.PendingJumpReady=false
self.PageJumpTargets={}
self.ActiveReportMarker=nil
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
self.ReportMenuReopenedForCycle=false
self.MenuSessionActive=false
self.MenuWasVisible=false
self.ReportPopupSeenForCycle=false
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=false
self.PopupWasVisible=false
self.PopupWatchTicks=0
if isWarehouse and (jumpOk or selectOk) then
self.InfoTipWatch=nil
self.SearchInputMethodWatch={
label=tostring(target.label or ""),
targetGuid=tonumber(target.guid) or 0,
ticks=40,
delayTicks=1,
stage="wait-destination-grid",
beforeGridSize=-1
}
log("DIRECT WAREHOUSE SPECIALIST LOCATE ARMED"
.." | label="..tostring(target.label or "")
.." | targetGuid="..tostring(target.guid or "")
.." | delayTicks=1"
.." | then=Text write + TextFinished + RequestFocus"
.." | inventoryMutation=false")
end
log("DIRECT REPORT JUMP EXECUTED | slot="..tostring(slot)
.." | kind="..tostring(target.kind or "")
.." | closeSuccess="..tostring(closeOk)
.." | selectSuccess="..tostring(selectOk)
.." | jumpSuccess="..tostring(jumpOk)
.." | closeError="..tostring(closeErr or "")
.." | selectError="..tostring(selectErr or "")
.." | jumpError="..tostring(jumpErr or ""))
return jumpOk or selectOk
end
log("REPORT SHORTCUT JUMP REQUESTED | keyTokenFamily=Digit1-Digit9"
.." | slot="..tostring(slot)
.." | marker="..tostring(self.ActiveReportMarker)
.." | label="..tostring(target.label or "")
.." | objectID="..tostring(target.objectID or "")
.." | returnHelperArmed="..tostring(self.ReturnRequestArmed)
.." | behavior=close parchment now, consume single existing return helper, then jump")
self.PendingJumpReady=false
local closeOk,closeErr=pcall(function()
if Scripts and type(Scripts.PopUI)=="function" then Scripts:PopUI() end
end)
-- The dedicated return helper normally materializes immediately after TextPopup leaves.
-- Keep probing the SAME helper; when EventPrimary arms it, Tick executes the stored jump.
if (self.ReturnRequestProbeTicks or 0)<20 then self.ReturnRequestProbeTicks=20 end
self.PendingJumpDelayTicks=0
log("REPORT SHORTCUT JUMP CLOSE PAPER"
.." | slot="..tostring(slot)
.." | success="..tostring(closeOk)
.." | probeTicksRemaining="..tostring(self.ReturnRequestProbeTicks or 0)
.." | error="..tostring(closeErr or "")
.." | newReturnHelper=false")
return true
end
function SpecialistFinder:JumpReport1() return self:JumpReportItem(1) end
function SpecialistFinder:JumpReport2() return self:JumpReportItem(2) end
function SpecialistFinder:JumpReport3() return self:JumpReportItem(3) end
function SpecialistFinder:JumpReport4() return self:JumpReportItem(4) end
function SpecialistFinder:JumpReport5() return self:JumpReportItem(5) end
function SpecialistFinder:JumpReport6() return self:JumpReportItem(6) end
function SpecialistFinder:JumpReport7() return self:JumpReportItem(7) end
function SpecialistFinder:JumpReport8() return self:JumpReportItem(8) end
function SpecialistFinder:JumpReport9() return self:JumpReportItem(9) end
local bestUseText
local function reportStats(list)
local stored,equipped,total=0,0,0
for _,a in ipairs(list or {}) do
stored=stored+(a.stored or 0)
equipped=equipped+(a.equipped or 0)
total=total+(a.total or 0)
end
return stored,equipped,total
end
local function reportHeader(title,list,page,pageCount,extra)
local stored,equipped,total=reportStats(list)
local lines={}
lines[#lines+1]=title
lines[#lines+1]=string.upper(provinceLabel(currentSession()))
.." • "..tostring(#(list or {})).." TYPES"
.." • "..tostring(stored).." AVAILABLE"
.." • "..tostring(equipped).." EQUIPPED"
if pageCount and pageCount>1 then
lines[#lines+1]="PAGE "..tostring(page or 1).." OF "..tostring(pageCount)
end
if extra and extra~="" then lines[#lines+1]=string.upper(extra) end
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
return table.concat(lines,"\n")
end
local function rarityText(a)
local r=trimText(a and a.rarity or "")
if r=="" then return "RARITY ?" end
return string.upper(r)
end
local function compactStoredLocationText(a,maxCount)
local parts={}
local locations=(a and a.storedLocations) or {}
local limit=math.min(#locations,maxCount or 2)
for i=1,limit do
local raw=trimText(locations[i])
local area,count=string.match(raw,"^(.-)%s+warehouse%s+x(%d+)$")
if area then
parts[#parts+1]=trimText(area).." ×"..tostring(count)
elseif raw~="" then
parts[#parts+1]=raw
end
end
if #locations>limit then parts[#parts+1]="+"..tostring(#locations-limit).." locations" end
return table.concat(parts," • ")
end
local function compactEquippedLocationText(a,maxCount)
local parts={}
local locations=(a and a.equippedLocations) or {}
local limit=math.min(#locations,maxCount or 2)
for i=1,limit do
local raw=trimText(locations[i])
raw=string.gsub(raw,"Governor's Villa","Villa")
raw=string.gsub(raw," — "," / ")
parts[#parts+1]=raw
end
if #locations>limit then parts[#parts+1]="+"..tostring(#locations-limit).." placements" end
return table.concat(parts," • ")
end
local EFFECT_SHORTEN = {
{"Knowledge from Bird Tongues in Aspic, if supplied","Bird Tongues knowledge"},
{"Knowledge from Pileus, if supplied","Pileus knowledge"},
{"Ship Scorpion Attack range","Scorpion range"},
{"Ship Scorpion Attack speed","Scorpion speed"},
{"Goods Transfer Speed","Goods transfer"},
{"Province Transfer Speed","Province transfer"},
{"Discovery Radius","Discovery"},
{"Workforce from residents","Resident workforce"},
{"Workforce Needed","Workforce needed"},
{"Upkeep Cost","Upkeep"},
{"Unfavourable Wind Impact","Bad-wind impact"},
{"Favourable Wind Angle","Favourable wind"},
{"Movement Speed","Movement"},
{"Self-repair speed","Self-repair"},
{"Prestige Area Effect","Prestige area"},
{"Knowledge Area Effect","Knowledge area"},
{"Health Area Effect","Health area"}
}
local function shortenEffectPart(part)
local text=trimText(part)
if text=="Seafaring Captain" or text=="Military Captain" then return "" end
for _,pair in ipairs(EFFECT_SHORTEN) do
text=string.gsub(text,pair[1],pair[2])
end
return text
end
local function compactEffectParts(a)
local parts={}
local effects=trimText(a and a.effects or "")
if effects=="" then return parts end
for raw in string.gmatch(effects,"([^;]+)") do
local short=shortenEffectPart(raw)
if short~="" then parts[#parts+1]=short end
end
return parts
end
local function compactEffectLines(a,maxLines,maxChars)
if not a or not a.verified then return {"Effects not yet verified"} end
local parts=compactEffectParts(a)
if #parts==0 then
local e=trimText(a.effects)
if e~="" then return {e} end
return {"Verified specialist • numerical effect not available"}
end
local lines={}
local current=""
local charLimit=maxChars or 74
local lineLimit=maxLines or 2
for _,part in ipairs(parts) do
local candidate=current=="" and part or (current.." • "..part)
if #candidate>charLimit and current~="" then
lines[#lines+1]=current
current=part
if #lines>=lineLimit then break end
else
current=candidate
end
end
if #lines<lineLimit and current~="" then lines[#lines+1]=current end
if #parts>0 and #lines==0 then lines[1]=parts[1] end
return lines
end
local function shortRecommendation(a)
local e=trimText(a.effects)
local target=bestUseText(a)
if string.find(e,"Ship Scorpion Attack",1,true) or string.find(e,"Military Captain",1,true) then
return ">>> USE: MILITARY SHIP <<<"
end
if string.find(e,"Goods Transfer Speed",1,true) or string.find(e,"Province Transfer Speed",1,true) then
return ">>> USE: BUSY TRADE / TRANSFER SHIP <<<"
end
if string.find(e,"Wind",1,true) or (target=="Ships" and string.find(e,"Movement Speed",1,true)) then
return ">>> USE: SAILING OR TRADE SHIP <<<"
end
if string.find(e,"Productivity",1,true) then return ">>> USE: "..string.upper(target).." PRODUCTION <<<" end
if string.find(e,"Workforce Needed",1,true) or string.find(e,"Upkeep Cost",1,true) then return ">>> USE: DENSE "..string.upper(target).." CLUSTER <<<" end
if string.find(e,"Workforce from residents",1,true) then return ">>> USE: DENSE "..string.upper(target).." RESIDENTIAL AREA <<<" end
if string.find(e,"Prestige",1,true) or string.find(e,"Happiness",1,true) or string.find(e,"Health",1,true)
or string.find(e,"Belief",1,true) or string.find(e,"Knowledge",1,true) or string.find(e,"Fire Safety",1,true) then
return ">>> USE: LARGE AFFECTED RESIDENTIAL / CIVIC AREA <<<"
end
if string.find(e,"Hitpoints",1,true) or string.find(e,"Self-repair",1,true) then return ">>> USE: DEFEND "..string.upper(target).." <<<" end
return ">>> USE: "..string.upper(target).." <<<"
end
local function actionFirstStoredLocation(a)
local locations=(a and a.storedLocations) or {}
if #locations==0 then return "LOCATION ?" end
local raw=trimText(locations[1])
local area,count=string.match(raw,"^(.-)%s+warehouse%s+x(%d+)$")
local text
if area then
text=trimText(area).." warehouse"
elseif raw~="" then
text=raw
else
text="LOCATION ?"
end
if #locations>1 then text=text.." +"..tostring(#locations-1).." locations" end
return text
end
local function opportunityDecisionLabel(a)
if (a.stored or 0)<=0 then return "ALREADY DEPLOYED" end
if (a.equipped or 0)==0 and a.verified and trimText(a.effects)~="" then return "DEPLOY NOW" end
if (a.equipped or 0)>0 and a.verified and trimText(a.effects)~="" then return "SPARE COPY" end
if (a.equipped or 0)==0 then return "VERIFY FIRST" end
return "SPARE — VERIFY FIRST"
end
local function opportunityDecisionReason(a)
if (a.stored or 0)<=0 then return "No available stored copy." end
if (a.equipped or 0)==0 and a.verified and trimText(a.effects)~="" then
return "Verified specialist with no current placement."
end
if (a.equipped or 0)>0 and a.verified and trimText(a.effects)~="" then
return "Already useful elsewhere; an additional copy is still available."
end
if (a.equipped or 0)==0 then
return "Completely unused, but its effect profile is not yet fully verified."
end
return "Extra copy available, but its effect profile is not yet fully verified."
end
local categoryLabel,confidenceLabel
local function appendActionFirstCard(lines,index,a,jumpSlot,preference)
local loc=actionFirstStoredLocation(a)
local jumpRef=preferredJumpRef(a,preference or "stored")
local jumpSuffix=registerPageJump(jumpSlot,jumpRef,trimText(a.name))
lines[#lines+1]=tostring(index)..". >>> "..opportunityDecisionLabel(a).." <<<"..jumpSuffix
lines[#lines+1]=rarityText(a).." • "..opportunityDecisionReason(a)
lines[#lines+1]="Location: "..loc
lines[#lines+1]="Available: "..tostring(a.stored or 0).." • Equipped: "..tostring(a.equipped or 0)
lines[#lines+1]="Category: "..categoryLabel(a).." • Confidence: "..confidenceLabel(a)
local target=bestUseText(a)
lines[#lines+1]="Target: "..(target~="" and target or "Not yet verified")
local effectLines=compactEffectLines(a,2,70)
if #effectLines>0 then
lines[#lines+1]="Effects: "..effectLines[1]
for i=2,#effectLines do lines[#lines+1]="         "..effectLines[i] end
else
lines[#lines+1]="Effects: Not yet verified"
end
lines[#lines+1]="Specialist: "..trimText(a.name)
lines[#lines+1]=""
lines[#lines+1]=shortRecommendation(a)
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
end
local function appendCompactCard(lines,index,a,includeRecommendation)
local status
if (a.equipped or 0)==0 then
status="[UNUSED] "..tostring(a.stored or 0).." AVAILABLE"
elseif (a.stored or 0)>0 then
status="[SPARE] "..tostring(a.stored).." AVAILABLE • "..tostring(a.equipped).." EQUIPPED"
else
status="[FULLY DEPLOYED] "..tostring(a.equipped or 0)
end
lines[#lines+1]=tostring(index)..". "..string.upper(trimText(a.name)).." — "..rarityText(a)
local target=bestUseText(a)
local loc=compactStoredLocationText(a,1)
local statusLine=status
if target~="" then statusLine=statusLine.." • "..string.upper(target) end
if loc~="" then statusLine=statusLine.." • "..loc end
lines[#lines+1]=statusLine
for _,effectLine in ipairs(compactEffectLines(a,2,76)) do lines[#lines+1]=effectLine end
if includeRecommendation then lines[#lines+1]=shortRecommendation(a) end
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
end
local function pageRange(total,pageCount,page)
if total<=0 then return 1,0,0 end
local size=math.max(1,math.ceil(total/pageCount))
local first=(page-1)*size+1
local last=math.min(total,page*size)
if first>total then return first,total,size end
return first,last,size
end
local function parseNumericEffects(effects)
local metrics={}
for raw in string.gmatch(cleanText(effects),"([^;]+)") do
local part=trimText(raw)
local label,sign,num=string.match(part,"^(.-)%s+([%+%-])([%d%.]+)%%%s*$")
local isPercent=true
if not label then
label,sign,num=string.match(part,"^(.-)%s+([%+%-])([%d%.]+)%s*$")
isPercent=false
end
if label and sign and num then
label=trimText(label)
local value=tonumber(num) or 0
if sign=="-" then value=-value end
metrics[label]={label=label,value=value,isPercent=isPercent}
end
end
return metrics
end
local function effectWeight(label,isPercent)
if string.find(label,"Productivity",1,true) then return 1.50 end
if string.find(label,"Goods Transfer Speed",1,true) then return 1.30 end
if string.find(label,"Province Transfer Speed",1,true) then return 1.15 end
if string.find(label,"Workforce Needed",1,true) then return 1.20 end
if string.find(label,"Workforce from residents",1,true) then return 1.20 end
if string.find(label,"Upkeep Cost",1,true) then return 0.75 end
if string.find(label,"Movement Speed",1,true) then return 1.00 end
if string.find(label,"Attack speed",1,true) then return 1.05 end
if string.find(label,"Attack range",1,true) then return 0.95 end
if string.find(label,"Unfavourable Wind Impact",1,true) then return 0.85 end
if string.find(label,"Favourable Wind Angle",1,true) then return 0.80 end
if string.find(label,"Hitpoints",1,true) then return 0.40 end
if string.find(label,"Self-repair speed",1,true) then return 0.30 end
if string.find(label,"Discovery Radius",1,true) then return 0.30 end
if not isPercent then return 1.00 end
return 0.80
end
local function effectImpactScore(a)
if not a.verified or trimText(a.effects)=="" then return 0 end
local score=0
local count=0
for label,m in pairs(parseNumericEffects(a.effects)) do
local magnitude=math.abs(m.value)
local base
if m.isPercent then
base=math.min(magnitude,100)
else
base=math.min(magnitude*22,60)
end
score=score + base*effectWeight(label,m.isPercent)
count=count+1
end
if string.find(cleanText(a.effects),"Seafaring Captain",1,true) then score=score+4 end
if string.find(cleanText(a.effects),"Military Captain",1,true) then score=score+4 end
if count==0 and a.verified then score=12 end
return math.min(score,180)
end
local function impactLabel(a)
if not a.verified or trimText(a.effects)=="" then return "UNVERIFIED" end
local score=effectImpactScore(a)
if score>=100 then return "VERY HIGH" end
if score>=60 then return "HIGH" end
if score>=30 then return "MEDIUM" end
return "SPECIALIZED"
end
confidenceLabel = function(a)
if a and a.verified and trimText(a.effects)~="" and trimText(a.targets)~="" then return "HIGH" end
if a and (a.verified or trimText(a.targets)~="" or trimText(a.effects)~="") then return "MEDIUM" end
return "LOW"
end
categoryLabel = function(a)
local e=trimText(a and a.effects or "")
local t=trimText(a and a.targets or "")
local n=trimText(a and a.niche or "")
if t=="Ships" or n=="Seafaring" or n=="Military" or string.find(e,"Goods Transfer Speed",1,true) or string.find(e,"Ship Scorpion",1,true) then return "SHIPS" end
if string.find(e,"Productivity",1,true) then return "PRODUCTION" end
if string.find(e,"Workforce",1,true) or string.find(e,"Upkeep",1,true) then return "WORKFORCE" end
if string.find(e,"Income",1,true) or string.find(t,"Residence",1,true) then return "RESIDENTS" end
if string.find(e,"Prestige",1,true) or string.find(e,"Knowledge",1,true) or string.find(e,"Health",1,true) or string.find(e,"Belief",1,true) or string.find(e,"Happiness",1,true) then return "CIVIC" end
if string.find(e,"Attack",1,true) or string.find(e,"Hitpoints",1,true) or string.find(e,"Self-repair",1,true) then return "MILITARY" end
return "GENERAL"
end
local function opportunityScore(a)
local score = effectImpactScore(a) * 2
if a.stored > 0 and a.equipped == 0 then score = score + 70 else score = score + 20 end
if a.verified and trimText(a.effects) ~= "" then score = score + 25 end
if trimText(a.targets) ~= "" then score = score + 10 end
score = score + rarityRank(a.rarity) * 12
score = score + math.min(a.stored or 0,5) * 3
return score
end
bestUseText = function(a)
local target=trimText(a.targets)
local niche=trimText(a.niche)
if target ~= "" then return target end
if niche ~= "" then return niche end
return "Target not yet identified"
end
local function whyUsefulText(a)
local effects=trimText(a.effects)
local target=trimText(a.targets)
local niche=trimText(a.niche)
if a.verified and effects ~= "" then
if string.find(effects,"Goods Transfer Speed",1,true) or string.find(effects,"Province Transfer Speed",1,true) then
return "Strong logistics candidate for ships that load/unload frequently or travel between provinces."
elseif string.find(effects,"Unfavourable Wind Impact",1,true) or string.find(effects,"Favourable Wind Angle",1,true) then
return "Useful on sailing ships where wind performance materially affects route time."
elseif string.find(effects,"Movement Speed",1,true) then
return "Useful where faster ship movement improves route or travel performance."
elseif string.find(effects,"Productivity",1,true) then
return "Direct output improvement for the listed production target."
elseif string.find(effects,"Workforce Needed",1,true) or string.find(effects,"Upkeep Cost",1,true) then
return "Reduces workforce and/or operating cost for the listed buildings."
elseif string.find(effects,"Workforce from residents",1,true) then
return "Generates additional workforce from the listed residences."
elseif string.find(effects,"Income",1,true) then
return "Improves income from the listed residences."
elseif string.find(effects,"Happiness",1,true) or string.find(effects,"Belief",1,true) or string.find(effects,"Knowledge",1,true) then
return "Improves an important resident/civic value in the listed target."
elseif string.find(effects,"Health",1,true) or string.find(effects,"Fire Safety",1,true) then
return "Useful where resilience and resident safety are the priority."
elseif string.find(effects,"Prestige",1,true) then
return "Useful where prestige from the listed target matters."
elseif string.find(effects,"Hitpoints",1,true) or string.find(effects,"Attack",1,true) or string.find(effects,"Self-repair",1,true) then
return "Strengthens the listed military or defensive target."
end
return "Verified effects make this specialist worth reviewing for the listed target."
end
if target ~= "" then return "Target is known, but the numerical effects are not yet verified." end
if niche ~= "" then return "Unused "..niche.." specialist; effect profile still needs verification." end
return "Unused specialist; effect and target still need verification."
end
local function suggestedActionText(a)
if a.stored<=0 then return "Already fully deployed in this province." end
local target=bestUseText(a)
if a.equipped==0 then
return "Completely unused — review for "..target.." before leaving it in storage."
end
return "Already used in "..tostring(a.equipped).." placement"..(a.equipped==1 and "" or "s").."; consider whether another copy is useful for "..target.."."
end
local function sameTarget(a,b)
local ta=trimText(a.targets)
local tb=trimText(b.targets)
if ta=="" or tb=="" then return false end
return ta==tb
end
local function desiredDirection(label)
if string.find(label,"Workforce Needed",1,true) then return -1 end
if string.find(label,"Upkeep Cost",1,true) then return -1 end
if string.find(label,"Unfavourable Wind Impact",1,true) then return -1 end
return 1
end
local function formatMetricValue(m)
local value=m.value or 0
local prefix=value>0 and "+" or ""
return prefix..tostring(value)..(m.isPercent and "%" or "")
end
local function compareSharedEffects(candidate,current)
local cm=parseNumericEffects(candidate.effects)
local om=parseNumericEffects(current.effects)
local improvements,worsenings,equals,missingCurrent,additionalCandidate={},{},{},{},{}
local shared=0
local improvementMagnitude=0
for label,c in pairs(cm) do
local o=om[label]
if o and c.isPercent==o.isPercent then
shared=shared+1
local advantage=desiredDirection(label)*(c.value-o.value)
local text=label..": "..formatMetricValue(o).." -> "..formatMetricValue(c)
if advantage>0.0001 then
improvements[#improvements+1]=text
improvementMagnitude=improvementMagnitude+math.abs(c.value-o.value)
elseif advantage<-0.0001 then
worsenings[#worsenings+1]=text
else
equals[#equals+1]=text
end
else
additionalCandidate[#additionalCandidate+1]=label.." "..formatMetricValue(c)
end
end
for label,o in pairs(om) do
local c=cm[label]
if not c or c.isPercent~=o.isPercent then
missingCurrent[#missingCurrent+1]=label.." "..formatMetricValue(o)
end
end
local classification="DIFFERENT BENEFITS"
if shared>0 then
if #improvements>0 and #worsenings==0 and #missingCurrent==0 then classification="CLEAR SHARED-EFFECT UPGRADE"
elseif #improvements>0 then classification="MIXED TRADE-OFF"
elseif #worsenings>0 then classification="NOT AN UPGRADE ON SHARED EFFECTS"
elseif #missingCurrent==0 then classification="SAME ON SHARED EFFECTS"
else classification="DIFFERENT BENEFITS" end
end
return {
classification=classification,
shared=shared,
improvements=improvements,
worsenings=worsenings,
equals=equals,
missingCurrent=missingCurrent,
additionalCandidate=additionalCandidate,
magnitude=improvementMagnitude
}
end
local function buildUpgradeReviews(all)
local reviews={}
for _,candidate in ipairs(all) do
if candidate.stored>0 and candidate.verified and trimText(candidate.targets)~="" then
for _,current in ipairs(all) do
if current.guid~=candidate.guid and current.equipped>0 and current.verified and sameTarget(candidate,current) then
local cmp=compareSharedEffects(candidate,current)
local worthReview = cmp.classification=="CLEAR SHARED-EFFECT UPGRADE"
or cmp.classification=="MIXED TRADE-OFF"
if worthReview then
for locIndex,loc in ipairs(current.equippedLocations or {}) do
reviews[#reviews+1]={
candidate=candidate,
current=current,
location=loc,
targetRef=(current.equippedRefs or {})[locIndex],
comparison=cmp
}
end
end
end
end
end
end
table.sort(reviews,function(a,b)
local order={
["CLEAR SHARED-EFFECT UPGRADE"]=1,
["MIXED TRADE-OFF"]=2,
["DIFFERENT BENEFITS"]=3,
["SAME ON SHARED EFFECTS"]=4,
["NOT AN UPGRADE ON SHARED EFFECTS"]=5
}
local ao=order[a.comparison.classification] or 9
local bo=order[b.comparison.classification] or 9
if ao~=bo then return ao<bo end
if a.comparison.magnitude~=b.comparison.magnitude then return a.comparison.magnitude>b.comparison.magnitude end
local ai,bi=effectImpactScore(a.candidate),effectImpactScore(b.candidate)
if ai~=bi then return ai>bi end
return trimText(a.candidate.name)<trimText(b.candidate.name)
end)
return reviews
end
local function markerMode(marker)
marker=tostring(marker or "")
if string.match(marker,"^SF_V014_BEST_P%d+$") or marker=="SF_V014_BEST" or marker=="SF_FILTER_OPPORTUNITIES" or marker=="SF_FILTER_COMPLETE" then return "best" end
if string.match(marker,"^SF_V014_UNUSED_P%d+$") or marker=="SF_V014_UNUSED" or marker=="SF_FILTER_UNUSED" then return "unused" end
if marker=="SF_V041_BEST_USE_NOW" then return "best_use_now" end
if marker=="SF_V041_BEST_SPARES" then return "best_spares" end
if marker=="SF_V041_BEST_STRONG_UNUSED" then return "best_strong_unused" end
if marker=="SF_V041_BEST_NEEDS_REVIEW" then return "best_needs_review" end
if string.match(marker,"^SF_V050_EMPTY_SLOTS_P%d+$") or marker=="SF_V050_EMPTY_SLOTS" then return "empty_slots" end
if marker=="SF_V050_CHANGES" then return "changes" end
if marker=="SF_V050_SHIPS" then return "ships" end
if marker=="SF_V050_EMPIRE" then return "empire" end
if marker=="SF_V014_IMPROVE" then return "improve" end
if string.match(marker,"^SF_V014_PURPOSE_P%d+$") or marker=="SF_V014_PURPOSE" then return "purpose" end
if string.match(marker,"^SF_V014_ALL_P%d+$") or marker=="SF_V014_ALL" or marker=="SF_FILTER_LOCATIONS" then return "all" end
if marker=="SF_FILTER_EQUIPPED" then return "equipped" end
if marker=="SF_V014_RESCAN" or marker=="SF_FILTER_RESCAN" then return "rescan" end
return "unknown"
end
local function markerPage(marker)
local page=tonumber(string.match(tostring(marker or ""),"_P(%d+)$"))
return page or 1
end
local function sortPurposeList(list)
table.sort(list,function(a,b)
local aa=(a.stored or 0)>0 and 1 or 0
local ba=(b.stored or 0)>0 and 1 or 0
if aa~=ba then return aa>ba end
local ai,bi=effectImpactScore(a),effectImpactScore(b)
if ai~=bi then return ai>bi end
local ar,br=rarityRank(a.rarity),rarityRank(b.rarity)
if ar~=br then return ar>br end
return trimText(a.name)<trimText(b.name)
end)
end
local function opportunityTier(a)
if a.equipped==0 and a.verified then return 1 end
if a.equipped>0 and a.verified then return 2 end
if a.equipped==0 then return 3 end
return 4
end
local function sortUnusedList(list)
table.sort(list,function(a,b)
local at,bt=opportunityTier(a),opportunityTier(b)
if at~=bt then return at<bt end
local as,bs=opportunityScore(a),opportunityScore(b)
if as~=bs then return as>bs end
return trimText(a.name)<trimText(b.name)
end)
end
local function sortAlphabetical(list)
table.sort(list,function(a,b) return trimText(a.name)<trimText(b.name) end)
end
local function buildImproveExistingReport(all)
local reviews=buildUpgradeReviews(all)
local clear,mixed=0,0
for _,r in ipairs(reviews) do
if r.comparison.classification=="CLEAR SHARED-EFFECT UPGRADE" then clear=clear+1
elseif r.comparison.classification=="MIXED TRADE-OFF" then mixed=mixed+1 end
end
local lines={}
lines[#lines+1]="IMPROVE EQUIPPED SPECIALISTS"
lines[#lines+1]=string.upper(provinceLabel(currentSession())).." • "..tostring(clear).." CLEAR IMPROVEMENT"..(clear==1 and "" or "S").." • "..tostring(mixed).." CHANGE"..(mixed==1 and "" or "S").." TO REVIEW"
lines[#lines+1]="Clear improvements are shown first."
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
if #reviews==0 then
lines[#lines+1]="No clear improvements were found among the specialists whose effects are currently verified."
lines[#lines+1]=""
lines[#lines+1]="This does not mean every equipped specialist is optimal; many specialist effects still need verification."
return table.concat(lines,"\n")
end
for i=1,math.min(#reviews,9) do
local r=reviews[i]
local a,c,cmp=r.candidate,r.current,r.comparison
local location=trimText(r.location)
location=string.gsub(location,"Governor's Villa","Villa")
location=string.gsub(location," — "," / ")
local isClear=cmp.classification=="CLEAR SHARED-EFFECT UPGRADE"
local improveSuffix=registerPageJump(i,preferredJumpRef(a,"stored"),trimText(a.name))
lines[#lines+1]=tostring(i)..". "..string.upper(location)
lines[#lines+1]=""
lines[#lines+1]="CURRENTLY EQUIPPED"
lines[#lines+1]=trimText(c.name)
local currentEffects=compactEffectParts(c)
if #currentEffects>0 then lines[#lines+1]=table.concat(currentEffects," • ") end
lines[#lines+1]=""
lines[#lines+1]=(isClear and "BETTER SPECIALIST AVAILABLE" or "POSSIBLE ALTERNATIVE")
lines[#lines+1]=trimText(a.name)..improveSuffix
local candidateEffects=compactEffectParts(a)
if #candidateEffects>0 then lines[#lines+1]=table.concat(candidateEffects," • ") end
lines[#lines+1]=""
if isClear then
lines[#lines+1]=">>> RECOMMENDATION: REPLACE "..string.upper(trimText(c.name)).." <<<"
for _,text in ipairs(cmp.improvements or {}) do
lines[#lines+1]="IMPROVEMENT: "..text
end
else
lines[#lines+1]=">>> REVIEW BEFORE REPLACING <<<"
for _,text in ipairs(cmp.improvements or {}) do lines[#lines+1]="IMPROVES: "..text end
for _,text in ipairs(cmp.worsenings or {}) do lines[#lines+1]="BUT WORSE: "..text end
for _,text in ipairs(cmp.missingCurrent or {}) do lines[#lines+1]="YOU WOULD LOSE: "..text end
end
local stored=compactStoredLocationText(a,2)
if stored~="" then lines[#lines+1]="AVAILABLE IN: "..stored end
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
end
if #reviews>9 then lines[#lines+1]="Showing the first 9 of "..tostring(#reviews).." possible changes so every displayed recommendation has a Ctrl+Alt+1…9 jump." end
return table.concat(lines,"\n")
end
local PURPOSES = {
{name="PRODUCTION & OUTPUT", match=function(a)
return string.find(trimText(a.effects),"Productivity",1,true)~=nil
end},
{name="WORKFORCE & UPKEEP", match=function(a)
local e=trimText(a.effects)
return string.find(e,"Workforce Needed",1,true)~=nil or string.find(e,"Upkeep Cost",1,true)~=nil or string.find(e,"Workforce from residents",1,true)~=nil
end},
{name="RESIDENTS & INCOME", match=function(a)
local e,t=trimText(a.effects),trimText(a.targets)
return string.find(t,"Residence",1,true)~=nil or string.find(t,"Residences",1,true)~=nil or string.find(e,"Income",1,true)~=nil
end},
{name="CIVIC NEEDS & KNOWLEDGE", match=function(a)
local e=trimText(a.effects)
return string.find(e,"Prestige",1,true)~=nil or string.find(e,"Happiness",1,true)~=nil
or string.find(e,"Health",1,true)~=nil or string.find(e,"Fire Safety",1,true)~=nil
or string.find(e,"Belief",1,true)~=nil or string.find(e,"Knowledge",1,true)~=nil
end},
{name="SHIPS & TRADE", match=function(a)
local e,t,n=trimText(a.effects),trimText(a.targets),trimText(a.niche)
return t=="Ships" or n=="Seafaring"
or string.find(e,"Goods Transfer Speed",1,true)~=nil
or string.find(e,"Province Transfer Speed",1,true)~=nil
or string.find(e,"Movement Speed",1,true)~=nil
or string.find(e,"Wind",1,true)~=nil
end},
{name="MILITARY & DEFENSE", match=function(a)
local e,t,n=trimText(a.effects),trimText(a.targets),trimText(a.niche)
return n=="Military" or string.find(e,"Attack",1,true)~=nil or string.find(e,"Hitpoints",1,true)~=nil
or string.find(e,"Self-repair",1,true)~=nil or string.find(t,"Towers",1,true)~=nil
end}
}
local function firstUsefulLocation(a)
if a.stored>0 and #(a.storedLocations or {})>0 then return "Stored: "..a.storedLocations[1] end
if a.equipped>0 and #(a.equippedLocations or {})>0 then return "Equipped: "..a.equippedLocations[1] end
return ""
end
local function buildPurposeReport(all,page)
page=math.max(1,math.min(6,page or 1))
local purpose=PURPOSES[page]
local matches={}
for _,a in ipairs(all) do
if a.total>0 and a.verified and purpose.match(a) then matches[#matches+1]=a end
end
sortPurposeList(matches)
local lines={reportHeader("FIND BY PURPOSE — "..purpose.name,all,page,6,"Verified specialists • strongest available options first")}
if #matches==0 then
lines[#lines+1]="No verified owned specialists matched this purpose."
return table.concat(lines,"\n")
end
local limit=math.min(#matches,12)
lines[#lines+1]="Showing "..tostring(limit).." of "..tostring(#matches).." matching specialists. Ctrl+Alt+1…9 jumps to the corresponding stored specialist when available."
lines[#lines+1]=""
for i=1,limit do
local a=matches[i]
local jumpSuffix=registerPageJump(i,preferredJumpRef(a,"stored"),trimText(a.name))
local status
if (a.equipped or 0)==0 then status="[UNUSED] "..tostring(a.stored or 0).." AVAILABLE"
elseif (a.stored or 0)>0 then status="[SPARE] "..tostring(a.stored).." AVAILABLE • "..tostring(a.equipped).." EQUIPPED"
else status="[FULLY DEPLOYED] "..tostring(a.equipped or 0) end
lines[#lines+1]=tostring(i)..". "..string.upper(trimText(a.name)).." — "..rarityText(a)..jumpSuffix
local target=bestUseText(a)
local loc=compactStoredLocationText(a,1)
local statusLine=status
if target~="" then statusLine=statusLine.." • "..string.upper(target) end
if loc~="" then statusLine=statusLine.." • "..loc end
lines[#lines+1]=statusLine
for _,effectLine in ipairs(compactEffectLines(a,2,76)) do lines[#lines+1]=effectLine end
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
end
if #matches>limit then lines[#lines+1]="+ "..tostring(#matches-limit).." more matches. Use All Specialists for the complete inventory." end
return table.concat(lines,"\n")
end
local function aggregateSessionCached(session)
session=tostring(session or "")
local byGuid={}
for _,row in ipairs(SpecialistFinder.StoredCache[session] or {}) do
local a=byGuid[row.guid]
if not a then a={guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={}}; byGuid[row.guid]=a else mergeProfile(a,row) end
a.stored=a.stored+(row.amount or 1)
a.storedLocations[#a.storedLocations+1]=cleanText(row.areaName).." warehouse x"..tostring(row.amount or 1)
a.storedRefs[#a.storedRefs+1]={sessionGUID=session,objectIDRaw=row.warehouseIDRaw,objectID=row.warehouseID,areaName=row.areaName,guid=row.guid,kind="warehouse"}
end
local data=SpecialistFinder.Cache[session]
for _,row in ipairs(data and data.rows or {}) do
local a=byGuid[row.guid]
if not a then a={guid=row.guid,name=row.name,rarity=row.rarity,niche=row.niche,targets=row.targets,effects=row.effects,verified=row.verified,stored=0,equipped=0,storedLocations={},equippedLocations={},storedRefs={},equippedRefs={}}; byGuid[row.guid]=a else mergeProfile(a,row) end
a.equipped=a.equipped+1
a.equippedRefs[#a.equippedRefs+1]={sessionGUID=session,objectIDRaw=row.objectIDRaw,objectID=row.objectID,areaName=row.areaName,buildingType=row.buildingType,objectName=row.objectName,slot=row.slot,kind=row.isShip and "ship" or "equipped"}
end
local list={}; for _,a in pairs(byGuid) do a.total=a.stored+a.equipped; list[#list+1]=a end
return list
end
local function specialistIsShipCandidate(a)
local e,t,n=trimText(a.effects),trimText(a.targets),trimText(a.niche)
return t=="Ships" or n=="Seafaring" or n=="Military" or string.find(e,"Goods Transfer Speed",1,true)~=nil or string.find(e,"Province Transfer Speed",1,true)~=nil or string.find(e,"Wind",1,true)~=nil or string.find(e,"Ship Scorpion",1,true)~=nil
end
local function buildEmptySlotReport(page)
local slots={}
local reportSession=tostring(currentSession() or "")
for _,row in ipairs((SpecialistFinder.EmptySlotsCache or {})[reportSession] or {}) do slots[#slots+1]=row end
table.sort(slots,function(a,b)
if tostring(a.sessionGUID)~=tostring(b.sessionGUID) then return tostring(a.sessionGUID)<tostring(b.sessionGUID) end
if tostring(a.areaName)~=tostring(b.areaName) then return tostring(a.areaName)<tostring(b.areaName) end
if tostring(a.buildingType)~=tostring(b.buildingType) then return tostring(a.buildingType)<tostring(b.buildingType) end
return tostring(a.slot)<tostring(b.slot)
end)
page=tonumber(page) or 1
local pageCount=math.max(1,math.ceil(#slots/9))
page=math.max(1,math.min(pageCount,page))
local first=(page-1)*9+1
local last=math.min(#slots,page*9)
local lines={"EMPTY SLOT OPPORTUNITIES",string.upper(provinceLabel(reportSession)).." • "..tostring(#slots).." detected empty specialist slots • PAGE "..tostring(page).." / "..tostring(pageCount),"Each parchment page has at most 9 entries so Ctrl+Alt+1…9 always maps to the visible page.","----------------------------------------",""}
if #slots==0 then
lines[#lines+1]="No empty specialist socket entries were exposed by ItemContainer.Sockets in the scanned data."
lines[#lines+1]=""
lines[#lines+1]="This can mean your scanned specialist hosts are full, or that Anno does not expose completely empty sockets through this table."
lines[#lines+1]="The log now records EMPTY SPECIALIST SLOT SUMMARY so we can verify which case applies."
return table.concat(lines,"\n")
end
for i=first,last do
local slot=slots[i]
local jumpSlot=i-first+1
local candidates={}
for _,a in ipairs(aggregateSessionCached(slot.sessionGUID)) do
if (a.stored or 0)>0 then
local ship=specialistIsShipCandidate(a)
if (slot.isShip and ship) or ((not slot.isShip) and not ship) then candidates[#candidates+1]=a end
end
end
table.sort(candidates,function(a,b)
local av,bv=a.verified and 1 or 0,b.verified and 1 or 0
if av~=bv then return av>bv end
local as,bs=opportunityScore(a),opportunityScore(b)
if as~=bs then return as>bs end
return trimText(a.name)<trimText(b.name)
end)
local host=provinceLabel(slot.sessionGUID).." / "..trimText(slot.areaName).." / "..trimText(slot.buildingType)
if trimText(slot.objectName)~="" then host=host.." "..trimText(slot.objectName) end
local slotRef={sessionGUID=slot.sessionGUID,objectIDRaw=slot.objectIDRaw,objectID=slot.objectID,kind="empty-slot",direct=true}
lines[#lines+1]=tostring(jumpSlot)..". EMPTY SLOT — "..host.." / slot "..tostring(slot.slot)
local emptySuffix=registerPageJump(jumpSlot,slotRef,host.." / slot "..tostring(slot.slot))
if #candidates>0 then
local a=candidates[1]
lines[#lines+1]="Suggested candidate: "..trimText(a.name).." — "..rarityText(a).." • "..categoryLabel(a).." • confidence "..confidenceLabel(a)
lines[#lines+1]="Available: "..tostring(a.stored or 0).." • "..shortRecommendation(a)
local loc=compactStoredLocationText(a,1); if loc~="" then lines[#lines+1]="Stored: "..loc end
else
lines[#lines+1]="No stored candidate of the correct broad ship/building category was found in this province."
end
lines[#lines+1]="Jump: Ctrl+Alt+"..tostring(jumpSlot).." → empty slot host"..emptySuffix
lines[#lines+1]="Note: the in-game picker remains the final compatibility check."
lines[#lines+1]="----------------------------------------"; lines[#lines+1]=""
end
if pageCount>1 then lines[#lines+1]="Use the parchment arrows for the next/previous 9 empty-slot opportunities." end
return table.concat(lines,"\n")
end
local function appendChangeGroup(lines,title,list,detailKey,byGuid,preference,jumpState)
lines[#lines+1]=title.." — "..tostring(#(list or {}))
if #(list or {})==0 then
lines[#lines+1]="None"
else
for i=1,math.min(#list,12) do
local x=list[i]
local extra=""
if detailKey=="delta" then extra=" ×"..tostring(x.delta or 1)
elseif detailKey=="stored" then extra=" • "..tostring(x.stored or 0).." stored"
elseif detailKey=="equipped" then extra=" • "..tostring(x.equipped or 0).." equipped" end
local suffix=""
local a=byGuid and byGuid[x.guid] or nil
if a and jumpState and (jumpState.slot or 0)<9 then
local ref=preferredJumpRef(a,preference or "stored")
if ref then
jumpState.slot=(jumpState.slot or 0)+1
local directRef={sessionGUID=ref.sessionGUID,objectIDRaw=ref.objectIDRaw,objectID=ref.objectID,areaName=ref.areaName,buildingType=ref.buildingType,objectName=ref.objectName,slot=ref.slot,kind=ref.kind,guid=ref.guid,direct=true}
suffix=registerPageJump(jumpState.slot,directRef,trimText(x.name))
end
end
lines[#lines+1]="• "..tostring(x.name)..extra..suffix
end
if #list>12 then lines[#lines+1]="+ "..tostring(#list-12).." more" end
end
lines[#lines+1]=""
end
local function buildChangesReport()
local session=currentSession()
local c=SpecialistFinder.ScanChanges[session]
local lines={"WHAT CHANGED SINCE LAST SCAN",string.upper(provinceLabel(session)),"----------------------------------------",""}
if not c or c.baseline then
lines[#lines+1]="This is the first comparison baseline for this province."
lines[#lines+1]="Run 'Scan Again / What Changed?' later to compare against this snapshot."
return table.concat(lines,"\n")
end
local byGuid={}
for _,a in ipairs(aggregateCurrentProvince()) do byGuid[a.guid]=a end
local jumpState={slot=0}
local explainedEquipped={}
local explainedRemoved={}
lines[#lines+1]="PLACEMENT CHANGES"
local placementCount=#(c.filledSlots or {})+#(c.newEmptySlots or {})+#(c.replacedSlots or {})
if placementCount==0 then
lines[#lines+1]="None"
else
for _,er in ipairs(c.filledSlots or {}) do
local host=tostring(er.areaName).." • "..tostring(er.buildingType).." • slot "..tostring(er.slot)
if er.filledWithGuid then explainedEquipped[er.filledWithGuid]=(explainedEquipped[er.filledWithGuid] or 0)+1 end
local suffix=""
if er.currentRow and (jumpState.slot or 0)<9 then
jumpState.slot=jumpState.slot+1
local row=er.currentRow
local ref={sessionGUID=session,objectIDRaw=row.objectIDRaw,objectID=row.objectID,areaName=row.areaName,buildingType=row.buildingType,objectName=row.objectName,slot=row.slot,kind="placement-host",direct=true}
suffix=registerPageJump(jumpState.slot,ref,trimText(er.filledWithName or "filled slot"))
end
lines[#lines+1]="• "..host
if trimText(er.filledWithName or "")~="" then lines[#lines+1]="  Filled with: "..trimText(er.filledWithName)..suffix else lines[#lines+1]="  Slot filled"..suffix end
end
for _,er in ipairs(c.newEmptySlots or {}) do
local host=tostring(er.areaName).." • "..tostring(er.buildingType).." • slot "..tostring(er.slot)
if er.removedGuid then explainedRemoved[er.removedGuid]=true end
local suffix=""
if (jumpState.slot or 0)<9 then
jumpState.slot=jumpState.slot+1
local ref={sessionGUID=session,objectIDRaw=er.objectIDRaw,objectID=er.objectID,areaName=er.areaName,buildingType=er.buildingType,objectName=er.objectName,slot=er.slot,kind="empty-slot",direct=true}
suffix=registerPageJump(jumpState.slot,ref,host)
end
lines[#lines+1]="• "..host
if trimText(er.removedName or "")~="" then lines[#lines+1]="  Removed: "..trimText(er.removedName).." → slot is now empty"..suffix else lines[#lines+1]="  Specialist removed → slot is now empty"..suffix end
end
for _,er in ipairs(c.replacedSlots or {}) do
local host=tostring(er.areaName).." • "..tostring(er.buildingType).." • slot "..tostring(er.slot)
if er.newGuid then explainedEquipped[er.newGuid]=(explainedEquipped[er.newGuid] or 0)+1 end
if er.oldGuid then explainedRemoved[er.oldGuid]=true end
local suffix=""
if er.currentRow and (jumpState.slot or 0)<9 then
jumpState.slot=jumpState.slot+1
local row=er.currentRow
local ref={sessionGUID=session,objectIDRaw=row.objectIDRaw,objectID=row.objectID,areaName=row.areaName,buildingType=row.buildingType,objectName=row.objectName,slot=row.slot,kind="placement-host",direct=true}
suffix=registerPageJump(jumpState.slot,ref,trimText(er.newName or "replacement"))
end
lines[#lines+1]="• "..host
lines[#lines+1]="  Replaced: "..trimText(er.oldName or "previous specialist").." → "..trimText(er.newName or "new specialist")..suffix
end
end
lines[#lines+1]=""
lines[#lines+1]="INVENTORY CHANGES"
local inventoryLines=0
if #(c.acquired or {})>0 then
lines[#lines+1]="New copies acquired — "..tostring(#c.acquired)
for _,x in ipairs(c.acquired) do lines[#lines+1]="• "..tostring(x.name).." ×"..tostring(x.delta or 1) end
inventoryLines=inventoryLines+1
end
local extraEquipped={}
for _,x in ipairs(c.newlyEquipped or {}) do
local remaining=(x.delta or 1)-(explainedEquipped[x.guid] or 0)
if remaining>0 then extraEquipped[#extraEquipped+1]={guid=x.guid,name=x.name,delta=remaining} end
end
if #extraEquipped>0 then
appendChangeGroup(lines,"OTHER NEW EQUIPPED PLACEMENTS",extraEquipped,"delta",byGuid,"equipped",jumpState)
inventoryLines=inventoryLines+1
end
local unused={}
for _,x in ipairs(c.becameUnused or {}) do if not explainedRemoved[x.guid] then unused[#unused+1]=x end end
if #unused>0 then
appendChangeGroup(lines,"BECAME UNUSED",unused,"stored",byGuid,"stored",jumpState)
inventoryLines=inventoryLines+1
end
if #(c.moved or {})>0 then
appendChangeGroup(lines,"MOVED BETWEEN PLACEMENTS",c.moved,"equipped",byGuid,"equipped",jumpState)
inventoryLines=inventoryLines+1
end
if #(c.lost or {})>0 then
lines[#lines+1]="Copies no longer owned — "..tostring(#c.lost)
for _,x in ipairs(c.lost) do lines[#lines+1]="• "..tostring(x.name).." ×"..tostring(x.delta or 1) end
lines[#lines+1]=""
inventoryLines=inventoryLines+1
end
if inventoryLines==0 then lines[#lines+1]="None"; lines[#lines+1]="" end
local total=#(c.acquired or {})+#(c.newlyEquipped or {})+#(c.becameUnused or {})+#(c.moved or {})+#(c.lost or {})+#(c.newEmptySlots or {})+#(c.filledSlots or {})+#(c.replacedSlots or {})
if total==0 then lines[#lines+1]="No specialist ownership or placement changes were detected." end
if (jumpState.slot or 0)>0 then lines[#lines+1]="Ctrl+Alt+1…"..tostring(jumpState.slot).." opens the corresponding current specialist/location above." end
return table.concat(lines,"\n")
end
local function shipRole(a)
if not specialistIsShipCandidate(a) then return nil end
local e=trimText(a.effects)
if string.find(e,"Military Captain",1,true) or string.find(e,"Ship Scorpion",1,true) or string.find(e,"Attack",1,true) or string.find(e,"Hitpoints",1,true) or string.find(e,"Self-repair",1,true) then return "MILITARY" end
if string.find(e,"Goods Transfer Speed",1,true) or string.find(e,"Province Transfer Speed",1,true) then return "TRADE & LOGISTICS" end
if string.find(e,"Wind",1,true) or string.find(e,"Movement Speed",1,true) or string.find(e,"Discovery Radius",1,true) then return "SAILING & EXPLORATION" end
if specialistIsShipCandidate(a) then return "GENERAL SHIP" end
return nil
end
local function buildShipRecommendations()
local all=aggregateEmpire()
local groups={['TRADE & LOGISTICS']={},['MILITARY']={},['SAILING & EXPLORATION']={},['GENERAL SHIP']={}}
for _,a in ipairs(all) do
local role=shipRole(a)
if role and (a.stored or 0)>0 then groups[role][#groups[role]+1]=a end
end
for _,list in pairs(groups) do
table.sort(list,function(a,b)
local av,bv=a.verified and 1 or 0,b.verified and 1 or 0
if av~=bv then return av>bv end
local ai,bi=effectImpactScore(a),effectImpactScore(b)
if ai~=bi then return ai>bi end
return trimText(a.name)<trimText(b.name)
end)
end
local lines={"SHIP SPECIALIST RECOMMENDATIONS","Across scanned provinces • recommendations by ship role","You choose the ship; the mod highlights which owned captains fit each job.","----------------------------------------",""}
local jumpSlot=0
for _,role in ipairs({'TRADE & LOGISTICS','MILITARY','SAILING & EXPLORATION','GENERAL SHIP'}) do
local list=groups[role]
lines[#lines+1]=role
if #list==0 then lines[#lines+1]="No available verified/known candidates found." else
for i=1,math.min(#list,5) do
local a=list[i]
local shipSuffix=""
local ref=preferredJumpRef(a,"stored")
if ref and jumpSlot<9 then
jumpSlot=jumpSlot+1
shipSuffix=registerPageJump(jumpSlot,ref,trimText(a.name))
end
lines[#lines+1]=tostring(i)..". "..trimText(a.name).." — "..rarityText(a).." • available "..tostring(a.stored or 0).." • confidence "..confidenceLabel(a)..shipSuffix
for _,eff in ipairs(compactEffectLines(a,1,86)) do lines[#lines+1]=eff end
local loc=compactStoredLocationText(a,1); if loc~="" then lines[#lines+1]="Stored: "..loc end
end
end
lines[#lines+1]="----------------------------------------"; lines[#lines+1]=""
end
lines[#lines+1]="Ctrl+Alt+1…9 is assigned in report order to the first nine jumpable stored specialists in the current province."
return table.concat(lines,"\n")
end
local function buildEmpireOverview()
local all=aggregateEmpire()
local sessions={"3245","6627"}
local lines={"SPECIALIST EMPIRE OVERVIEW","Latium + Albion cached specialist picture","----------------------------------------",""}
for _,session in ipairs(sessions) do
local storedRows=SpecialistFinder.StoredCache[session]
local equippedData=SpecialistFinder.Cache[session]
local scanned=SpecialistFinder.ScanReadySessions[session] == true and (storedRows ~= nil or equippedData ~= nil)
if not scanned then
lines[#lines+1]=string.upper(provinceLabel(session))..": NOT SCANNED"
lines[#lines+1]="Switch to this province and press Ctrl+Alt+I once to add it."
else
local province=aggregateSessionCached(session)
local stored,equipped,total=reportStats(province)
lines[#lines+1]=string.upper(provinceLabel(session))..": "..tostring(#province).." TYPES • "..tostring(stored).." AVAILABLE • "..tostring(equipped).." EQUIPPED"
end
lines[#lines+1]=""
end
local stored,equipped,total=reportStats(all)
local globallyUnused=0; local globallySpare=0; local fullyDeployed=0
for _,a in ipairs(all) do
if (a.stored or 0)>0 and (a.equipped or 0)==0 then globallyUnused=globallyUnused+1 end
if (a.stored or 0)>0 and (a.equipped or 0)>0 then globallySpare=globallySpare+1 end
if (a.stored or 0)==0 and (a.equipped or 0)>0 then fullyDeployed=fullyDeployed+1 end
end
lines[#lines+1]="COMBINED CACHED EMPIRE"
lines[#lines+1]=tostring(#all).." specialist types • "..tostring(stored).." available copies • "..tostring(equipped).." equipped placements"
lines[#lines+1]=tostring(globallyUnused).." types completely unused across scanned provinces"
lines[#lines+1]=tostring(globallySpare).." types with spare copies"
lines[#lines+1]=tostring(fullyDeployed).." types fully deployed"
lines[#lines+1]=""
lines[#lines+1]="Province cache status: Latium and Albion are retained independently while this game/mod session remains loaded."
return table.concat(lines,"\n")
end

local function buildBestFocusedReport(all,mode)
local list={}
local title,subtitle,why=""
if mode=="best_use_now" then
title="BEST OPPORTUNITIES — USE NOW"
subtitle="Unused specialists with verified effects that look most useful to deploy next."
why="Why these are here: you own them, they are not equipped anywhere, and we know enough about their effects to make a recommendation."
for _,a in ipairs(all) do
if a.stored>0 and a.equipped==0 and a.verified then list[#list+1]=a end
end
elseif mode=="best_spares" then
title="BEST OPPORTUNITIES — USE SPARE COPIES"
subtitle="Useful specialists already equipped somewhere, but with additional copies still available."
why="Why these are here: at least one copy is already in use, but you still own an unused copy that may be useful elsewhere."
for _,a in ipairs(all) do
if a.stored>0 and a.equipped>0 then list[#list+1]=a end
end
elseif mode=="best_strong_unused" then
title="BEST OPPORTUNITIES — STRONG SPECIALISTS NOT USED"
subtitle="Your highest-ranked specialists that are completely unused."
why="Why these are here: none of your copies are equipped. Verified effects rank first; other promising specialists follow."
for _,a in ipairs(all) do
if a.stored>0 and a.equipped==0 then list[#list+1]=a end
end
elseif mode=="best_needs_review" then
title="BEST OPPORTUNITIES — NEEDS REVIEW"
subtitle="Unused specialists that may be valuable, but whose effects are not yet verified well enough."
why="Why these are here: they are available to use, but the mod does not yet know enough to recommend a deployment confidently."
for _,a in ipairs(all) do
if a.stored>0 and not a.verified then list[#list+1]=a end
end
end
table.sort(list,function(a,b)
local av,bv=a.verified and 1 or 0,b.verified and 1 or 0
if av~=bv then return av>bv end
local as,bs=opportunityScore(a),opportunityScore(b)
if as~=bs then return as>bs end
return trimText(a.name)<trimText(b.name)
end)
local lines={}
lines[#lines+1]=title
lines[#lines+1]=string.upper(provinceLabel(currentSession())).." • "..tostring(#list).." MATCH"..(#list==1 and "" or "ES")
lines[#lines+1]=subtitle
lines[#lines+1]=""
lines[#lines+1]=why
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
if #list==0 then
lines[#lines+1]="No specialists currently match this category."
return table.concat(lines,"\n")
end
local limit=math.min(#list,9)
for i=1,limit do appendActionFirstCard(lines,i,list[i],i,"stored") end
if #list>limit then
lines[#lines+1]="Showing the first 9 of "..tostring(#list).."."
lines[#lines+1]="Use All Best Opportunities for the combined ranked overview."
end
return table.concat(lines,"\n")
end

local function buildReport(marker)
resetPageJumpTargets(marker)
local mode=markerMode(marker)
local page=markerPage(marker)
if mode=="empty_slots" then return buildEmptySlotReport(page) end
if mode=="changes" then return buildChangesReport() end
if mode=="ships" then return buildShipRecommendations() end
if mode=="empire" then return buildEmpireOverview() end
local all=aggregateCurrentProvince()
if mode=="best_use_now" or mode=="best_spares" or mode=="best_strong_unused" or mode=="best_needs_review" then
return buildBestFocusedReport(all,mode)
end
if mode=="improve" then return buildImproveExistingReport(all) end
if mode=="purpose" then return buildPurposeReport(all,page) end
local list={}
for _,a in ipairs(all) do
if (mode=="unused" and a.stored>0)
or (mode=="equipped" and a.equipped>0)
or (mode=="all" and a.total>0) then
list[#list+1]=a
end
end
if mode=="best" then
local opportunities={}
for _,a in ipairs(all) do if a.stored>0 then opportunities[#opportunities+1]=a end end
table.sort(opportunities,function(a,b)
local at,bt=opportunityTier(a),opportunityTier(b)
if at~=bt then return at<bt end
local sa,sb=opportunityScore(a),opportunityScore(b)
if sa~=sb then return sa>sb end
return trimText(a.name)<trimText(b.name)
end)
local completelyUnused,verifiedUnused=0,0
for _,a in ipairs(opportunities) do
if a.equipped==0 then
completelyUnused=completelyUnused+1
if a.verified then verifiedUnused=verifiedUnused+1 end
end
end
local clearCount=0
for _,r in ipairs(buildUpgradeReviews(all)) do
if r.comparison.classification=="CLEAR SHARED-EFFECT UPGRADE" then clearCount=clearCount+1 end
end
local pageCount=3
page=math.max(1,math.min(pageCount,page))
local first=(page-1)*5+1
local last=math.min(#opportunities,page*5)
local extra=tostring(completelyUnused).." completely unused • "..tostring(verifiedUnused).." verified unused • "..tostring(clearCount).." clear upgrades"
local lines={reportHeader("BEST OPPORTUNITIES",opportunities,page,pageCount,extra)}
if first>#opportunities then
lines[#lines+1]="No more available specialists on this page."
return table.concat(lines,"\n")
end
lines[#lines+1]="Ranked by what looks most worth acting on now: unused verified specialists first, then spare copies, then specialists that need review."
lines[#lines+1]=""
for i=first,last do appendActionFirstCard(lines,i,opportunities[i],i-first+1,"stored") end
if page==pageCount and #opportunities>15 then
lines[#lines+1]="Best Opportunities shows the top 15. Use Unused Specialists for every available type."
end
return table.concat(lines,"\n")
end
if mode=="unused" then
sortUnusedList(list)
local pageCount=6
page=math.max(1,math.min(pageCount,page))
local first,last=pageRange(#list,pageCount,page)
local completelyUnused=0
for _,a in ipairs(list) do if a.equipped==0 then completelyUnused=completelyUnused+1 end end
local lines={reportHeader("UNUSED SPECIALISTS",list,page,pageCount,tostring(completelyUnused).." completely unused • spare copies follow")}
if first>last then
lines[#lines+1]="No specialists on this page."
return table.concat(lines,"\n")
end
lines[#lines+1]="ENTRIES "..tostring(first).."–"..tostring(last).." OF "..tostring(#list)
lines[#lines+1]=""
for i=first,last do appendActionFirstCard(lines,i,list[i],i-first+1,"stored") end
return table.concat(lines,"\n")
end
if mode=="all" then
sortAlphabetical(list)
local pageCount=6
page=math.max(1,math.min(pageCount,page))
local first,last=pageRange(#list,pageCount,page)
local lines={reportHeader("ALL SPECIALISTS — A–Z",list,page,pageCount,"Alphabetical ownership and location index")}
if first>last then
lines[#lines+1]="No specialists on this page."
return table.concat(lines,"\n")
end
lines[#lines+1]="ENTRIES "..tostring(first).."–"..tostring(last).." OF "..tostring(#list)
lines[#lines+1]=""
for i=first,last do
local a=list[i]
local jumpSlot=i-first+1
local allSuffix=registerPageJump(jumpSlot,preferredJumpRef(a,"stored"),trimText(a.name))
lines[#lines+1]=tostring(i)..". "..string.upper(trimText(a.name)).." — "..rarityText(a)..allSuffix
lines[#lines+1]="OWNED "..tostring(a.total).." • AVAILABLE "..tostring(a.stored).." • EQUIPPED "..tostring(a.equipped).." • "..string.upper(bestUseText(a))
for _,effectLine in ipairs(compactEffectLines(a,1,84)) do lines[#lines+1]=effectLine end
local stored=compactStoredLocationText(a,2)
local equipped=compactEquippedLocationText(a,2)
if stored~="" then lines[#lines+1]="STORED: "..stored end
if equipped~="" then lines[#lines+1]="EQUIPPED: "..equipped end
lines[#lines+1]="----------------------------------------"
lines[#lines+1]=""
end
return table.concat(lines,"\n")
end
if mode=="equipped" then
table.sort(list,function(a,b)
if a.equipped~=b.equipped then return a.equipped>b.equipped end
return trimText(a.name)<trimText(b.name)
end)
local lines={reportHeader("EQUIPPED SPECIALISTS",list,1,1,"Exact current placements")}
for i,a in ipairs(list) do
local equippedSuffix=registerPageJump(i,preferredJumpRef(a,"equipped"),trimText(a.name))
lines[#lines+1]=tostring(i)..". "..trimText(a.name).." — "..rarityText(a).." • "..tostring(a.equipped).." equipped"..equippedSuffix
local equipped=compactEquippedLocationText(a,3)
if equipped~="" then lines[#lines+1]=equipped end
lines[#lines+1]=""
end
return table.concat(lines,"\n")
end
return "SPECIALIST FINDER\n\nNo report is available for this selection."
end
local AUTO_RESUME_STORYLINES = {
best = 2008628301,
unused = 2008628304,
improve = 2008628307,
purpose = 2008628310,
all = 2008628313,
changes = 2008628480
}
local function hasValidCurrentScan(self)
local session=tostring(currentSession() or "")
local stored=self.StoredCache[session]
return self.ScanReadySessions[session] == true
and self.Cache[session] ~= nil
and stored ~= nil
end
function SpecialistFinder:StartAutoScanForReport(marker, content)
if self.AutoScanResumeInProgress then
log("AUTO-SCAN ON DEMAND duplicate trigger ignored | pendingMarker="..tostring(self.AutoScanResumeMarker))
return true
end
local mode=markerMode(marker)
if not AUTO_RESUME_STORYLINES[mode] then
log("AUTO-SCAN ON DEMAND cannot resume unsupported report | marker="..tostring(marker).." | mode="..tostring(mode))
return false
end
self.AutoScanResumeMarker=marker
self.AutoScanResumeMode=mode
self.AutoScanResumeTicks=0
self.AutoScanResumeInProgress=true
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=true
self.ReportMenuReopenedForCycle=true
self.MenuSessionActive=false
self.MenuWasVisible=false
self.ReportPopupSeenForCycle=false
local message
if mode=="changes" then
message="WHAT CHANGED SINCE LAST SCAN\n\nScanning the current province again...\n\nThis paper will close automatically while the scan runs.\nThe change report will reopen when the comparison is complete."
else
message="SPECIALIST FINDER\n\nNo current specialist scan was found.\n\nStarting specialist scan automatically...\n\nThis paper will close automatically so the warehouse scan can run.\nThe requested report will reopen when the scan is complete."
end
local writeOk,writeErr=pcall(function() if content then content.Text=message end end)
self.AutoScanCloseBeforeStartTicks=2
self.AutoScanStartAfterCloseTicks=nil
log("AUTO-SCAN ON DEMAND START"
.." | marker="..tostring(marker)
.." | mode="..tostring(mode)
.." | session="..tostring(currentSession())
.." | messageWrite="..tostring(writeOk)
.." | closePaperBeforeScan=true"
.." | scanStartDeferred=true"
.." | error="..tostring(writeErr or ""))
return true
end
function SpecialistFinder:ResumeAutoScannedReport()
local marker=self.AutoScanResumeMarker
local mode=self.AutoScanResumeMode
local storyline=AUTO_RESUME_STORYLINES[mode]
if not marker or not storyline then
log("AUTO-SCAN REPORT RESUME FAILED | reason=no pending report")
self.AutoScanResumeInProgress=false
self.AutoScanResumeMarker=nil
self.AutoScanResumeMode=nil
return false
end
self.PopupWatchTicks=1200
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=false
self.PopupWasVisible=false
self.ReportMenuReopenedForCycle=false
self.NarrativeSeenSinceLastReportSelection=false
self.MenuSessionActive=false
local ok,err=pcall(function() GovernorDecision:CheatStartGovernorDecisionForCurrentPlayerNet(storyline) end)
if ok then self.GovernorPrimaryPending=2 end
log("AUTO-SCAN REPORT RESUME REQUEST"
.." | success="..tostring(ok)
.." | requestedMarker="..tostring(marker)
.." | mode="..tostring(mode)
.." | storyline="..tostring(storyline)
.." | directOpenAfterTicks="..tostring(ok and 2 or 0)
.." | error="..tostring(err or ""))
self.AutoScanResumeInProgress=false
self.AutoScanResumeMarker=nil
self.AutoScanResumeMode=nil
return ok
end
function SpecialistFinder:ForceRescan()
if self.WarehouseProbe and self.WarehouseProbe.active then
log("FORCE RESCAN shortcut ignored | integrated scan already active")
return true
end
local session=tostring(currentSession() or "")
self.ScanReadySession=nil
self.ScanReadySessions[session]=nil
self.StoredCache[session]=nil
self.AutoScanResumeMarker=nil
self.AutoScanResumeMode=nil
self.AutoScanResumeTicks=0
self.AutoScanResumeInProgress=false
self.AutoScanCloseBeforeStartTicks=nil
self.AutoScanStartAfterCloseTicks=nil
self.StoredRows={}
self.Cache[session]=nil
log("FORCE RESCAN REQUEST | shortcut=Ctrl+Alt+R | session="..tostring(session).." | cachedScanCleared=true")
return self:RunGeneral()
end
function SpecialistFinder:Open()
if self.WarehouseProbe and self.WarehouseProbe.active then
log("shortcut ignored | integrated scan already active")
return true
end
local session = tostring(currentSession() or "")
if hasValidCurrentScan(self) then
self.StoredRows=self.StoredCache[session] or {}
self.ScanReadySession=session
log("CACHED SCAN REUSED | session=" .. tostring(session)
.. " | province="..tostring(provinceLabel(session))
.. " | storedRows=" .. tostring(#self.StoredRows)
.. " | equippedRows=" .. tostring(#(self.Cache[session].rows or {}))
.. " | warehouseRescan=false")
self:OpenFilterMenu(false)
return true
end
return self:RunGeneral()
end
function SpecialistFinder:DismissLatestGovernorRequestSecondary(label)
local gr=ui and ui.Scenes and ui.Scenes.GovernorRequests or nil
local content=gr and read(gr,"SceneData") or nil
local arr=content and read(content,"Notification") or nil
local chosen=nil
local chosenIndex=-1
if arr~=nil then
for i=0,7 do
local n=nil
pcall(function() n=arr[i] end)
if n~=nil then
local idx=read(n,"Index")
if type(idx)~="number" then idx=i end
if idx>=chosenIndex then chosen=n chosenIndex=idx end
end
end
end
local button=chosen and read(chosen,"ButtonData") or nil
local states=button and read(button,"States") or nil
local secondary=states and read(states,"EventSecondary") or nil
local sok,sres=false,"not available"
if type(secondary)=="function" then
sok,sres=pcall(function() return secondary(states) end)
end
log("DIRECT RETURN REQUEST SECONDARY"
.." | phase="..tostring(label)
.." | notificationPresent="..tostring(chosen~=nil)
.." | notificationIndex="..tostring(chosenIndex)
.." | statesPresent="..tostring(states~=nil)
.." | eventSecondaryAvailable="..tostring(type(secondary)=="function")
.." | eventSecondarySuccess="..tostring(sok)
.." | result="..tostring(sres or ""))
return sok,sres,chosen~=nil,type(secondary)=="function"
end
function SpecialistFinder:TriggerLatestGovernorRequestPrimary(label)
local gr=ui and ui.Scenes and ui.Scenes.GovernorRequests or nil
local content=gr and read(gr,"SceneData") or nil
local arr=content and read(content,"Notification") or nil
local chosen=nil
local chosenIndex=-1
if arr~=nil then
for i=0,7 do
local n=nil
pcall(function() n=arr[i] end)
if n~=nil then
local idx=read(n,"Index")
if type(idx)~="number" then idx=i end
if idx>=chosenIndex then chosen=n chosenIndex=idx end
end
end
end
local button=chosen and read(chosen,"ButtonData") or nil
local states=button and read(button,"States") or nil
local focus=states and read(states,"RequestFocus") or nil
local primary=states and read(states,"EventPrimary") or nil
local fok=false
if type(focus)=="function" then fok=pcall(function() return focus(states) end) end
local pok,pres=false,"not available"
if type(primary)=="function" then pok,pres=pcall(function() return primary(states) end) end
log("DIRECT RETURN REQUEST PRIMARY"
.." | phase="..tostring(label)
.." | notificationPresent="..tostring(chosen~=nil)
.." | notificationIndex="..tostring(chosenIndex)
.." | statesPresent="..tostring(states~=nil)
.." | requestFocusSuccess="..tostring(fok)
.." | eventPrimarySuccess="..tostring(pok)
.." | result="..tostring(pres or ""))
return pok,pres
end
function SpecialistFinder:TriggerGovernorRequestPrimary()
local gr=ui and ui.Scenes and ui.Scenes.GovernorRequests or nil
local content=gr and read(gr,"SceneData") or nil
local arr=content and read(content,"Notification") or nil
local note=nil
if arr~=nil then
pcall(function() note=arr[0] end)
if note==nil then pcall(function() note=arr[1] end) end
end
local button=note and read(note,"ButtonData") or nil
local states=button and read(button,"States") or nil
local requestFocus=states and read(states,"RequestFocus") or nil
local eventPrimary=states and read(states,"EventPrimary") or nil

local focusOk,focusRes=false,"not available"
if type(requestFocus)=="function" then
focusOk,focusRes=pcall(function() return requestFocus(states) end)
end

local primaryOk,primaryRes=false,"not available"
if type(eventPrimary)=="function" then
primaryOk,primaryRes=pcall(function() return eventPrimary(states) end)
end

log("DIRECT MENU OPEN"
.." | notificationPresent="..tostring(note~=nil)
.." | statesPresent="..tostring(states~=nil)
.." | requestFocusAvailable="..tostring(type(requestFocus)=="function")
.." | requestFocusSuccess="..tostring(focusOk)
.." | requestFocusResult="..tostring(focusRes or "")
.." | eventPrimaryAvailable="..tostring(type(eventPrimary)=="function")
.." | eventPrimarySuccess="..tostring(primaryOk)
.." | eventPrimaryResult="..tostring(primaryRes or ""))
return primaryOk,primaryRes
end
function SpecialistFinder:OpenFilterMenu(isReturn)
self.PopupWatchTicks=1200
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=false
self.MenuSessionActive=true
self.MenuWasVisible=false
self.ReportPopupSeenForCycle=false
self.ReportMenuReopenedForCycle=false
self.NarrativeSeenSinceLastReportSelection=false
self.PopupWasVisible=false
self.MenuReturnPendingTicks=0
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
self.CloseDetectionTicks=0
self.RescanPending=false
self.RescanMarkerHandled=false
local ok,err=pcall(function() GovernorDecision:CheatStartGovernorDecisionForCurrentPlayerNet(FILTER_STORYLINE_GUID) end)
if ok then self.GovernorPrimaryPending=2 end
log((isReturn and "FILTER MENU RETURN" or "FILTER MENU REQUEST")
.. " | success="..tostring(ok)
.. " | storyline="..tostring(FILTER_STORYLINE_GUID)
.. " | cachedScan=true"
.. " | menuArchitecture=fresh-guid-clean-room"
.. " | error="..tostring(err or ""))
end
function SpecialistFinder:PopupTick()
if self.GovernorPrimaryPending and self.GovernorPrimaryPending>0 then
self.GovernorPrimaryPending=self.GovernorPrimaryPending-1
if self.GovernorPrimaryPending==0 then
self.GovernorPrimaryPending=nil
self:TriggerGovernorRequestPrimary()
end
end
if self.ReturnRequestProbeTicks and self.ReturnRequestProbeTicks>0 and not self.ReturnRequestArmed then
local remaining=self.ReturnRequestProbeTicks
local attempt=121-remaining
if self.PendingReportJump then
local ok,res,present,available=self:DismissLatestGovernorRequestSecondary("JUMP_DISMISS_RETRY_"..tostring(attempt))
if ok then
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
self.PendingJumpReady=true
log("DEDICATED RETURN REQUEST DISMISSED FOR JUMP | success=true | attempt="..tostring(attempt).." | noNarrativeSequenceExpected=true | helperMandatory=false")
else
self.ReturnRequestProbeTicks=remaining-1
if present and not available then
-- Diagnostic fallback: do NOT PopUI. Activate helper normally; once its NarrativeSequence
-- naturally returns control to Lua, execute the jump with zero PopUI calls.
local pok,pres=self:TriggerLatestGovernorRequestPrimary("JUMP_FALLBACK_PRIMARY_"..tostring(attempt))
if pok then
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=true
self.PendingJumpReady=true
log("DEDICATED RETURN REQUEST JUMP FALLBACK ARMED | success=true | eventSecondaryUnavailable=true | noPostReturnPopUI=true")
end
elseif self.ReturnRequestProbeTicks==0 then
log("DEDICATED RETURN REQUEST JUMP DISMISS WINDOW ENDED | success=false | storyline="..tostring(self.ActiveReturnStorylineGUID))
end
end
else
local ok,res=self:TriggerLatestGovernorRequestPrimary("REPORT_OPEN_RETRY_"..tostring(attempt))
if ok then
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=true
log("DEDICATED RETURN REQUEST ARMED | success=true | reportStillOpen=true | attempt="..tostring(attempt))
else
self.ReturnRequestProbeTicks=remaining-1
if self.ReturnRequestProbeTicks==0 then
log("DEDICATED RETURN REQUEST PROBE WINDOW ENDED | success=false | reportStillOpen=true | storyline="..tostring(self.ActiveReturnStorylineGUID).." | helperStillSingle=true")
end
end
end
end
if self.MenuPendingTicks and self.MenuPendingTicks>0 then
self.MenuPendingTicks=self.MenuPendingTicks-1
if self.MenuPendingTicks==0 then self:OpenFilterMenu(false) end
end
if self.AutoScanCloseBeforeStartTicks and self.AutoScanCloseBeforeStartTicks>0 then
self.AutoScanCloseBeforeStartTicks=self.AutoScanCloseBeforeStartTicks-1
if self.AutoScanCloseBeforeStartTicks==0 then
local closeOk,closeErr=pcall(function() Scripts:PopUI() end)
self.AutoScanCloseBeforeStartTicks=nil
self.AutoScanStartAfterCloseTicks=3
log("AUTO-SCAN PAPER CLOSE BEFORE SCAN | success="..tostring(closeOk)
.." | startScanAfterTicks=3"
.." | error="..tostring(closeErr or ""))
end
end
if self.AutoScanStartAfterCloseTicks and self.AutoScanStartAfterCloseTicks>0 then
self.AutoScanStartAfterCloseTicks=self.AutoScanStartAfterCloseTicks-1
if self.AutoScanStartAfterCloseTicks==0 then
self.AutoScanStartAfterCloseTicks=nil
log("AUTO-SCAN PAPER CLOSED; STARTING WAREHOUSE SCAN | pendingMarker="..tostring(self.AutoScanResumeMarker)
.." | mode="..tostring(self.AutoScanResumeMode))
self:RunGeneral()
return
end
end
if self.AutoScanResumeTicks and self.AutoScanResumeTicks>0 then
self.AutoScanResumeTicks=self.AutoScanResumeTicks-1
if self.AutoScanResumeTicks==0 then
self:ResumeAutoScannedReport()
end
end
local narrativeScene=ui and ui.Scenes and ui.Scenes.NarrativeSequence or nil
local narrativeData=narrativeScene and read(narrativeScene,"SceneData") or nil
local narrativeActive=narrativeData~=nil
local scene=ui and ui.Scenes and ui.Scenes.TextPopup or nil
local sd=scene and read(scene,"SceneData") or nil
local content=sd and read(sd,"Content") or nil
local popupActive=content~=nil
local narrativeJustClosed = self.NarrativeWasActive == true and not narrativeActive
self.NarrativeWasActive = narrativeActive
if narrativeJustClosed then
self.NarrativeSeenSinceLastReportSelection=true
self.CloseDetectionTicks=0
log("GOVERNOR MENU SELECTION COMMITTED | reportCycleArmed=true | duplicatePageReopenProtection=true")
end
if narrativeActive then
self.MenuWasVisible=true
self.CloseDetectionTicks=0
end
if popupActive then
self.PopupWasVisible=true
self.ReportPopupSeenForCycle=true
self.CloseDetectionTicks=0
local text=read(content,"Text")
if type(text)=="string" then
local probePage = string.match(text, "NATIVE MULTI%-BUTTON PROBE — PAGE (%d) OF 6")
if probePage then
if self.NativeProbeLastPage ~= probePage then
self.NativeProbeLastPage = probePage
local fields = {"CurrentPage","Page","PageIndex","SelectedPage","FocusedPage","PageCount","Pages","Buttons","Actions","CanGoBack","CanGoForward"}
local values = {}
for _,field in ipairs(fields) do
local value = read(sd, field)
if value == nil then value = read(content, field) end
values[#values+1] = field .. "=" .. tostring(value)
end
log("NATIVE MULTI BUTTON PROBE PAGE CHANGE | page="..tostring(probePage).." | totalPages=6 | "..table.concat(values," | "))
end
elseif self.NativeProbeLastPage then
self.NativeProbeLastPage=nil
end
if FILTER_MARKERS[text] and (self.PendingMarker~=text or self.WriteDone or self.NarrativeSeenSinceLastReportSelection) then
local fromMenu=self.NarrativeSeenSinceLastReportSelection==true
local previousMarker=self.PendingMarker
local currentMode=markerMode(text)
local previousMode=previousMarker and markerMode(previousMarker) or nil
local currentPage=markerPage(text)
local previousPage=previousMarker and markerPage(previousMarker) or nil

-- v0.4.10: native parchment paging is NOT a new report cycle.
-- P1 -> P2 -> P3 of the same report must keep the one existing return helper.
local isPagination=false
if self.PopupWasVisible
and not self.ReturnRequestArmed
and previousMarker~=nil
and previousMode==currentMode
and currentMode~="rescan"
and currentPage~=nil
and previousPage~=nil
and currentPage~=previousPage then
isPagination=true
end

if not isPagination then
-- New report selection: allow exactly one new return helper.
self.ReportMenuReopenedForCycle=false
else
-- Same report, different native page: preserve exactly one existing helper.
-- If it has not armed yet, keep checking that SAME helper for another window.
if self.ReportMenuReopenedForCycle and not self.ReturnRequestArmed then
if (self.ReturnRequestProbeTicks or 0) < 120 then self.ReturnRequestProbeTicks=120 end
end
log("REPORT PAGE CHANGE | previousMarker="..tostring(previousMarker)
.." | marker="..tostring(text)
.." | mode="..tostring(currentMode)
.." | previousPage="..tostring(previousPage)
.." | page="..tostring(currentPage)
.." | returnRequestGuardPreserved="..tostring(self.ReportMenuReopenedForCycle)
.." | returnRequestArmed="..tostring(self.ReturnRequestArmed)
.." | probeTicksRemaining="..tostring(self.ReturnRequestProbeTicks or 0)
.." | newReturnHelper=false")
end

if fromMenu then
self.NarrativeSeenSinceLastReportSelection=false
end
log("REPORT CYCLE RESET | marker="..tostring(text)
.." | fromMenuLegacyFlag="..tostring(fromMenu)
.." | pagination="..tostring(isPagination)
.." | previousReturnAlreadyArmed="..tostring(self.ReturnRequestArmed)
.." | returnRequestGuardCleared="..tostring(not isPagination))
local selectedMode=markerMode(text)
if selectedMode=="changes" then
if self.ChangesReportReadySession==currentSession() then
self.ChangesReportReadySession=nil
log("CHANGES REPORT RESUME READY | session="..tostring(currentSession()).." | newScanComplete=true")
else
self:StartAutoScanForReport(text,content)
return
end
end
if selectedMode ~= "rescan" and not hasValidCurrentScan(self) then
self:StartAutoScanForReport(text, content)
return
end
if markerMode(text) == "rescan" then
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=true
if not self.RescanMarkerHandled then
self.RescanMarkerHandled=true
self.BackgroundScanPaper=true
self.AutoCloseScanPaperTicks=nil
local message = "SPECIALIST SCAN IN PROGRESS\n\nPlease wait while Specialist Finder scans the current province.\n\nThe paper will show SCAN COMPLETE and then close automatically."
local writeOk,writeErr=pcall(function() content.Text=message end)
local session=currentSession()
self.ScanReadySession=nil
self.StoredRows={}
self.Cache[session]=nil
self.MenuSessionActive=false
self.MenuWasVisible=false
self.ReportPopupSeenForCycle=false
self.PopupWatchTicks=0
log("NEW SCAN STARTING IMMEDIATELY | currentSession="..tostring(session)
.." | cachedScanCleared=true | oneShotGuard=true"
.." | messageWrite="..tostring(writeOk)
.." | error="..tostring(writeErr or ""))
self:RunGeneral()
end
return
end
self.PendingMarker=text
self.MarkerSeenTick=self.PopupWatchTicks
self.WriteDone=false
local loadingTitle=markerMode(text)=="improve" and "IMPROVE EQUIPPED SPECIALISTS" or "SPECIALIST FINDER"
pcall(function() content.Text=loadingTitle.."\n\nPreparing report..." end)
log("FRESH MENU MARKER DETECTED | marker="..text.." | mode="..markerMode(text).." | waitingTicks=1 | uiTree=2008628201 | fromMenu="..tostring(fromMenu))
-- v0.5.13: write immediately in the SAME marker-detection tick.
-- Keep the proven v0.5.10 control-flow structure unchanged.
do
local immediateMarker=self.PendingMarker
local bok,report=pcall(buildReport,immediateMarker)
if not bok then
log("REPORT BUILD FAILED | marker="..tostring(immediateMarker).." | mode="..markerMode(immediateMarker).." | error="..tostring(report))
report="SPECIALIST FINDER\n\nReport could not be rendered.\n\nPlease close this parchment and try again."
end
local ok,err=pcall(function() content.Text=report end)
self.WriteDone=true
log("REAL REPORT WRITE IMMEDIATE | marker="..tostring(immediateMarker).." | mode="..markerMode(immediateMarker)
.." | elapsedTicks=0"
.." | buildSuccess="..tostring(bok)
.." | success="..tostring(ok)
.." | chars="..tostring(type(report)=="string" and #report or 0)
.." | error="..tostring(err or ""))
if selectedMode=="empty_slots" or selectedMode=="changes" then
self.ReportMenuReopenedForCycle=true
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
if selectedMode=="empty_slots" then
log("EMPTY SLOT REPORT DIRECT MODE | noReturnHelper=true | reason=numbered entries jump directly to host; Ctrl+Alt+I reopens cached menu")
else
log("CHANGES REPORT DIRECT MODE | noReturnHelper=true | reason=all What Changed jumps use direct current-location navigation; warehouse targets still use native search/highlight after arrival; no hidden NarrativeSequence; Ctrl+Alt+I reopens cached menu")
end
elseif not self.ReportMenuReopenedForCycle then
self.ReturnStorylineIndex=((self.ReturnStorylineIndex or 0)%#RETURN_STORYLINE_GUIDS)+1
local returnGuid=RETURN_STORYLINE_GUIDS[self.ReturnStorylineIndex]
self.ActiveReturnStorylineGUID=returnGuid
self.ReturnRequestArmed=false
local menuOk,menuErr=pcall(function()
GovernorDecision:CheatStartGovernorDecisionForCurrentPlayerNet(returnGuid)
end)
self.ReportMenuReopenedForCycle=true
self.MenuSessionActive=true
self.MenuWasVisible=true
self.ReportPopupSeenForCycle=true
if menuOk then self.ReturnRequestProbeTicks=120 end
log("DEDICATED RETURN REQUEST CREATED BEHIND REPORT | success="..tostring(menuOk)
.." | storyline="..tostring(returnGuid)
.." | rotationIndex="..tostring(self.ReturnStorylineIndex)
.." | poolSize="..tostring(#RETURN_STORYLINE_GUIDS)
.." | freshPool=true"
.." | helperTimeoutMs=1000"
.." | probeTicks=120"
.." | oncePerReportCycle=true"
.." | immediateWrite=true"
.." | error="..tostring(menuErr or ""))
end
end

elseif self.PendingMarker and not self.WriteDone then
local elapsed=self.MarkerSeenTick-self.PopupWatchTicks
if elapsed>=1 then
local bok,report=pcall(buildReport,self.PendingMarker)
if not bok then
log("REPORT BUILD FAILED | marker="..tostring(self.PendingMarker).." | mode="..markerMode(self.PendingMarker).." | error="..tostring(report))
report="SPECIALIST FINDER\n\nReport could not be rendered.\n\nPlease close this parchment and try again."
end
local ok,err=pcall(function() content.Text=report end)
self.WriteDone=true
log("REAL REPORT WRITE | marker="..tostring(self.PendingMarker).." | mode="..markerMode(self.PendingMarker)
.." | elapsedTicks="..tostring(elapsed)
.." | buildSuccess="..tostring(bok)
.." | success="..tostring(ok)
.." | chars="..tostring(type(report)=="string" and #report or 0)
.." | error="..tostring(err or ""))
if not self.ReportMenuReopenedForCycle then
self.ReturnStorylineIndex=((self.ReturnStorylineIndex or 0)%#RETURN_STORYLINE_GUIDS)+1
local returnGuid=RETURN_STORYLINE_GUIDS[self.ReturnStorylineIndex]
self.ActiveReturnStorylineGUID=returnGuid
self.ReturnRequestArmed=false
local menuOk,menuErr=pcall(function()
GovernorDecision:CheatStartGovernorDecisionForCurrentPlayerNet(returnGuid)
end)
self.ReportMenuReopenedForCycle=true
self.MenuSessionActive=true
self.MenuWasVisible=true
self.ReportPopupSeenForCycle=true
if menuOk then self.ReturnRequestProbeTicks=120 end
log("DEDICATED RETURN REQUEST CREATED BEHIND REPORT | success="..tostring(menuOk)
.." | storyline="..tostring(returnGuid)
.." | rotationIndex="..tostring(self.ReturnStorylineIndex)
.." | poolSize="..tostring(#RETURN_STORYLINE_GUIDS)
.." | freshPool=true"
.." | helperTimeoutMs=1000"
.." | probeTicks=120"
.." | oncePerReportCycle=true"
.." | error="..tostring(menuErr or ""))
end
end
end
end
elseif self.PopupWasVisible then
self.PopupWasVisible=false
self.PendingMarker=nil
self.MarkerSeenTick=nil
self.WriteDone=false
self.ReportMenuReopenedForCycle=false
self.ReturnRequestProbeTicks=0
self.ReturnRequestArmed=false
end
if self.AutoCloseScanPaperTicks and self.AutoCloseScanPaperTicks>0 then
self.AutoCloseScanPaperTicks=self.AutoCloseScanPaperTicks-1
if self.AutoCloseScanPaperTicks==0 then
self.AutoClosePopAttempts=(self.AutoClosePopAttempts or 0)+1
local closeOk,closeErr=pcall(function() Scripts:PopUI() end)
log("BACKGROUND SCAN PAPER AUTO-CLOSE ATTEMPT | attempt="..tostring(self.AutoClosePopAttempts)
.." | success="..tostring(closeOk)
.." | error="..tostring(closeErr or ""))
self.AutoCloseVerifyTicks=2
end
end
if self.AutoCloseVerifyTicks and self.AutoCloseVerifyTicks>0 then
self.AutoCloseVerifyTicks=self.AutoCloseVerifyTicks-1
if self.AutoCloseVerifyTicks==0 then
if popupActive and (self.AutoClosePopAttempts or 0)<2 then
self.AutoClosePopAttempts=(self.AutoClosePopAttempts or 0)+1
local closeOk,closeErr=pcall(function() Scripts:PopUI() end)
log("BACKGROUND SCAN PAPER AUTO-CLOSE RETRY | attempt="..tostring(self.AutoClosePopAttempts)
.." | popupStillOpen=true | success="..tostring(closeOk)
.." | error="..tostring(closeErr or ""))
self.AutoCloseVerifyTicks=2
else
log("BACKGROUND SCAN PAPER CLOSE SEQUENCE COMPLETE | attempts="..tostring(self.AutoClosePopAttempts or 0)
.." | sceneDataMayRemainReadable="..tostring(popupActive))
self.AutoCloseScanPaperTicks=nil
self.AutoCloseVerifyTicks=nil
self.MenuSessionActive=false
self.MenuReturnPendingTicks=0
log("BACKGROUND SCAN PAPER CLOSED | existingGovernorRequestPreserved=true | duplicateMenuRequestPrevented=true")
end
end
end
if self.MenuReturnPendingTicks and self.MenuReturnPendingTicks>0 then
self.MenuReturnPendingTicks=self.MenuReturnPendingTicks-1
if self.MenuReturnPendingTicks==0 and self.MenuSessionActive then
self:OpenFilterMenu(true)
return
end
end
if self.MenuSessionActive and self.MenuWasVisible
and not narrativeActive and not popupActive
and not self.ReportPopupSeenForCycle
and (self.MenuReturnPendingTicks or 0)==0 then
self.CloseDetectionTicks=(self.CloseDetectionTicks or 0)+1
if self.CloseDetectionTicks>=3 then
self.MenuSessionActive=false
self.MenuWasVisible=false
self.CloseDetectionTicks=0
self.PopupWatchTicks=0
log("SPECIALIST FINDER MENU CLOSED | closeButton=true | cachedScanRetained=true | rescan=false")
end
end
if self.PopupWatchTicks and self.PopupWatchTicks>0 then
self.PopupWatchTicks=self.PopupWatchTicks-1
end
end
function SpecialistFinder:Tick()
self:ScanTick()
self:PopupTick()
if self.PendingReportJump and self.PendingJumpReady then
self:ExecutePendingReportJump()
end
if self.SearchInputMethodWatch then
self:TickSearchInputMethodWatch()
end
end

local RelevantSpecialistsEmbedded=nil
do
local Diagnostic = {}
local PREFIX = "[Relevant Specialists Release Candidate 0.1.26] "
local HOST_RADIUS_FALLBACK = { ["87351"]=24.0, ["87350"]=24.0, ["31032"]=36.0, ["31050"]=36.0, ["89911"]=24.0, ["31031"]=36.0 }
local RAW_TARGET_GUIDS = {
[41350] = {3142}, -- Specialist Rival 01 Dorian
[41351] = {3142}, -- Specialist Rival 03 Licia
[41352] = {3141}, -- Specialist Rival 02 Tarragon
[41353] = {3145}, -- Specialist Rival 05 Zarai
[41354] = {3145}, -- Specialist Rival 06 Concordia
[41355] = {6471,6472}, -- Specialist Rival 04 Athr
[41360] = {6475,6514}, -- Specialist Rival 07 Nefeneru
[42043] = {3171,3174,3186,5604,5959,5960,6586,31767}, -- Specialist AreaPools E Cookhouses
[42044] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist PublicReward E SportingGrounds
[42045] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist PublicReward E TownHall
[42046] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Health
[42047] = {3187,3190,3191,5608,5609,5614,5958}, -- Specialist AreaPools E Dressers
[42048] = {6475}, -- Specialist Residence L CoGen RC2 give C2
[42049] = {3527,6724}, -- Specialist HallOfFame TaxAdvisor
[42050] = {3615,6728}, -- Specialist HallOfFame Haruspex
[42051] = {30762,30770}, -- Specialist Incident E Riot
[42052] = {30754,30769}, -- Specialist Incident E Fire
[42053] = {6471}, -- Specialist Residence L CoGen C2 give RC2
[42054] = {19691,29524}, -- Specialist Aqueduct L WaterSupply
[42055] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist PublicReward E Tavern
[42056] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Porridge
[42057] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Campaign Elephant
[42592] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military E Towers
[42598] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military E Towers Happiness
[43677] = {2955,2956,2971,5299,8586}, -- Specialist AreaPools E Fisheries
[44075] = {2955}, -- Specialist Productivity C SardineChain
[44076] = {2200,3171}, -- Specialist Productivity C PorridgeChain
[44077] = {5299}, -- Specialist Productivity C EelChain
[44078] = {2786,3169,5955,5973}, -- Specialist Productivity C SailsChain
[44079] = {3168,5956,31750,31762}, -- Specialist Productivity C RopesChain
[44080] = {2693,3075,3174,5960,5967,5972}, -- Specialist Productivity C BreadChain
[44081] = {2796,5847,31767}, -- Specialist Productivity R BeefChain
[44082] = {5847,6586}, -- Specialist Productivity R CheeseChain
[44083] = {3187,5958,31750,31762}, -- Specialist Productivity C TunicsChain
[44084] = {3070,3074,5470,5472,5969,31755}, -- Specialist AreaPools E Smelters
[44085] = {2956,2957,3185}, -- Specialist Productivity C GarumChain
[44086] = {2793,2994,3190}, -- Specialist Productivity C SandalsChain
[44087] = {2800,5608,5973}, -- Specialist Productivity R TrousersChain
[44088] = {2878,5611,5616,5975,5976}, -- Specialist Productivity R ChariotsChain
[44089] = {2920,3192,31753,31755,50280}, -- Specialist Productivity E NecklacesChain
[44112] = {2694,2795,3177,8427,23723,23753}, -- Specialist Productivity R WineChain
[44113] = {5472,5605,5980}, -- Specialist Productivity R BroochesChain
[44114] = {2786,3081,4832,5481,8579,31753,31755,50280}, -- Specialist Productivity E LyresChain
[44115] = {2795,3201,8579}, -- Specialist Productivity C WritingTabletsChain
[44116] = {5472,5615,5980,8431}, -- Specialist Productivity E MirrorsChain
[44117] = {5291,5470,5606}, -- Specialist Productivity C TorcsChain
[44118] = {2669,2999,3079,3191,5971,8580}, -- Specialist Productivity R TogasChain
[44119] = {5971,15514,31766,31769}, -- Specialist Productivity R WigsChain
[44120] = {2920,2958,3074,3082,3202,10929}, -- Specialist Productivity R FineGlassChain
[44121] = {2800,5291,5470,31773}, -- Specialist Productivity R ClanShieldsChain
[44122] = {2793,5475,5477,5604,5851,5974,31756}, -- Specialist Productivity E TonguesChain
[44139] = {2970,3199,5848,31752,31761,55962}, -- Specialist Productivity C AmphoraeChain
[44140] = {5609,5849}, -- Specialist Productivity C ReedShoesChain
[44141] = {2699,4831}, -- Specialist Productivity C OliveOilChain
[44142] = {2698,2793,3189,5475,5974,31756}, -- Specialist Productivity C SoapChain
[44143] = {2971,3186,8586,8893}, -- Specialist Productivity R OystersChain
[44144] = {2786,3188}, -- Specialist Productivity C HatsChain
[44145] = {5278}, -- Specialist Productivity C CocklesChain
[44146] = {2799,5474,5570}, -- Specialist Productivity C BeerChain
[44147] = {5959,5974,31764}, -- Specialist Productivity E SausagesChain
[44148] = {2796,31759,31770,31772}, -- Specialist Productivity R PeltHatsChain
[44149] = {2669,2999,3198,5971,8579,8580,8887}, -- Specialist Productivity E LoungersChain
[44431] = {2200,2669,2693,2799,5971,5972,31750,31762}, -- Specialist Campaign Elephant Handler
[50287] = {2794,15514}, -- Specialist Productivity E HorseChain
[50289] = {2918,3070,3170,5954,5969,5982}, -- Specialist Productivity R WeaponsChain
[50291] = {2793,2918,2957,2994,3070,5969,5974,5982,13808,13810,13839,55945,80612,80613}, -- Specialist Productivity R ArmorChain
[50665] = {2786,2800,5290,5469,5614,5973}, -- Specialist Productivity R CloakChain
[50890] = {3070,3074,3170,5470,5472,5954,5969,13808,31755,55945}, -- Specialist Colosseum Hero Favillus
[50900] = {5847,6586}, -- Specialist Economy Caera
[51012] = {2693,3075,3174,5960,5967,5972}, -- Specialist Economy Maria Bacca
[51278] = {27888,29545,54989,55000}, -- Specialist Military E Gates
[51280] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Prestige
[51282] = {2200,2669,2693,2799,5971,5972,31750,31762}, -- Specialist ProdPools L Farms
[51286] = {30754,30762,30765,30769,30770,30771}, -- Specialist AreaPools L Institutions
[51288] = {3087}, -- Specialist Residence L CoGen R1 give R2
[51292] = {2955,2956,2971,5299,5851,5975,8586,31759}, -- Specialist Maintenance R Hunters & Fisheries
[51316] = {2795,2796,5278,5849,8427,8431}, -- Specialist Maintenance C Gatherers
[51321] = {2200,2669,2693,2799,5971,5972,31750,31762}, -- Specialist Maintenance E Farms
[51324] = {2786,2793,2794,5847,5973,5974,8580,15514}, -- Specialist Maintenance R Pastures
[51326] = {2918,2958,2970,5290,5291,5848,5980,5982,10929,31753,50280,144810,144811}, -- Specialist Maintenance E Mines & Pits
[51328] = {3177,3185,3189,3199,4831,5474,5570,23753,55962}, -- Specialist Maintenance C Coopers
[51330] = {2957,2999,3075,3082,5469,5475,5477,5967,8893,31756,31772}, -- Specialist Maintenance C Extractors
[51332] = {3081,3198,3201,4832,5611,5616,31773,145230}, -- Specialist Maintenance E Workshops
[51334] = {3070,3074,5470,5472,5969,31755}, -- Specialist Maintenance C Smelters
[51336] = {3171,3174,3186,5604,5959,5960,6586,31767}, -- Specialist Maintenance R Cookhouses
[51338] = {3187,3190,3191,5608,5609,5614,5958}, -- Specialist Maintenance C Dressers
[51340] = {2694,2698,2699,2800,23723,31764}, -- Specialist Maintenance E Plantations
[51342] = {3188,3192,3202,5605,5606,5615,31769,31770,55963,145229}, -- Specialist Maintenance E Artisans
[51344] = {3089,3091,3129,3138,3203,5935,5945,5946,5947,41811}, -- Specialist Maintenance C Material Producers
[51346] = {3170,5954,13808,55945}, -- Specialist Maintenance R Arms Producers
[51357] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist PublicReward E AqueductCistern
[51362] = {30754,30769}, -- Specialist Area R InstitutionFire
[51366] = {3091,5947}, -- Specialist Area R Tiles
[51370] = {5570}, -- Specialist Area R Beer
[51374] = {5614}, -- Specialist Area E Cloak
[51378] = {2698}, -- Specialist Area R Lavender
[51382] = {3171}, -- Specialist Area C Porridge
[51386] = {3188}, -- Specialist Area C Hats
[51390] = {3191}, -- Specialist Area E Togas
[51394] = {3138}, -- Specialist Area E Marble
[51398] = {5299}, -- Specialist Area C Eels
[51402] = {5980}, -- Specialist Area R SilverOre
[51406] = {5959}, -- Specialist Area R Sausages
[51410] = {31769}, -- Specialist Area E Wigs
[51414] = {5847}, -- Specialist Area R Aurochs 
[51418] = {5295}, -- Specialist Area E GraniteBlocks
[51422] = {5470}, -- Specialist Area R Bronze
[51426] = {31767}, -- Specialist Area E RoastBeef
[51430] = {31770}, -- Specialist Area E PeltHats
[51434] = {41811}, -- Specialist Area E Granite
[51442] = {30762,30770}, -- Specialist Area R InstitutionRiot 
[51446] = {3187,5958}, -- Specialist Area C Tunics 
[51450] = {3170,5954}, -- Specialist Area R Weapons 
[51454] = {3185}, -- Specialist Area R Garum 
[51458] = {4832}, -- Specialist Area E Lyres 
[51462] = {3203}, -- Specialist Area E Mosaics 
[51466] = {30765,30771}, -- Specialist Area R InstitutionIllness
[51470] = {5604}, -- Specialist Area E BirdTongues 
[51474] = {5616}, -- Specialist Area E Chariots 
[51478] = {2794,15514}, -- Specialist Area E Horses 
[51482] = {3177,23753}, -- Specialist Area E Wine 
[51486] = {5475,31756}, -- Specialist Area R Fat 
[51490] = {3189}, -- Specialist Area R Soap 
[51494] = {3190}, -- Specialist Area R Sandals 
[51498] = {4831}, -- Specialist Area R OliveOil
[51502] = {31764}, -- Specialist Area R Herbs 
[51506] = {5278}, -- Specialist Area C Cockles 
[51510] = {6586}, -- Specialist Area R Cheese 
[51514] = {5608}, -- Specialist Area R Trousers 
[51519] = {2918,5982}, -- Specialist Area R IronOre 
[51523] = {5481}, -- Specialist Area R Strings 
[51527] = {3186}, -- Specialist Area E OystersCaviar 
[51531] = {3201}, -- Specialist Area R WaxTablets
[51535] = {3202}, -- Specialist Area E FineGlass 
[51539] = {5291}, -- Specialist Area R TinOre 
[51543] = {5290}, -- Specialist Area R CopperOre 
[51547] = {31772}, -- Specialist Area E Lye 
[51551] = {2793,5974}, -- Specialist Area R Pigs 
[51555] = {2994,80612}, -- Specialist Area R Leather 
[51559] = {31755}, -- Specialist Area E Gold 
[51563] = {3199,55962}, -- Specialist Area R Amphorae 
[51567] = {2916,5978}, -- Specialist Area R LimestoneBlocks
[51571] = {5472}, -- Specialist Area R Silver
[51575] = {2786,5973}, -- Specialist Area E Sheep 
[51579] = {5609}, -- Specialist Area C ReedShoes
[51587] = {2954}, -- Specialist Area E MarbleBlocks 
[51591] = {2920}, -- Specialist Area E Minerals 
[51595] = {2999}, -- Specialist Area E TyrianPurple 
[51599] = {3074}, -- Specialist Area R Glass 
[51603] = {3082}, -- Specialist Area R Pigments 
[51607] = {3192}, -- Specialist Area E Necklaces 
[51611] = {3198}, -- Specialist Area E Loungers 
[51615] = {13808,55945}, -- Specialist Area E Armor 
[51619] = {5605}, -- Specialist Area R Brooches 
[51623] = {5615}, -- Specialist Area E Mirrors 
[51627] = {5606}, -- Specialist Area R Torcs 
[51631] = {31773}, -- Specialist Area E ClanShields 
[51635] = {3174,5960}, -- Specialist Area R Bread 
[51639] = {2880,5977}, -- Specialist Area R Charcoal 
[51826] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C Sardines
[51829] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C Eels
[51831] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C Cockles
[51833] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Garum
[51835] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Bread
[51837] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Sausages
[51839] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Beer
[51841] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Cheese
[51843] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Wine
[51845] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Beef
[51847] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Tongues
[51849] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Oysters
[51851] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C Hats
[51853] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C Tunics
[51855] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward C ReedShoes
[51857] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Sandals
[51859] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Soap
[51861] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Trousers
[51863] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Torcs
[51865] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Brooches
[51867] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Togas
[51869] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Wigs
[51871] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E PeltHats
[51873] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Cloaks
[51875] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Necklaces
[51877] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R Amphorae
[51879] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward R OliveOil
[51881] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E WritingTablets
[51883] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E FineGlass
[51885] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Mirrors
[51887] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Loungers
[51889] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Lyres
[51891] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E Chariots
[51893] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist NeedReward E ClanShields
[54009] = {30754,30769}, -- Specialist Incident C Fire
[54011] = {30754,30769}, -- Specialist Incident R Fire
[54015] = {30765,30771}, -- Specialist Incident C Illness
[54017] = {30765,30771}, -- Specialist Incident R Illness
[54021] = {30762,30770}, -- Specialist Incident C Riot
[54023] = {30762,30770}, -- Specialist Incident R Riot
[54025] = {30754,30769}, -- Specialist Incident L Fire
[54034] = {30765,30771}, -- Specialist Incident L Illness
[54041] = {30762,30770}, -- Specialist Incident L Riot
[54048] = {31764}, -- Specialist Farming R Herbs
[54050] = {5980}, -- Specialist Farming R Silver
[54052] = {8579}, -- Specialist Farming R Sandarac
[54054] = {2920}, -- Specialist Farming R Minerals
[54056] = {2698}, -- Specialist Farming C Lavender
[54058] = {2800}, -- Specialist Farming R DyePlants
[54060] = {2799}, -- Specialist Farming R Barley
[64944] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Money
[64945] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Money
[64949] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Belief
[64950] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Knowledge
[64951] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Prestige
[64952] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C FireSafety
[64953] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Health
[64954] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance C Happiness
[64961] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Belief
[64962] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Knowledge
[64963] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Prestige
[64964] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E FireSafety
[64965] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Health
[64966] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance E Happiness
[68051] = {19691,19723,29524,29525,81354,82038}, -- Specialist Onboarding Income
[71438] = {3527,6724}, -- Specialist Tutorial Finance
[71441] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Tutorial Economy
[79636] = {6054,29340}, -- Specialist AreaPools L Shipyards
[79927] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Knowledge
[79947] = {2918,5290,5291,5980,5982,50280,144810,144811}, -- Specialist ProdPools L Mines
[79958] = {2918,5290,5291,5980,5982,50280,144810,144811}, -- Specialist AreaPools L Mines
[80176] = {27888,27889,29543,29545,31567,42550,42551,42552,54986,54987,54988,54989,54997,54998,54999,55000,71446,71448,71452,71453}, -- Specialist Military L Walls
[80179] = {80710,81021,81068,81069,81070,81071,81072,82487,82488,82489,82490,82491,82492,144812,144813}, -- Specialist AreaPools L Shrines
[80189] = {3070,3074,5470,5472,5969,31755}, -- Specialist ProdPools L Smelters
[80192] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Happiness
[80221] = {2200,2669,2693,2694,2698,2699,2786,2793,2794,2795,2796,2799,2800,2878,2880,2916,2918,2920,2954,2955,2956,2957,2958,2970,2971,2994,2999,3070,3074,3075,3079,3081,3082,3089,3091,3129,3138,3168,3169,3170,3171,3174,3177,3185,3186,3187,3188,3189,3190,3191,3192,3198,3199,3201,3202,3203,4831,4832,5278,5290,5291,5295,5299,5469,5470,5472,5474,5475,5477,5481,5570,5604,5605,5606,5608,5609,5611,5614,5615,5616,5847,5848,5849,5851,5935,5945,5946,5947,5954,5955,5956,5958,5959,5960,5967,5969,5971,5972,5973,5974,5975,5976,5977,5978,5980,5982,6586,8427,8431,8579,8580,8586,8887,8893,10929,13808,15514,23723,23753,31750,31752,31753,31755,31756,31759,31761,31762,31764,31766,31767,31769,31770,31772,31773,41811,50280,55945,55962,55963,80612,144810,144811,145229,145230}, -- Specialist ProdPools L All
[80225] = {2786,2793,2794,5847,5973,5974,8580,15514}, -- Specialist ProdPools L Pastures
[80490] = {3621,36908,36911,36912}, -- Specialist AreaPools L Colosseum
[80494] = {30765,30771}, -- Specialist Incident E Illness
[80502] = {2694,2698,2699,2800,23723,31764}, -- Specialist ProdPools L Plantations
[80510] = {3170,5954,13808,55945}, -- Specialist ProdPools L Armouries
[80513] = {32606,44020,44021,87341,87342,87343}, -- Specialist AreaPools L Encampments
[80677] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Belief
[80686] = {3617,3620,3621,6729,8062,55980,55981}, -- Specialist AreaPools L Wonders
[82419] = {71266,71269}, -- Specialist HL SPQL 011 Cabin Cleanser
[82777] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist HL SPQL 028 Mad Cook
[88062] = {2799}, -- Specialist WL SPQL W 009 Barley Farmer
[90573] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist WL SPQL 056 Nathanael
[91415] = {27890,29546,50972,50974,54990,55002}, -- Specialist HallOfFame Giant
[91417] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist HallOfFame Fashionista
[91419] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist HallOfFame Stargazer
[91421] = {3087,6414}, -- Specialist HallOfFame Henchman
[92874] = {3087}, -- Specialist Residence E Workforce R01
[92876] = {3141}, -- Specialist Residence R Workforce R02
[92878] = {3142}, -- Specialist Residence R Workforce R03
[92880] = {3145}, -- Specialist Residence E Workforce R04
[92882] = {6475}, -- Specialist Residence R Workforce RC02
[92884] = {6514}, -- Specialist Residence E Workforce RC03
[92886] = {6414}, -- Specialist Residence E Workforce C01
[92888] = {6471}, -- Specialist Residence R Workforce C02
[92890] = {6472}, -- Specialist Residence E Workforce C03
[93989] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist WL SPQL W 017 Voadas Female Bard
[94541] = {38383,41581}, -- Specialist WL SPQL W 018 Voadas Son
[94567] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Campaign Musician Aodhan
[95403] = {2796,2955,2956,2957,2958,5278,8431,8580,8586,10929}, -- Specialist Quest Valeria
[96817] = {3171,3174,3186,5604,5959,5960,6586,31767}, -- Specialist Colosseum Cook Apicius
[96819] = {3089,3091,3129,3138,3203,5935,5945,5946,5947,41811}, -- Specialist Colosseum Volunteer
[96821] = {30754,30762,30765,30769,30770,30771}, -- Specialist Colosseum Quintus
[106397] = {19691,29524}, -- Specialist Aqueduct R WaterSupply
[106410] = {2200,2669,2693,2799,5971,5972,31750,31762}, -- Specialist Aqueduct C WaterConsumption
[106412] = {2694,2698,2699,2800,23723,31764}, -- Specialist Aqueduct R WaterConsumption
[106414] = {2918,5290,5291,5980,5982,50280,144810,144811}, -- Specialist Aqueduct E WaterConsumption
[106416] = {3617,3620,3621,6729,8062,55980,55981}, -- Specialist Aqueduct L WaterConsumption
[106537] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military R Towers Offense
[106539] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military C Towers
[106541] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military R Towers Defense
[106543] = {27890,29546,50972,50974,54990,55002}, -- Specialist Military L Towers
[106545] = {27888,29545,54989,55000}, -- Specialist Military R Gates Defense
[106547] = {27888,29545,54989,55000}, -- Specialist Military R Gates Offense
[106549] = {3310,3311,3312,3313,3402,3403,3406,4115,7037,7038,7039,7055,7056,7057,29663}, -- Specialist Military C Warehouses
[106551] = {38383,41581}, -- Specialist Military R RepairCrane
[106631] = {2200,2699}, -- Specialist Workforce C Roman Farms
[106634] = {2799,31764}, -- Specialist Workforce C Celtic Farms
[106636] = {2955,2956}, -- Specialist Workforce C Roman Coast
[106638] = {2796,5278}, -- Specialist Workforce C Celtic Coast
[106640] = {2786,2793,8580}, -- Specialist Workforce E Roman Pastures
[106642] = {5847,5973,5974}, -- Specialist Workforce E Celtic Pastures
[106644] = {30754,30762,30765}, -- Specialist Workforce R Roman Institutions
[106646] = {30769,30770,30771}, -- Specialist Workforce R Celtic Institutions 
[106648] = {3310,3311,3312}, -- Specialist Workforce R Roman Warehouses
[106650] = {7055,7056,7057}, -- Specialist Workforce R Celtic Warehouses
[106652] = {27890,50972,54990}, -- Specialist Workforce E Roman Towers
[106654] = {29546,50974,55002}, -- Specialist Workforce E Celtic Towers
[106731] = {15519,15833,15834,15946,15947,15948}, -- Specialist Recruitment C All
[106736] = {15519,15946}, -- Specialist Recruitment R Barracks
[106738] = {15834,15948}, -- Specialist Recruitment R Siege
[106740] = {15833,15947}, -- Specialist Recruitment R Stables
[106742] = {15519,15833,15834,15946,15947,15948}, -- Specialist Recruitment E All
[106841] = {27888,27890,29545,29546,50972,50974,54990,55002}, -- Specialist Military L WishNico
[106846] = {2786,5973}, -- Specialist Wish Dog
[106956] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L Money
[106974] = {2878,2880,5976,5977,8579,31752,31761}, -- Specialist ProdPools L Forestries
[107337] = {27888,29545,54989,55000}, -- Specialist Military L Gates
[107339] = {3170,5954,13808,55945}, -- Specialist AreaPools L Smelters
[107554] = {71264,71265,71266,71267,71268,71269}, -- Specialist AreaPools L Amenities
[107596] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance L FireSafety
[109532] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist HL SPQL W 007 Suitor
[125560] = {71265,71268}, -- Specialist Campaign TaxFraud
[140338] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Money
[140344] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Belief
[140355] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Knowledge
[140388] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Prestige
[140403] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R FireSafety
[140405] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Health
[140407] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Balance R Happiness
[144840] = {2698}, -- Specialist Farming E Lavender
[144842] = {31764}, -- Specialist Farming L Herbs
[144844] = {2800}, -- Specialist Farming L Dyes
[144846] = {2799}, -- Specialist Farming L Barley
[144848] = {8579}, -- Specialist Farming L Sandarac
[144850] = {2694,23723}, -- Specialist Farming C Grapes
[144852] = {2694,23723}, -- Specialist Farming E Grapes
[144854] = {2669,5971}, -- Specialist Farming C Flax
[144856] = {2669,5971}, -- Specialist Farming E Flax
[144858] = {2796}, -- Specialist Farming C Samphire
[144860] = {2796}, -- Specialist Farming E Samphire
[144862] = {31752,31761}, -- Specialist Farming C Resin
[144864] = {31752,31761}, -- Specialist Farming E Resin
[144866] = {2699}, -- Specialist Farming C Olives
[144868] = {2918,5982}, -- Specialist Farming R IronOre
[144870] = {5291}, -- Specialist Farming R TinOre
[144872] = {5290}, -- Specialist Farming R CopperOre
[144874] = {5980}, -- Specialist Farming L SilverOre
[144876] = {50280}, -- Specialist Farming R GoldOre
[144878] = {50280}, -- Specialist Farming L GoldOre
[144900] = {2699}, -- Specialist Farming E Olives
[145236] = {2956}, -- Specialist Farming C Mackerel
[145238] = {8580}, -- Specialist Farming C SeaSnail
[145240] = {8431}, -- Specialist Farming C Seashell
[145242] = {2971}, -- Specialist Farming R Sturgeon
[145244] = {5975}, -- Specialist Farming R Ponies
[145246] = {8586}, -- Specialist Farming R Oysters
[145248] = {5851}, -- Specialist Farming R SmallBirds
[145250] = {31759}, -- Specialist Farming R Beavers
[145252] = {5295}, -- Specialist Farming R Granite
[145254] = {2954}, -- Specialist Farming R Marble
[145256] = {2956}, -- Specialist Farming E Mackerel
[145258] = {8580}, -- Specialist Farming E SeaSnail
[145260] = {8431}, -- Specialist Farming E Seashell
[145262] = {2971}, -- Specialist Farming L Sturgeon
[145265] = {5975}, -- Specialist Farming L Ponies
[145268] = {2916,2918,2920,2954,2958,2970,5290,5291,5295,5848,5978,5980,5982,10929,31753,50280,144810,144811}, -- Specialist Volcano Storyline L End
[145271] = {3138,145229}, -- Specialist Volcano Storyline R Productivity Idols
[147974] = {3081,8579,31753,31755,50280,145230}, -- Specialist Volcano Storyline R Productivity Boardgames
[147976] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Volcano Storyline E NeedReward Idols
[147978] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist Volcano Storyline E NeedReward Boardgames
[149292] = {3087,3141,3142,3145,6414,6471,6472,6475,6514}, -- Specialist HallOfFame Nanny
}
local function targetSetForGuid(itemGuidValue)
local list = RAW_TARGET_GUIDS[itemGuidValue] or {}
local set = {}
for _,g in ipairs(list) do set[g]=true end
return list,set
end
local function joinNumbers(list)
local parts={}
for _,v in ipairs(list or {}) do parts[#parts+1]=tostring(v) end
return table.concat(parts, ";")
end
local function log(message)
system.log(PREFIX .. tostring(message))
end
local function safe(callback)
local ok, value = pcall(callback)
if ok then return value end
return nil
end
local function read(object, key)
return safe(function() return object and object[key] end)
end
local function text(value)
if value == nil then return "" end
local ok, result = pcall(tostring, value)
return ok and result or "<tostring-error>"
end
function Diagnostic:HostEffectRadius(selected)
local guid=text(selected and (read(selected,"GUID") or read(selected,"Guid")) or "")
local radius=HOST_RADIUS_FALLBACK[guid]
if radius then return radius,"host-guid-assets.xml" end
return 12.0,"unknown-host-fallback"
end

local function uiRoot()
return rawget(_G, "ui") or rawget(_G, "UI")
end
local function scene(name)
local root = uiRoot()
local scenes = root and read(root, "Scenes") or nil
return scenes and read(scenes, name) or nil
end
local function guestHousePopup()
local s = scene("OMGuestHouse")
local sd = s and read(s, "SceneData") or nil
local data = sd and read(sd, "OMGuestHouseData") or nil
return data and read(data, "ItemPopup") or nil, data, s
end
local function villaPopup()
local s = scene("OMGovernorVilla")
local sd = s and read(s, "SceneData") or nil
local data = sd and read(sd, "OMGovernorVillaData") or nil
local tab = data and read(data, "VillaTab") or nil
return (tab and read(tab, "ItemsSelectionPopupData")) or (data and read(data, "ItemsSelectionPopupData")) or nil, data, s
end
local function arrayHelper(arrayValue)
if arrayValue == nil then return nil end
local helperKey = string.match(text(arrayValue), "^(PhoenixArray<[^>]+>)")
if helperKey == nil then return nil end
local haloRoot = rawget(_G, "halo")
local helper = type(haloRoot) == "table" and haloRoot[helperKey] or nil
if type(helper) ~= "table" or type(helper.GetSize) ~= "function" or type(helper.GetElement) ~= "function" then
return nil
end
return helper
end
local function arraySize(arrayValue)
local helper = arrayHelper(arrayValue)
if not helper then return nil end
return tonumber(safe(function() return helper.GetSize(arrayValue) end))
end
local function arrayElement(arrayValue, index)
local helper = arrayHelper(arrayValue)
if not helper then return nil end
return safe(function() return helper.GetElement(arrayValue, index) end)
end
local function pickerCandidate(label, popup, data, sceneObject)
if not popup then return nil end
local items = read(popup, "ItemsData")
local array = items and read(items, "ArrayData") or nil
local count = arraySize(array) or 0
local isVisible = read(popup, "IsVisible")
return {label=label, popup=popup, data=data, scene=sceneObject, items=items, array=array, count=count, isVisible=isVisible}
end
local function pickerPair()
local gp, gd, gs = guestHousePopup()
local vp, vd, vs = villaPopup()
local g = pickerCandidate("Guest House / Officium", gp, gd, gs)
local v = pickerCandidate("Governor Villa", vp, vd, vs)
return g, v
end
local function activePicker()
local g, v = pickerPair()
if g and g.count > 0 and g.isVisible == true then return g end
if v and v.count > 0 and v.isVisible == true then return v end
return nil
end
local function anyPicker(label)
local g, v = pickerPair()
if label == "Guest House / Officium" then return g end
if label == "Governor Villa" then return v end
if g and g.count > 0 then return g end
if v and v.count > 0 then return v end
return g or v
end
local function currentSelectedObject()
local selection = rawget(_G, "Selection")
if not selection then return nil end
return read(selection, "Object") or read(selection, "PickedObject")
end
local function objectAreaID(object)
local area = object and read(object, "Area") or nil
local id = area and read(area, "ID") or nil
if id == nil then id = read(object, "AreaID") end
return text(id)
end
local function normalizeGuid(value)
local direct = tonumber(value)
if direct and direct > 0 then return direct end
if value ~= nil then
for _, key in ipairs({"GUID","Guid","RefGUID","RefGuid","ItemGUID","ItemGuid","AssetGUID","AssetGuid"}) do
local n = tonumber(read(value, key))
if n and n > 0 then return n end
end
end
return 0
end
local function itemGuid(row)
if row == nil then return 0 end
local base = read(row, "BaseData")
local tip = base and read(base, "InfoTip") or nil
local interaction = read(row, "Interaction")
local context = interaction and read(interaction, "Context") or nil
for _, candidate in ipairs({
read(context,"Guid"), read(context,"GUID"), read(tip,"RefGUID"), read(tip,"RefGuid"),
read(base,"Guid"), read(base,"GUID"), read(row,"Guid"), read(row,"GUID")
}) do
local n = tonumber(candidate)
if n and n > 0 then return n end
end
return 0
end
local function candidateSignature(picker)
if not picker or not picker.array then return "" end
local parts = {}
local limit = math.min(picker.count or 0, 240)
for i=0,limit-1 do
local row = arrayElement(picker.array, i)
local guid = itemGuid(row)
parts[#parts+1] = tostring(guid)
end
return table.concat(parts, ",")
end
local function infoTipGuid()
local manager = rawget(_G, "InfoTip")
local guid = normalizeGuid(manager and read(manager, "RefGuid") or 0)
if guid == 0 then guid = normalizeGuid(manager and read(manager, "RefGUID") or 0) end
return guid
end
local function candidateByGuid(picker, guid)
if guid <= 0 then return -1, nil end
local limit = math.min(picker.count, 240)
for i=0, limit-1 do
local row = arrayElement(picker.array, i)
if itemGuid(row) == guid then return i, row end
end
return -1, nil
end
local function itemAsset(guid)
if type(rawget(_G,"ItemAssetData")) ~= "function" then return nil end
return safe(function() return ItemAssetData(guid) end)
end
local function getGroup(propertyName)
local properties = rawget(_G,"Properties")
local scripts = rawget(_G,"Scripts")
if not properties or not scripts or not properties[propertyName]
or type(scripts.GetObjectGroupByProperty) ~= "function" then return {} end
return safe(function() return scripts:GetObjectGroupByProperty(properties[propertyName]) or {} end) or {}
end
local function tryBuildingAsset(guid)
local attempts = {}
local function accept(source, asset)
if asset ~= nil then
local name = text(read(asset,"Text") or read(asset,"Name") or read(asset,"DisplayName") or read(asset,"BuildingName"))
return asset, source, name
end
return nil
end
local f = rawget(_G,"BuildingAssetData")
if type(f) == "function" then
local asset = safe(function() return f(guid) end)
local a,s,n = accept("BuildingAssetData", asset); if a then return a,s,n end
attempts[#attempts+1] = "BuildingAssetData=nil"
end
f = rawget(_G,"AssetData")
if type(f) == "function" then
local asset = safe(function() return f(guid) end)
local a,s,n = accept("AssetData", asset); if a then return a,s,n end
attempts[#attempts+1] = "AssetData=nil"
end
local assets = rawget(_G,"Assets")
if assets ~= nil then
for _, method in ipairs({"GetAssetData","GetAsset","GetAssetByGUID","GetAssetByGuid"}) do
local fn = read(assets, method)
if type(fn) == "function" then
local asset = safe(function() return fn(assets, guid) end)
if asset == nil then asset = safe(function() return fn(guid) end) end
local a,s,n = accept("Assets:"..method, asset); if a then return a,s,n end
attempts[#attempts+1] = "Assets:"..method.."=nil"
end
end
end
return nil, (#attempts>0 and table.concat(attempts,",") or "no-known-building-asset-api"), ""
end
local function vectorCoords(value)
if value == nil then return nil end
local function num(v)
local n = tonumber(v)
if n ~= nil then return n end
return tonumber(text(v))
end
local x = num(read(value,"x")) or num(read(value,"X")) or num(read(value,1))
local y = num(read(value,"y")) or num(read(value,"Y")) or num(read(value,2))
local z = num(read(value,"z")) or num(read(value,"Z")) or num(read(value,3))
if x == nil and y == nil and z == nil then return nil end
return {x=x,y=y,z=z,raw=text(value)}
end
local function objectCoords(object)
local p2 = read(object,"Position2D")
local c2 = vectorCoords(p2)
if c2 and c2.x ~= nil and c2.y ~= nil then return {x=c2.x,z=c2.y,source="Position2D",raw=c2.raw} end
local p = read(object,"Position")
local c = vectorCoords(p)
if c then
if c.x ~= nil and c.z ~= nil then return {x=c.x,z=c.z,source="Position.xz",raw=c.raw} end
if c.x ~= nil and c.y ~= nil then return {x=c.x,z=c.y,source="Position.xy",raw=c.raw} end
end
return {x=nil,z=nil,source="unreadable",raw=text(p2 ~= nil and p2 or p)}
end
local function distance2D(a,b)
if not a or not b or a.x == nil or a.z == nil or b.x == nil or b.z == nil then return nil end
local dx, dz = a.x-b.x, a.z-b.z
return math.sqrt(dx*dx + dz*dz)
end
local function normalizeWords(value)
local s = string.lower(text(value))
s = string.gsub(s,"[^%w%s]"," ")
s = string.gsub(s,"%s+"," ")
s = string.gsub(s,"^%s+","")
s = string.gsub(s,"%s+$","")
return s
end
local function singularWord(w)
if #w > 4 and string.sub(w,-3) == "ies" then return string.sub(w,1,-4).."y" end
if #w > 3 and string.sub(w,-2) == "es" then return string.sub(w,1,-3) end
if #w > 3 and string.sub(w,-1) == "s" then return string.sub(w,1,-2) end
return w
end
local function tokenSet(value)
local out = {}
for w in string.gmatch(normalizeWords(value),"%w+") do
if w ~= "chain" and w ~= "and" and w ~= "the" and w ~= "of" then
out[singularWord(w)] = true
end
end
return out
end
local function roughTargetMatch(target, buildingName)
local tt = tokenSet(target)
local bt = tokenSet(buildingName)
local needed, hit = 0,0
for w in pairs(tt) do needed=needed+1; if bt[w] then hit=hit+1 end end
if needed == 0 then return false,0,0 end
return hit == needed, hit, needed
end
local RADIUS_FIELDS = {
"Radius","Range","EffectRadius","InfluenceRadius","ItemRadius","BuffRadius",
"ObjectMenuRadius","SocketRadius","AreaRadius","CoverageRadius","RangeRadius"
}
local function probeRadiusSource(label, object)
if object == nil then return {} end
local values={}
for _,field in ipairs(RADIUS_FIELDS) do
local v=read(object,field)
if v ~= nil and type(v) ~= "function" then values[field]=text(v) end
end
if next(values) ~= nil then
local parts={}
for _,field in ipairs(RADIUS_FIELDS) do if values[field] ~= nil then parts[#parts+1]=field.."="..values[field] end end
log("RADIUS SOURCE | source="..label.." | "..table.concat(parts," | "))
end
return values
end
local TARGET_DATA_FIELDS = {
"Target", "Targets", "TargetGUID", "TargetGuid", "TargetGUIDs", "TargetGuids",
"TargetList", "EffectTarget", "EffectTargets", "ItemOrBuffEffectTargets",
"ItemEffectTargets", "BuffEffectTargets", "BuildingTargets", "TargetAssets",
"TargetCategories", "ItemTargets", "TargetFilter", "TargetType", "TargetCategory",
"AffectedBuildings", "AffectedBuildingTypes", "ValidTargets"
}
local TARGET_ELEMENT_FIELDS = {
"Guid", "GUID", "TargetGUID", "TargetGuid", "AssetGUID", "AssetGuid",
"BuildingGUID", "BuildingGuid", "Category", "CategoryID", "Type", "Id", "ID",
"Text", "Name"
}
local function probeTargetData(label, object)
if object == nil then return end
for _,field in ipairs(TARGET_DATA_FIELDS) do
local v=read(object,field)
if v ~= nil and type(v) ~= "function" then
local size=arraySize(v)
log("TARGET DATA | source="..label.." | field="..field
.." | valueType="..type(v).." | value="..text(v)
.." | arraySize="..tostring(size or ""))
if size and size > 0 then
local limit=math.min(size,12)
for i=0,limit-1 do
local e=arrayElement(v,i)
local parts={}
for _,ef in ipairs(TARGET_ELEMENT_FIELDS) do
local ev=read(e,ef)
if ev ~= nil and type(ev) ~= "function" then
parts[#parts+1]=ef.."="..text(ev)
end
end
log("TARGET DATA ELEMENT | source="..label.." | field="..field
.." | index="..tostring(i).." | valueType="..type(e)
.." | value="..text(e).." | fields="..table.concat(parts,";"))
end
end
end
end
end
local BUILDING_META_FIELDS = {
"Text","Name","DisplayName","BuildingName","Template","TemplateName","Category","CategoryText",
"BuildingCategory","BuildingCategoryText","BuildingType","BuildingTypeText","ProductionChain","ProductionChainText",
"Product","ProductName","OutputProduct","OutputProductName","IsResidence","ResidenceTier","FactoryType"
}
local function buildingMeta(asset)
local out={}
if asset then
for _,field in ipairs(BUILDING_META_FIELDS) do
local v=read(asset,field)
if v ~= nil and type(v) ~= "function" then out[field]=text(v) end
end
end
return out
end
local function preferredBuildingName(meta, fallback)
for _,field in ipairs({"Text","DisplayName","BuildingName","Name","ProductionChainText","BuildingTypeText","CategoryText"}) do
if meta[field] and meta[field] ~= "" then return meta[field] end
end
return fallback or ""
end
local function scanAreaBuildings(selected, target, rawTargetSet)
local areaID=objectAreaID(selected)
local center=objectCoords(selected)
local groups={}
local total=0
local coordsReadable=0
local assetResolved=0
local roughMatches={}
local buildings=getGroup("Building")
for _,object in pairs(buildings) do
if objectAreaID(object)==areaID then
total=total+1
local guid=normalizeGuid(read(object,"GUID") or read(object,"Guid"))
local id=text(read(object,"ID"))
local pos=objectCoords(object)
local dist=distance2D(center,pos)
if dist ~= nil then coordsReadable=coordsReadable+1 end
local g=groups[guid]
if not g then
local asset, source, apiName=tryBuildingAsset(guid)
local meta=buildingMeta(asset)
local name=preferredBuildingName(meta,apiName)
g={guid=guid,count=0,name=name,assetSource=source,meta=meta,minDistance=nil,maxDistance=nil}
groups[guid]=g
if asset then assetResolved=assetResolved+1 end
end
g.count=g.count+1
if dist ~= nil then
if g.minDistance==nil or dist<g.minDistance then g.minDistance=dist end
if g.maxDistance==nil or dist>g.maxDistance then g.maxDistance=dist end
end
local match = rawTargetSet and rawTargetSet[guid] == true or false
if match then
roughMatches[#roughMatches+1]={id=id,guid=guid,name=g.name,distance=dist,hit=1,needed=1}
end
end
end
local typeRows={}
for _,g in pairs(groups) do typeRows[#typeRows+1]=g end
table.sort(typeRows,function(a,b)
if a.name ~= b.name then return a.name < b.name end
return a.guid < b.guid
end)
table.sort(roughMatches,function(a,b)
if a.distance==nil and b.distance~=nil then return false end
if a.distance~=nil and b.distance==nil then return true end
if a.distance~=nil and b.distance~=nil and a.distance~=b.distance then return a.distance<b.distance end
return a.id<b.id
end)
return {areaID=areaID,center=center,total=total,coordsReadable=coordsReadable,assetResolved=assetResolved,types=typeRows,matches=roughMatches}
end
local function compactMeta(meta)
local parts={}
for _,field in ipairs(BUILDING_META_FIELDS) do
local v=meta[field]
if v and v~="" then parts[#parts+1]=field.."="..v end
if #parts>=8 then break end
end
return table.concat(parts,";")
end
local CALIBRATION_THRESHOLDS = {10,13,15,18,20,22,24,25,30,40,60}
local function logAreaScan(scan,target)
local nearest=scan.matches[1] and scan.matches[1].distance or nil
log("AREA CALIBRATION SUMMARY | areaID="..scan.areaID
.." | totalBuildings="..tostring(scan.total)
.." | uniqueGUIDs="..tostring(#scan.types)
.." | coordsReadable="..tostring(scan.coordsReadable)
.." | selectedX="..tostring(scan.center.x)
.." | selectedZ="..tostring(scan.center.z)
.." | target="..target
.." | matchedObjects="..tostring(#scan.matches)
.." | nearestCenterDistance="..tostring(nearest))
local parts={}
for _,threshold in ipairs(CALIBRATION_THRESHOLDS) do
local count=0
for _,m in ipairs(scan.matches) do
if m.distance ~= nil and m.distance <= threshold then count=count+1 end
end
parts[#parts+1]="d<="..tostring(threshold)..":"..tostring(count)
end
log("DISTANCE LADDER | target="..target.." | "..table.concat(parts," | "))
local mlimit=math.min(#scan.matches,12)
for i=1,mlimit do
local m=scan.matches[i]
log("TARGET MATCH | rank="..tostring(i)
.." | id="..m.id.." | guid="..tostring(m.guid).." | name="..m.name
.." | centerDistance="..tostring(m.distance))
end
for _,g in ipairs(scan.types) do
if g.minDistance ~= nil and g.minDistance <= 30 then
log("NEARBY TYPE <=30 | guid="..tostring(g.guid)
.." | name="..g.name.." | count="..tostring(g.count)
.." | minDistance="..tostring(g.minDistance)
.." | maxDistance="..tostring(g.maxDistance))
end
end
end
local function countMatchesWithin(scan, radius)
local count=0
for _,m in ipairs(scan.matches) do
if m.distance ~= nil and m.distance <= radius then count=count+1 end
end
return count
end
local function catalogCandidatePredictions(picker, selected)
local hostRadius,radiusSource=Diagnostic:HostEffectRadius(selected)
log("========== RAW-TARGET HOST-RADIUS PREDICTION CATALOG START | radiusPosition2D="..tostring(hostRadius).." | radiusSource="..tostring(radiusSource).." | count="..tostring(picker.count).." ==========")
local limit=math.min(picker.count,240)
local known={ [51551]="KNOWN_GREEN_PIG", [51466]="KNOWN_NO_GREEN_MEDICI", [51555]="KNOWN_NO_GREEN_TANNERY" }
local relevantCount=0
local mappedCount=0
local predictedTrue={}
local results={}
for i=0,limit-1 do
local row=arrayElement(picker.array,i)
local guid=itemGuid(row)
local asset=itemAsset(guid)
local name=text(asset and (read(asset,"Text") or read(asset,"Name")) or "")
local target=text(asset and (read(asset,"ItemOrBuffEffectTargetsFormatted") or read(asset,"FormattedTarget") or read(asset,"Target")) or "")
local rawList,rawSet=targetSetForGuid(guid)
local mapped=#rawList>0
if mapped then mappedCount=mappedCount+1 end
local scan=scanAreaBuildings(selected,target,rawSet)
local within=countMatchesWithin(scan,hostRadius)
local nearest=scan.matches[1] and scan.matches[1].distance or nil
local predicted=mapped and within>0 or false
if predicted then
relevantCount=relevantCount+1
predictedTrue[#predictedTrue+1]=name.." ["..tostring(guid).."]="..tostring(within)
end
results[#results+1]={index=i,row=row,guid=guid,name=name,target=target,mapped=mapped,within=within,predictedRelevant=predicted}
log("PREDICT RAW CANDIDATE | index="..tostring(i)
.." | guid="..tostring(guid)
.." | name="..name
.." | formattedTarget="..target
.." | rawTargetGuids="..joinNumbers(rawList)
.." | rawMatchesOnIsland="..tostring(#scan.matches)
.." | nearestRawTargetDistance="..tostring(nearest)
.." | withinHostRadius="..tostring(within)
.." | hostRadius="..tostring(hostRadius)
.." | predictedRelevant="..tostring(predicted)
.." | mapped="..tostring(mapped)
.." | calibration="..tostring(known[guid] or ""))
end
log("RAW PREDICTION SUMMARY | radiusPosition2D="..tostring(hostRadius).." | radiusSource="..tostring(radiusSource)
.." | candidates="..tostring(limit)
.." | mappedCandidates="..tostring(mappedCount)
.." | predictedRelevant="..tostring(relevantCount)
.." | predictedHidden="..tostring(mappedCount-relevantCount)
.." | unmappedKeptVisible="..tostring(limit-mappedCount))
log("RAW PREDICTED TRUE | "..table.concat(predictedTrue," | "))
log("RADIUS RULE | use selected host EffectSource RadiusDistance from authoritative assets.xml fallback table; Guest House/Officium=24, Governor Villa=36; old radius-12 calibration retired")
log("IMPORTANT CORRECTION | GUID 106397 Ductuarius raw targets=19691;29524; formatted label Aqueduct Cisterns must NOT be matched to building GUID 19753 by text")
log("========== RAW-TARGET HOST-RADIUS PREDICTION CATALOG END ==========")
return results,relevantCount,mappedCount
end
local function logUnmappedTargetCatalog(selected, results)
log("========== UNMAPPED TARGET CATALOG START ==========")
local unmapped={}
for _,r in ipairs(results or {}) do
if not r.mapped then unmapped[#unmapped+1]=r end
end
log("UNMAPPED TARGET SUMMARY | count="..tostring(#unmapped).." | purpose=resolve raw building GUID mappings without guessing from English labels")
for _,r in ipairs(unmapped) do
local asset=itemAsset(r.guid)
log("UNMAPPED SPECIALIST | index="..tostring(r.index)
.." | guid="..tostring(r.guid)
.." | name="..tostring(r.name)
.." | formattedTarget="..tostring(r.target)
.." | currentMapping=NONE")
probeTargetData("UNMAPPED CandidateAsset "..tostring(r.guid).." "..tostring(r.name), asset)
end
local scan=scanAreaBuildings(selected,"",{})
log("ISLAND BUILDING GUID CATALOG SUMMARY | areaID="..tostring(scan.areaID)
.." | totalBuildings="..tostring(scan.total)
.." | uniqueBuildingGUIDs="..tostring(#scan.types)
.." | coordsReadable="..tostring(scan.coordsReadable)
.." | assetResolved="..tostring(scan.assetResolved)
.." | selectedX="..tostring(scan.center.x)
.." | selectedZ="..tostring(scan.center.z))
for _,g in ipairs(scan.types or {}) do
log("ISLAND BUILDING GUID | guid="..tostring(g.guid)
.." | name="..tostring(g.name)
.." | count="..tostring(g.count)
.." | minDistance="..tostring(g.minDistance)
.." | maxDistance="..tostring(g.maxDistance)
.." | assetSource="..tostring(g.assetSource)
.." | meta="..compactMeta(g.meta or {}))
end
log("UNMAPPED TARGET CATALOG INSTRUCTION | compare each UNMAPPED SPECIALIST formattedTarget/target-data with ISLAND BUILDING GUID rows; green-frame visual can be used only as confirmation, not as the primary GUID source")
log("========== UNMAPPED TARGET CATALOG END ==========")
end

local function safeWrite(object,key,value)
if object==nil then return false,"no-object",nil end
local ok,err=pcall(function() object[key]=value end)
local after=read(object,key)
return ok and after==value, ok and "" or text(err), after
end
local function logArrayHelperMethods(arrayValue)
local helperKey=string.match(text(arrayValue),"^(PhoenixArray<[^>]+>)") or ""
local haloRoot=rawget(_G,"halo")
local helper=helperKey~="" and type(haloRoot)=="table" and haloRoot[helperKey] or nil
local methods={}
if type(helper)=="table" then
for k,v in pairs(helper) do
if type(v)=="function" then methods[#methods+1]=tostring(k) end
end
table.sort(methods)
end
log("CANDIDATE ARRAY HELPER | key="..helperKey.." | methodCount="..tostring(#methods).." | methods="..table.concat(methods,";"))
end
local function logFixedObject(label,object,fields)
if object==nil then
log("UI HOOK | label="..label.." | value=nil")
return
end
local parts={}
for _,field in ipairs(fields) do
local v=read(object,field)
if v~=nil and type(v)~="function" then parts[#parts+1]=field.."="..text(v) end
end
log("UI HOOK | label="..label.." | type="..type(object).." | value="..text(object).." | fields="..table.concat(parts,";"))
end
local function probePopupFilterHooks(picker)
logArrayHelperMethods(picker.array)
local popup=picker.popup
local filter=read(popup,"Filter")
local filter02=read(popup,"Filter02")
local search=read(popup,"SearchInput")
logFixedObject("Popup.Filter",filter,{"SelectedFilterIndex","SelectedFilterText","Array"})
logFixedObject("Popup.Filter02",filter02,{"SelectedFilterIndex","SelectedFilterText","Array"})
logFixedObject("Popup.SearchInput",search,{"SearchInput","InfoTip"})
local searchInner=search and read(search,"SearchInput") or nil
logFixedObject("Popup.SearchInput.SearchInput",searchInner,{"Text","Value","InputText","PlaceholderText","IsEnabled","IsFocused","IsLocked","IsSelected"})
local fArray=filter and read(filter,"Array") or nil
local f2Array=filter02 and read(filter02,"Array") or nil
logArrayHelperMethods(fArray)
logArrayHelperMethods(f2Array)
end
local function setRowDisabledVisual(row, disabled)
if row==nil then return false,"no-row",nil end
local before=read(row,"AppearDisabled")
local ok,err,after=safeWrite(row,"AppearDisabled",disabled)
return ok,err,after,before
end
local function applyRelevantButtonPreview(picker,selected,results)
local state={
selectedObjectID=text(read(selected,"ID")),
disabledGuids={},
changed=0,
writable=0,
irrelevantMapped=0,
unmapped=0,
visualWrites=0,
}
for _,r in ipairs(results) do
local interaction=r.row and read(r.row,"Interaction") or nil
local before=interaction and read(interaction,"IsEnabled") or nil
if not r.mapped then
state.unmapped=state.unmapped+1
elseif not r.predictedRelevant then
state.irrelevantMapped=state.irrelevantMapped+1
if type(before)=="boolean" then state.writable=state.writable+1 end
local ok,err,after=false,"no-interaction",nil
if interaction then ok,err,after=safeWrite(interaction,"IsEnabled",false) end
local vok,verr,vafter,vbefore=setRowDisabledVisual(r.row,true)
if vok then state.visualWrites=state.visualWrites+1 end
if ok or after==false then
state.changed=state.changed+1
state.disabledGuids[#state.disabledGuids+1]={guid=r.guid,index=r.index,name=r.name}
end
log("UI DISABLE ROW | index="..tostring(r.index).." | guid="..tostring(r.guid).." | name="..r.name
.." | beforeType="..type(before).." | before="..text(before).." | requested=false | success="..tostring(ok).." | after="..text(after).." | error="..err
.." | appearBefore="..text(vbefore).." | appearRequested=true | appearSuccess="..tostring(vok).." | appearAfter="..text(vafter).." | appearError="..tostring(verr))
end
end
log("UI FILTER PREVIEW APPLIED | mappedIrrelevant="..tostring(state.irrelevantMapped)
.." | rowsWithBooleanIsEnabled="..tostring(state.writable)
.." | rowsChangedToDisabled="..tostring(state.changed)
.." | visualDisabledWrites="..tostring(state.visualWrites)
.." | restoreGuidCount="..tostring(#state.disabledGuids)
.." | unmappedKeptUntouched="..tostring(state.unmapped)
.." | behavior=predicted relevant rows remain normal; mapped irrelevant rows get Interaction.IsEnabled=false AND AppearDisabled=true")
return state
end
local function reapplyRelevantButtonPreview(picker,state,reason,quiet)
local attempted,found,written,verifiedFalse,visualWritten,visualTrue=0,0,0,0,0,0
for _,entry in ipairs(state and state.disabledGuids or {}) do
attempted=attempted+1
local currentIndex,row=candidateByGuid(picker,entry.guid)
local interaction=row and read(row,"Interaction") or nil
if row then
found=found+1
if interaction then
local ok,err,after=safeWrite(interaction,"IsEnabled",false)
if ok then written=written+1 end
if after==false then verifiedFalse=verifiedFalse+1 end
end
local vok,verr,vafter=setRowDisabledVisual(row,true)
if vok then visualWritten=visualWritten+1 end
if vafter==true then visualTrue=visualTrue+1 end
end
end
if not quiet then
log("UI FILTER PREVIEW REAPPLIED | reason="..tostring(reason)
.." | attempted="..tostring(attempted)
.." | foundCurrentRows="..tostring(found)
.." | interactionWrites="..tostring(written)
.." | afterFalse="..tostring(verifiedFalse)
.." | visualWrites="..tostring(visualWritten)
.." | appearDisabledTrue="..tostring(visualTrue)
.." | behavior=disabled state follows specialist GUIDs and forces visual disabled state after Anno rebuild/reorder")
end
return found,written
end
local function restoreRelevantButtonPreview(picker,state)
local attempted,found,writeOk,verifiedTrue,visualReset=0,0,0,0,0
for _,entry in ipairs(state and state.disabledGuids or {}) do
attempted=attempted+1
local currentIndex,row=candidateByGuid(picker,entry.guid)
local interaction=row and read(row,"Interaction") or nil
local before=interaction and read(interaction,"IsEnabled") or nil
if row then
found=found+1
local ok,err,after=false,"no-interaction",nil
if interaction then ok,err,after=safeWrite(interaction,"IsEnabled",true) end
if ok then writeOk=writeOk+1 end
if after==true then verifiedTrue=verifiedTrue+1 end
local vok,verr,vafter,vbefore=setRowDisabledVisual(row,false)
if vok then visualReset=visualReset+1 end
log("UI FORCE RESTORE ROW | oldIndex="..tostring(entry.index).." | currentIndex="..tostring(currentIndex)
.." | guid="..tostring(entry.guid).." | name="..entry.name
.." | beforeType="..type(before).." | before="..text(before)
.." | requested=true | success="..tostring(ok).." | after="..text(after).." | error="..err
.." | appearBefore="..text(vbefore).." | appearRequested=false | appearSuccess="..tostring(vok).." | appearAfter="..text(vafter).." | appearError="..tostring(verr))
else
log("UI FORCE RESTORE ROW | oldIndex="..tostring(entry.index).." | currentIndex="..tostring(currentIndex)
.." | guid="..tostring(entry.guid).." | name="..entry.name
.." | success=false | reason=current rebuilt row not found")
end
end
log("UI FILTER PREVIEW FORCE-RESTORED | attempted="..tostring(attempted)
.." | foundCurrentRows="..tostring(found)
.." | interactionWriteVerified="..tostring(writeOk)
.." | afterTrue="..tostring(verifiedTrue)
.." | visualResetWrites="..tostring(visualReset)
.." | note=restore targets current rebuilt rows by specialist GUID and clears AppearDisabled")
return found,writeOk
end
local function resetAllCurrentCandidateRows(picker)
local count=0
local interactionTrue=0
local visualFalse=0
local limit=math.min(picker and picker.count or 0,240)
for i=0,limit-1 do
local row=arrayElement(picker.array,i)
if row then
count=count+1
local interaction=read(row,"Interaction")
if interaction then
local ok,err,after=safeWrite(interaction,"IsEnabled",true)
if ok or after==true then interactionTrue=interactionTrue+1 end
end
local vok,verr,vafter=setRowDisabledVisual(row,false)
if vok or vafter==false then visualFalse=visualFalse+1 end
end
end
log("DYNAMIC FILTER BASELINE RESET | currentRows="..tostring(count)
.." | interactionEnabled="..tostring(interactionTrue)
.." | visualDisabledCleared="..tostring(visualFalse)
.." | reason=clear reused row visuals before recalculating changed candidate membership")
end
local function rebuildFilterForCurrentCandidates(picker,selected,oldState,reason)
local oldSig=oldState and oldState.lastCandidateSignature or ""
local newSig=candidateSignature(picker)
log("DYNAMIC FILTER RECALCULATE | reason="..tostring(reason)
.." | oldCandidateSignature="..oldSig
.." | newCandidateSignature="..newSig
.." | action=enable/clear current row widgets, recalculate current candidates, then disable current irrelevant GUIDs")
resetAllCurrentCandidateRows(picker)
local results,relevantCount,mappedCount=catalogCandidatePredictions(picker,selected)
local newState=applyRelevantButtonPreview(picker,selected,results)
newState.relevantCount=relevantCount
newState.mappedCount=mappedCount
newState.pickerLabel=picker.label
newState.lastArrayKey=text(picker.array)
newState.lastCandidateSignature=candidateSignature(picker)
newState.settleReapplyTicks=8
return newState
end
local function captureSnapshot(label, includeCatalog)
local picker=activePicker()
if not picker then
log("CAPTURE REFUSED | reason=no non-empty specialist SELECTION popup detected | action=click a specialist slot, hover a candidate, then press Ctrl+Alt+I")
return nil
end
local selected=currentSelectedObject()
local selectedID=text(selected and read(selected,"ID") or "")
if selectedID=="" or selectedID=="0" or selectedID=="nil" then
log("CAPTURE REFUSED | reason=no selected Guest House/Officium/Villa")
return nil
end
local guid=infoTipGuid()
local candidateIndex,row=candidateByGuid(picker,guid)
if guid<=0 or candidateIndex<0 then
log("CAPTURE REFUSED | reason=hovered specialist not identified in candidate list | infoTipGuid="..tostring(guid).." | itemCount="..tostring(picker.count))
return nil
end
local asset=itemAsset(guid)
local name=text(asset and (read(asset,"Text") or read(asset,"Name")) or "")
local target=text(asset and (read(asset,"ItemOrBuffEffectTargetsFormatted") or read(asset,"FormattedTarget") or read(asset,"Target")) or "")
local niche=text(asset and (read(asset,"ItemNicheText") or read(asset,"ItemNiche")) or "")
probeTargetData("CandidateAsset", asset)
log("SNAPSHOT "..label.." CAPTURED | picker="..picker.label
.." | candidateGuid="..tostring(guid).." | candidateIndex="..tostring(candidateIndex)
.." | candidateName="..name.." | formattedTarget="..target.." | niche="..niche
.." | itemCount="..tostring(picker.count).." | selectedObjectID="..selectedID
.." | selectedObjectGUID="..text(read(selected,"GUID") or read(selected,"Guid"))
.." | areaID="..objectAreaID(selected))
probeRadiusSource("SelectedObject",selected)
probeRadiusSource("SelectedObject.Building",read(selected,"Building"))
probeRadiusSource("SelectedObject.Buffable",read(selected,"Buffable"))
probeRadiusSource("SelectedObject.ItemContainer",read(selected,"ItemContainer"))
probeRadiusSource("Picker.Data",picker.data)
probeRadiusSource("Picker.Popup",picker.popup)
probeRadiusSource("CandidateAsset",asset)
local buildingAsset,buildingAssetSource=tryBuildingAsset(normalizeGuid(read(selected,"GUID") or read(selected,"Guid")))
if buildingAsset then
log("SELECTED BUILDING ASSET | source="..buildingAssetSource.." | meta="..compactMeta(buildingMeta(buildingAsset)))
probeRadiusSource("SelectedBuildingAsset",buildingAsset)
else
log("SELECTED BUILDING ASSET | source="..buildingAssetSource.." | unresolved=true")
end
local rawList,rawSet=targetSetForGuid(guid)
local scan=scanAreaBuildings(selected,target,rawSet)
logAreaScan(scan,target)
return {label=label,selectedObjectID=selectedID,candidateGuid=guid,candidateIndex=candidateIndex,name=name,target=target,niche=niche,scan=scan}
end
local function diffSnapshots(a,b)
log("========== RADIUS CALIBRATION A/B SUMMARY ==========")
log("A/B CONTEXT | sameBuilding="..tostring(a.selectedObjectID==b.selectedObjectID)
.." | A.guid="..tostring(a.candidateGuid).." | A.name="..a.name.." | A.target="..a.target.." | A.roughMatches="..tostring(#a.scan.matches)
.." | B.guid="..tostring(b.candidateGuid).." | B.name="..b.name.." | B.target="..b.target.." | B.roughMatches="..tostring(#b.scan.matches))
local aNearest=a.scan.matches[1] and a.scan.matches[1].distance or nil
local bNearest=b.scan.matches[1] and b.scan.matches[1].distance or nil
log("CALIBRATION BOUNDS | A.nearestCenterDistance="..tostring(aNearest)
.." | B.nearestCenterDistance="..tostring(bNearest)
.." | interpretation=if A visually has green frames and B does not, effective center-distance threshold lies between these values; exact production rule still requires footprint/category validation")
if a.scan.center.x~=nil and b.scan.center.x~=nil then
log("POSITION CHECK | A.source="..a.scan.center.source.." | B.source="..b.scan.center.source
.." | sameX="..tostring(a.scan.center.x==b.scan.center.x).." | sameZ="..tostring(a.scan.center.z==b.scan.center.z))
end
log("========== RADIUS CALIBRATION A/B SUMMARY END ==========")
end
function Diagnostic:Load()
self._filterState=nil
self._pickerWasOpen=false
self._lastSelectedObjectID=""
log("Load completed | shortcut=Ctrl+Alt+I UNIFIED | target=UI-only Relevant Here disable filter with GUID-following row maintenance and true popup-session reset via ItemSelectionPopupData.IsVisible | first press disables mapped irrelevant candidate buttons; Anno rebuild/reorder is re-disabled by GUID while this same picker stays open; second press force-enables rows; closing the picker automatically restores those rows and clears filter state so the next specialist selection starts Show All | v0.1.26: release candidate using complete assets.xml-derived target mapping and host-specific radius fix (Guest House/Officium 24, Governor Villa 36) while retaining complete specialist target GUID mapping | 356 radius specialists mapped | no text guessing | no reflection | no renderer probing | no hover forcing | no selection/equip/inventory mutation")
end
function Diagnostic:IsPickerOpen()
return activePicker()~=nil
end
function Diagnostic:Capture()
log("SHORTCUT REACHED | key=Ctrl+Alt+I | build=0.1.26-release-candidate")
local picker=activePicker()
if not picker then
if self._filterState then
local stale=anyPicker(self._filterState.pickerLabel)
if stale and stale.count>0 then
log("MANUAL RESET WHILE PICKER CLOSED | restoreGuidCount="..tostring(#(self._filterState.disabledGuids or {})).." | strategy=force-enable stale/current rows before clearing state")
restoreRelevantButtonPreview(stale,self._filterState)
end
self._filterState=nil
self._pickerWasOpen=false
log("MANUAL RESET COMPLETE | mode=Show All on next picker open")
return true
end
log("CAPTURE REFUSED | reason=no visible specialist SELECTION popup detected | action=click a specialist slot, then press Ctrl+Alt+I")
return false
end
local selected=currentSelectedObject()
local selectedID=text(selected and read(selected,"ID") or "")
if selectedID=="" or selectedID=="0" or selectedID=="nil" then
log("CAPTURE REFUSED | reason=no selected Guest House/Officium/Villa")
return false
end
if self._filterState then
log("RESTORE REQUEST | selectedObjectID="..selectedID
.." | pickerVisible="..tostring(picker.isVisible)
.." | currentArray="..text(picker.array)
.." | restoreGuidCount="..tostring(#(self._filterState.disabledGuids or {}))
.." | strategy=force-write IsEnabled=true on current rows by specialist GUID")
restoreRelevantButtonPreview(picker,self._filterState)
self._filterState=nil
self._pickerWasOpen=true
self._lastSelectedObjectID=selectedID
return true
end
local hoverGuid=infoTipGuid()
local hoverIndex,_=candidateByGuid(picker,hoverGuid)
log("FILTER SNAPSHOT | picker="..picker.label
.." | pickerVisible="..tostring(picker.isVisible)
.." | itemCount="..tostring(picker.count)
.." | hoveredGuid="..tostring(hoverGuid)
.." | hoveredIndex="..tostring(hoverIndex)
.." | selectedObjectID="..selectedID
.." | selectedObjectGUID="..text(read(selected,"GUID") or read(selected,"Guid"))
.." | areaID="..objectAreaID(selected)
.." | selectedX="..tostring(objectCoords(selected).x)
.." | selectedZ="..tostring(objectCoords(selected).z)
.." | radiusPosition2D="..tostring((Diagnostic:HostEffectRadius(selected))) )
probePopupFilterHooks(picker)
local results,relevantCount,mappedCount=catalogCandidatePredictions(picker,selected)
self._filterState=applyRelevantButtonPreview(picker,selected,results)
self._filterState.relevantCount=relevantCount
self._filterState.mappedCount=mappedCount
self._filterState.pickerLabel=picker.label
self._filterState.lastArrayKey=text(picker.array)
self._filterState.lastCandidateSignature=candidateSignature(picker)
self._pickerWasOpen=true
self._lastSelectedObjectID=selectedID
return true
end
function Diagnostic:Tick()
local picker=activePicker()
if not picker then
if self._filterState then
local stale=anyPicker(self._filterState.pickerLabel)
log("PICKER CLOSED DETECTED | source=ItemSelectionPopupData.IsVisible | restoreGuidCount="..tostring(#(self._filterState.disabledGuids or {}))
.." | staleCount="..tostring(stale and stale.count or 0)
.." | action=force-enable filtered GUIDs and clear state so next picker starts Show All")
if stale and stale.count>0 then
restoreRelevantButtonPreview(stale,self._filterState)
end
self._filterState=nil
log("PICKER SESSION RESET COMPLETE | next specialist picker opens unfiltered")
end
self._pickerWasOpen=false
self._lastSelectedObjectID=""
return
end
self._pickerWasOpen=true
local selected=currentSelectedObject()
local selectedID=text(selected and read(selected,"ID") or "")
if self._filterState then
if self._filterState.selectedObjectID ~= "" and selectedID ~= "" and selectedID ~= self._filterState.selectedObjectID then
log("FILTER OBJECT CHANGED | oldObjectID="..self._filterState.selectedObjectID.." | newObjectID="..selectedID.." | action=restore and clear old filter")
restoreRelevantButtonPreview(picker,self._filterState)
self._filterState=nil
self._lastSelectedObjectID=selectedID
return
end
local arrayKey=text(picker.array)
local sig=candidateSignature(picker)
if sig ~= (self._filterState.lastCandidateSignature or "") then
if not self._filterState.pendingRecalcTicks then
self._filterState.pendingRecalcTicks=2
self._filterState.pendingRecalcSignature=sig
log("CANDIDATE MEMBERSHIP CHANGE DETECTED | oldSignature="..tostring(self._filterState.lastCandidateSignature or "")
.." | observedSignature="..sig
.." | recalculateAfterTicks=2")
else
self._filterState.pendingRecalcSignature=sig
end
end
if self._filterState.pendingRecalcTicks then
self._filterState.pendingRecalcTicks=self._filterState.pendingRecalcTicks-1
if self._filterState.pendingRecalcTicks<=0 then
local oldState=self._filterState
self._filterState=rebuildFilterForCurrentCandidates(picker,selected,oldState,"candidate-membership-or-order-changed")
arrayKey=text(picker.array)
sig=candidateSignature(picker)
end
elseif arrayKey ~= (self._filterState.lastArrayKey or "") then
reapplyRelevantButtonPreview(picker,self._filterState,"array-rebuilt")
self._filterState.lastArrayKey=arrayKey
end
if self._filterState and (self._filterState.settleReapplyTicks or 0)>0 then
reapplyRelevantButtonPreview(picker,self._filterState,"post-recalc-settle",true)
self._filterState.settleReapplyTicks=self._filterState.settleReapplyTicks-1
if self._filterState.settleReapplyTicks==0 then
log("DYNAMIC FILTER SETTLE COMPLETE | disabledGuidCount="..tostring(#(self._filterState.disabledGuids or {}))
.." | currentSignature="..candidateSignature(picker))
end
end
end
self._lastSelectedObjectID=selectedID
end
RelevantSpecialistsEmbedded = Diagnostic
end
RelevantSpecialistsDiag028=RelevantSpecialistsEmbedded

-- v0.5.63 unified primary shortcut:
-- Ctrl+Alt+I is the ONLY user shortcut.
-- If a specialist selection popup is actually visible, it toggles Relevant Specialists.
-- Otherwise it opens Specialist Management.
local _SMFinderOpen=SpecialistFinder.Open
function SpecialistFinder:Open()
local pickerOpen=false
if RelevantSpecialistsEmbedded
and type(RelevantSpecialistsEmbedded.IsPickerOpen)=="function" then
pickerOpen=RelevantSpecialistsEmbedded:IsPickerOpen()==true
end
if pickerOpen then
system.log("[Specialist Management 1.0.0] Ctrl+Alt+I | visible picker -> Relevant Specialists")
return RelevantSpecialistsEmbedded:Capture()
end
system.log("[Specialist Management 1.0.0] Ctrl+Alt+I | no visible picker -> Specialist Management menu")
self:ClearWarehouseSearch("Ctrl+Alt+I start / protect full specialist scan")
return _SMFinderOpen(self)
end

local _SMFinderLoad=SpecialistFinder.Load
function SpecialistFinder:Load()
RelevantSpecialistsEmbedded:Load()
_SMFinderLoad(self)
system.log("[Specialist Management 1.0.0] Load COMPLETE | release | Ctrl+Alt+I unified only | Selector v0.1.26 + Finder v0.14.13")
end

local _SMFinderTick=SpecialistFinder.Tick
function SpecialistFinder:Tick()
RelevantSpecialistsEmbedded:Tick()
_SMFinderTick(self)
end

return SpecialistFinder
