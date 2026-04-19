-- Subject Bosses: cuando el jugador se acerca a la posicion de una dog tag,
-- en vez de spawnear la placa en el suelo, spawneamos un zombie boss que
-- representa al sujeto correspondiente. El boss lleva la dog tag en su
-- inventario y la dropea al morir.
--
-- Stats del boss:
--   - 2x HP (via param de addZombiesInOutfit)
--   - Sprinter forzado por-zombie (ignora sandbox global)
--   - Outfit de la profesion civil del sujeto
--   - ModData.EOK_SubjectID para identificarlo
--   - Dog tag en su inventario → cae al morir, el Pickup.lua existente la
--     detecta cuando el jugador lootea el cadaver.

Echoes = Echoes or {}
Echoes.Bosses = Echoes.Bosses or {}

-- Mapeo de sujeto → outfit nativo de PZ B42 (verificado en clothing.xml).
-- Nombres sin prefijo "Outfit_" (asi los espera addZombiesInOutfit).
local SUBJECT_OUTFITS = {
    [1] = "Doctor",              -- Elliot James Hargreaves (Physician)
    [2] = "Nurse",               -- Claire Elizabeth Vance (RN)
    [3] = "GigaMart_Employee",   -- Marcus Raymond Delaney (Store Clerk)
    [4] = "Priest",              -- Tobias Matthew Cross (Catholic Priest)
    [5] = "Mechanic",            -- Rhett Alan Malone (Auto Mechanic)
    [6] = "FitnessInstructor",   -- Daniel Antonio Orozco (P.E. Teacher)
    [7] = "MadScientist",        -- Isaac Mikhail Volkov (Biologist)
}

-- Genero narrativo del sujeto: 0 = male, 100 = female (es porcentaje).
local SUBJECT_FEMALE_CHANCE = {
    [1] = 0,    -- Elliot: M
    [2] = 100,  -- Claire: F
    [3] = 0,    -- Marcus: M
    [4] = 0,    -- Tobias: M
    [5] = 0,    -- Rhett: M
    [6] = 0,    -- Daniel: M
    [7] = 0,    -- Isaac: M
}

local BOSS_HEALTH_MULT = 2.0
local SPAWN_SEARCH_RADIUS = 5   -- tiles para buscar tile walkable
local DETECT_SCAN_RADIUS  = 3   -- tiles para encontrar el zombie post-spawn

-- Busca una tile walkable cerca de (tx, ty, tz). Devuelve IsoGridSquare o nil.
local function findWalkableNear(cell, tx, ty, tz)
    local target = cell:getGridSquare(tx, ty, tz)
    if target and target:isFree(false) then
        return target
    end
    for r = 1, SPAWN_SEARCH_RADIUS do
        for dx = -r, r do
            for dy = -r, r do
                local sq = cell:getGridSquare(tx + dx, ty + dy, tz)
                if sq and sq:isFree(false) then
                    return sq
                end
            end
        end
    end
    return target  -- fallback (puede estar bloqueado, PZ se las arregla)
end

-- Snapshot: set de todos los MovingObject actualmente presentes en un area.
-- Se usa antes del spawn para identificar cual zombie es el nuevo.
local function snapshotMovingObjects(cell, cx, cy, cz, radius)
    local set = {}
    for dx = -radius, radius do
        for dy = -radius, radius do
            local sq = cell:getGridSquare(cx + dx, cy + dy, cz)
            if sq then
                local objs = sq:getMovingObjects()
                if objs then
                    for i = 0, objs:size() - 1 do
                        local o = objs:get(i)
                        if o then set[o] = true end
                    end
                end
            end
        end
    end
    return set
end

-- Escanea el area buscando el zombie recien spawneado (no estaba en `before`).
local function findNewZombieNear(cell, cx, cy, cz, radius, before)
    for dx = -radius, radius do
        for dy = -radius, radius do
            local sq = cell:getGridSquare(cx + dx, cy + dy, cz)
            if sq then
                local objs = sq:getMovingObjects()
                if objs then
                    for i = 0, objs:size() - 1 do
                        local o = objs:get(i)
                        if o and not before[o] then
                            local ok, isZ = pcall(function()
                                return instanceof(o, "IsoZombie")
                            end)
                            if ok and isZ then return o end
                        end
                    end
                end
            end
        end
    end
    return nil
end

-- Spawnea un boss en la coord dada. Devuelve true si el spawn se consumo
-- (aunque no hayamos podido customizarlo), false si falla catastroficamente.
function Echoes.Bosses.spawnBoss(subjectID, tx, ty, tz)
    if not addZombiesInOutfit then return false end
    local cell = getWorld():getCell()
    if not cell then return false end

    local sq = findWalkableNear(cell, tx, ty, tz or 0)
    if not sq then return false end
    local sx, sy, sz = sq:getX(), sq:getY(), sq:getZ()

    -- Snapshot antes de spawn para identificar al nuevo zombie
    local before = snapshotMovingObjects(cell, sx, sy, sz, DETECT_SCAN_RADIUS)

    local outfit = SUBJECT_OUTFITS[subjectID] or "Doctor"
    local femaleChance = SUBJECT_FEMALE_CHANCE[subjectID] or 0

    -- Spawn con 2x HP y outfit de la profesion
    local ok = pcall(function()
        addZombiesInOutfit(sx, sy, sz, 1, outfit,
            femaleChance,
            false,  -- crawler
            false,  -- isFallOnFront
            false,  -- isFakeDead
            false,  -- knockedDown
            false,  -- isInvulnerable
            false,  -- isSitting
            BOSS_HEALTH_MULT,
            false,  -- isRecordingAnims
            0,      -- heightOffset
            false)  -- isRagdolling
    end)
    if not ok then return false end

    -- Encontrar el zombie recien creado para customizarlo
    local zombie = findNewZombieNear(cell, sx, sy, sz, DETECT_SCAN_RADIUS, before)
    if not zombie then
        -- El spawn se consumio pero no lo encontramos para setear sprinter
        -- ni agregar la dog tag. Fallback: devolver true para que NO se
        -- reintente, pero dropear la tag en el piso como plan B.
        local tag = instanceItem(Echoes.dogtagFullType(subjectID))
        if tag then
            pcall(function() sq:AddWorldInventoryItem(tag, 0, 0, 0) end)
        end
        return true
    end

    -- Customizaciones: sprinter, marca en ModData, dog tag en inventario.
    pcall(function() zombie:setSprinter(true) end)
    pcall(function() zombie:setForceToSprint(true) end)
    pcall(function() zombie:setCrawler(false) end)

    local zmd = zombie:getModData()
    zmd.EOK_SubjectID = subjectID
    zmd.EOK_Boss = true

    local inv = zombie:getInventory()
    if inv then
        local tag = instanceItem(Echoes.dogtagFullType(subjectID))
        if tag then
            pcall(function() inv:AddItem(tag) end)
        end
    end

    return true
end
