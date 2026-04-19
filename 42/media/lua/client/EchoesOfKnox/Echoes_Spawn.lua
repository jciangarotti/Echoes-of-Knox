-- Elige posiciones aleatorias para las 7 dog tags la primera vez que el
-- jugador carga el mundo, y las materializa en el suelo cuando el jugador se
-- acerca a cada una.
--
-- Estrategia:
--   1. Al iniciar: si el state no tiene coords para las 7 dog tags, elegir un
--      punto aleatorio para cada una alrededor del spawn del jugador, dentro
--      de un radio "grande pero jugable" (ver WORLD_RADIUS).
--   2. En OnPlayerUpdate (throttled): para cada dog tag no-spawneada no-
--      recolectada, si el jugador esta a <= PROXIMITY_SPAWN tiles, buscar la
--      tile walkable mas cercana y dropear el item ahi. Marcar spawned=true.
--   3. Si el item se destruye o el jugador lo lleva, lo detecta Pickup.lua.

Echoes = Echoes or {}

-- Radio (en tiles) alrededor del spawn donde escondemos las dog tags.
-- Knox County entero ronda 10000+ tiles de lado; 2000 tiles es ~6 km de
-- busqueda alcanzable a pie / en auto sin sentirse imposible.
local WORLD_RADIUS = 2000
-- Distancia minima entre dog tags para no spawnearlas pegadas.
local MIN_DOGTAG_SEPARATION = 400
-- Distancia a la que el item real se materializa en el suelo.
local PROXIMITY_SPAWN = 30

local function randFloat()
    if ZombRandFloat then return ZombRandFloat(0, 1) end
    return math.random()
end

local function randRange(min, max)
    return min + randFloat() * (max - min)
end

local function dist2(ax, ay, bx, by)
    local dx = ax - bx
    local dy = ay - by
    return dx * dx + dy * dy
end

-- Elige 7 puntos alrededor del spawn del jugador, sin que queden muy juntos.
local function pickLocations(centerX, centerY, z)
    local minSep2 = MIN_DOGTAG_SEPARATION * MIN_DOGTAG_SEPARATION
    local tags = {}
    local attempts = 0
    while #tags < Echoes.TOTAL_DOGTAGS and attempts < 200 do
        attempts = attempts + 1
        local x = math.floor(centerX + randRange(-WORLD_RADIUS, WORLD_RADIUS))
        local y = math.floor(centerY + randRange(-WORLD_RADIUS, WORLD_RADIUS))
        local tooClose = false
        for _, b in ipairs(tags) do
            if dist2(x, y, b.x, b.y) < minSep2 then
                tooClose = true; break
            end
        end
        if not tooClose then
            table.insert(tags, {
                n = #tags + 1,
                x = x, y = y, z = z or 0,
                spawned = false,
                collected = false,
            })
        end
    end
    -- Si por mala suerte no llegamos a 7, rellenamos sin chequear separacion.
    while #tags < Echoes.TOTAL_DOGTAGS do
        local x = math.floor(centerX + randRange(-WORLD_RADIUS, WORLD_RADIUS))
        local y = math.floor(centerY + randRange(-WORLD_RADIUS, WORLD_RADIUS))
        table.insert(tags, {
            n = #tags + 1, x = x, y = y, z = z or 0,
            spawned = false, collected = false,
        })
    end
    return tags
end

-- Busca una tile walkable cerca de (tx, ty, tz). Si no encuentra, devuelve
-- la original (el item queda flotando o en una pared — aceptable para v0.1).
local function findDropSquare(tx, ty, tz)
    local cell = getWorld():getCell()
    if not cell then return nil end
    local target = cell:getGridSquare(tx, ty, tz)
    if target and target:isFree(false) then
        return target
    end
    for r = 1, 5 do
        for dx = -r, r do
            for dy = -r, r do
                local sq = cell:getGridSquare(tx + dx, ty + dy, tz)
                if sq and sq:isFree(false) then
                    return sq
                end
            end
        end
    end
    return target
end

function Echoes.initializeIfNeeded(player)
    player = player or getPlayer()
    if not player then return end
    local st = Echoes.getState(player)
    if st.dogtags and st.dogtags[Echoes.TOTAL_DOGTAGS] then return end

    local px = math.floor(player:getX())
    local py = math.floor(player:getY())
    local pz = math.floor(player:getZ())
    st.seed = getTimestampMs and getTimestampMs() or os.time()
    st.dogtags = pickLocations(px, py, pz)
end

-- Cuando el jugador se acerca a las coords de una dog tag, spawnea al boss
-- que la custodia. Fallback: si Bosses no carga, dropear la tag en el piso
-- (comportamiento v0.1).
function Echoes.tickSpawn(player)
    player = player or getPlayer()
    if not player then return end
    local st = Echoes.getState(player)
    if not st or not st.dogtags then return end
    local px = player:getX()
    local py = player:getY()
    local prox2 = PROXIMITY_SPAWN * PROXIMITY_SPAWN
    for _, b in ipairs(st.dogtags) do
        if (not b.spawned) and (not b.collected) then
            if dist2(px, py, b.x, b.y) < prox2 then
                local ok = false
                if Echoes.Bosses and Echoes.Bosses.spawnBoss then
                    ok = Echoes.Bosses.spawnBoss(b.n, b.x, b.y, b.z or 0)
                end
                if not ok then
                    -- Fallback: item en el piso (v0.1 behavior)
                    local sq = findDropSquare(b.x, b.y, b.z or 0)
                    if sq then
                        local item = instanceItem(Echoes.dogtagFullType(b.n))
                        if item then
                            sq:AddWorldInventoryItem(item, 0, 0, 0)
                            ok = true
                        end
                    end
                end
                if ok then b.spawned = true end
            end
        end
    end
end

-- Distancia euclidiana a la dog tag mas cercana sin recolectar. Devuelve
-- `nil` si ya estan todas.
function Echoes.distanceToNearest(player)
    player = player or getPlayer()
    if not player then return nil end
    local st = Echoes.getState(player)
    if not st or not st.dogtags then return nil end
    local px = player:getX()
    local py = player:getY()
    local pz = math.floor(player:getZ())
    local bestSq = nil
    for _, b in ipairs(st.dogtags) do
        if not b.collected then
            local d2 = dist2(px, py, b.x, b.y)
            if b.z and math.abs(b.z - pz) > 0 then
                d2 = d2 + 10000
            end
            if not bestSq or d2 < bestSq then bestSq = d2 end
        end
    end
    if not bestSq then return nil end
    return math.sqrt(bestSq)
end
