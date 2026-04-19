-- Agrega el Compass Watch al loot de los lugares donde aparecen relojes y
-- contenedores militares (tematica del mod: experimentos militares).
-- Se engancha a OnPreDistributionMerge, que corre antes de que el server
-- materialice la tabla de loot — cualquier push aca se propaga a todos los
-- contenedores de esas categorias.

require "Items/ProceduralDistributions"

local function addCompassWatchLoot()
    local PD = ProceduralDistributions and ProceduralDistributions.list
    if not PD then return end

    -- Categorias civiles (mesas de luz, roperos, tiendas, oficinas).
    -- OJO: las keys son case-sensitive y varian; los nombres abajo estan
    -- verificados contra PZ Build 42 (media/lua/server/Items/ProceduralDistributions.lua).
    local nonMilitary = {
        "BedroomSidetable",
        "BedroomSidetableClassy",
        "BedroomDresser",
        "LivingRoomSideTable",
        "LivingRoomSideTableClassy",
        "ShelfGeneric",
        "OfficeDrawers",
    }
    -- Categorias militares (encaja con la tematica: dog tags + compass watch).
    -- Peso mas alto porque el tema del mod es militar.
    local military = {
        "ArmyStorageElectronics",
        "ArmyStorageOutfit",
        "ArmySurplusMisc",
        "ArmySurplusCases",
    }

    local ENTRIES = {
        "EchoesOfKnox.CompassWatch_Right",
        "EchoesOfKnox.CompassWatch_Left",
    }

    local function inject(keys, weight)
        for _, key in ipairs(keys) do
            local tbl = PD[key]
            if tbl and tbl.items then
                for _, entry in ipairs(ENTRIES) do
                    table.insert(tbl.items, entry)
                    table.insert(tbl.items, weight)
                end
            end
        end
    end

    -- Peso 2 por variante = peso 4 combinado en civil (similar al WristWatch comun).
    inject(nonMilitary, 2)
    -- Peso 4 por variante = peso 8 combinado en zonas militares.
    inject(military, 4)
end

Events.OnPreDistributionMerge.Add(addCompassWatchLoot)

-- ============================================================================
-- Journal loot: 70 diarios (10 por sujeto x 7 sujetos) distribuidos 70%
-- en zonas tematicas del personaje + 30% en zonas genericas (casas, autos,
-- oficinas). Las keys se verifican contra PZ B42; las invalidas se saltean
-- silenciosamente por el guard 'if tbl and tbl.items then'.
-- ============================================================================

local function addDiariesLoot()
    local PD = ProceduralDistributions and ProceduralDistributions.list
    if not PD then return end

    -- Categorias tematicas por sujeto — SOLO 3 categorias mas representativas
    -- (no 7 como en v0.3 que saturaba la mesa de luz de una casa cualquiera).
    local THEMATIC = {
        -- Subject 01: Elliot Hargreaves, Physician
        [1] = { "MedicalClinicDrawer", "MedicalClinicShelves", "BathroomCounter" },
        -- Subject 02: Claire Vance, RN (tambien panaderia porque vive arriba)
        [2] = { "MedicalClinicDrawer", "BakeryCounter", "KitchenCounter" },
        -- Subject 03: Marcus Delaney, Store Clerk
        [3] = { "StoreCounter", "ConvenienceStoreCounter", "GasStoreCounter" },
        -- Subject 04: Tobias Cross, Priest
        [4] = { "ChurchOffice", "PrisonOffice", "BedroomDresser" },
        -- Subject 05: Rhett Malone, Mechanic
        [5] = { "GarageMechanic", "MechanicalTools", "ToolStoreTools" },
        -- Subject 06: Daniel Orozco, PE Teacher
        [6] = { "SchoolLocker", "GymLockers", "SportsStoreSports" },
        -- Subject 07: Isaac Volkov, Biologist/Farmer
        [7] = { "FarmStorage", "FarmhouseKitchen", "BarnCrate" },
    }

    -- Categorias genericas: cada entrada cae en UNA sola (rotada), no en 7.
    -- Asi cada categoria generica recibe ~10 entradas totales (70/7), no 70.
    local GENERIC = {
        "BedroomSidetable", "BedroomDresser",
        "LivingRoomSideTable", "OfficeDrawers",
        "ShelfGeneric", "BedroomSidetableClassy",
        "LivingRoomSideTableClassy",
    }

    -- Weight uniforme en 1 para mantener el loot raro pero hallable.
    -- Con 10 entradas tematicas × 1 = 10 weight, en un contenedor con
    -- pool vanilla de ~150-250 weight da ~4-7% chance por roll. Target.
    local WEIGHT = 1

    local function injectEntry(key, fulltype, weight)
        local tbl = PD[key]
        if tbl and tbl.items then
            table.insert(tbl.items, fulltype)
            table.insert(tbl.items, weight)
        end
    end

    for subjectID = 1, 7 do
        local thematicKeys = THEMATIC[subjectID] or {}
        for entryN = 1, 10 do
            local fulltype = string.format(
                "EchoesOfKnox.Journal_Subject%02d_%02d", subjectID, entryN)
            -- Tematicas: las 3 categorias del sujeto.
            for _, key in ipairs(thematicKeys) do
                injectEntry(key, fulltype, WEIGHT)
            end
            -- Generica: una sola, rotada (determinstica por subject/entry).
            local idx = ((subjectID - 1) * 10 + (entryN - 1)) % #GENERIC + 1
            injectEntry(GENERIC[idx], fulltype, WEIGHT)
        end
    end
end

Events.OnPreDistributionMerge.Add(addDiariesLoot)
