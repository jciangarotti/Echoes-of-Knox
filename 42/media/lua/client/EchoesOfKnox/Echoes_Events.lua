-- Conecta los eventos del juego con el core del mod.

Echoes = Echoes or {}

-- Throttle del tick de compass + spawn. El compass decide internamente si
-- beepear o no segun su propio timer; este tick es solo el driver.
local lastTickMs = 0
local TICK_INTERVAL_MS = 200

local function onPlayerUpdate(player)
    if player ~= getPlayer() then return end
    local now = getTimestampMs and getTimestampMs() or 0
    if now - lastTickMs < TICK_INTERVAL_MS then return end
    local dt = (now - lastTickMs) / 1000
    lastTickMs = now

    Echoes.tickSpawn(player)
    Echoes.Compass.tick(dt)
end

local function onContainerUpdate()
    if Echoes.onPickupScan then Echoes.onPickupScan() end
end

local function onGameStart()
    local player = getPlayer()
    if not player then return end
    Echoes.initializeIfNeeded(player)
    if Echoes.spawnNoteIfNeeded then
        Echoes.spawnNoteIfNeeded(player)
    end
end

Events.OnGameStart.Add(onGameStart)
Events.OnPlayerUpdate.Add(onPlayerUpdate)
Events.OnContainerUpdate.Add(onContainerUpdate)
