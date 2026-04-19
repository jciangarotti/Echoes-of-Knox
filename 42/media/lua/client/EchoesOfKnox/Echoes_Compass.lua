-- Compass Watch: mientras un Compass Watch este encendido y tenga bateria,
-- calcula distancia a la dog tag mas cercana y emite un beep cuya frecuencia
-- escala con la distancia. Tambien drena bateria del reloj.

Echoes = Echoes or {}
Echoes.Compass = Echoes.Compass or {}

-- Curva distancia -> intervalo entre beeps (segundos). Definida por tramos
-- porque se siente mas expresiva que una formula lisa.
local function beepInterval(distance)
    if distance < 20 then return 0.15 end
    if distance < 100 then return 0.5 end
    if distance < 300 then return 1.5 end
    if distance < 1000 then return 4.0 end
    return 8.0
end

-- Drena de bateria por segundo cuando el compass esta activo. Una bateria
-- standard (1000 "units" en modData) dura ~40min con compass prendido.
local BATTERY_DRAIN_PER_SECOND = 0.4
local COMPASS_ON_FLAG = "EOK_CompassOn"
local COMPASS_BATT_FLAG = "EOK_Battery"
local BATTERY_INITIAL = 1000

-- Reconoce ambas variantes del reloj (muneca izq y der).
function Echoes.Compass.isCompassWatch(item)
    if not item or not item.getFullType then return false end
    local ft = item:getFullType()
    return ft == "EchoesOfKnox.CompassWatch_Right"
        or ft == "EchoesOfKnox.CompassWatch_Left"
end

-- Encuentra el Compass Watch activo en el inventario del jugador.
function Echoes.Compass.findActiveWatch(player)
    player = player or getPlayer()
    if not player then return nil end
    local inv = player:getInventory()
    if not inv then return nil end
    local items = inv:getItems()
    for i = 0, items:size() - 1 do
        local it = items:get(i)
        if Echoes.Compass.isCompassWatch(it) then
            local md = it:getModData()
            if md and md[COMPASS_ON_FLAG] then
                return it
            end
        end
    end
    return nil
end

function Echoes.Compass.isOn(item)
    if not item then return false end
    local md = item:getModData()
    return md and md[COMPASS_ON_FLAG] == true
end

function Echoes.Compass.getBattery(item)
    if not item then return 0 end
    local md = item:getModData()
    if md[COMPASS_BATT_FLAG] == nil then md[COMPASS_BATT_FLAG] = BATTERY_INITIAL end
    return md[COMPASS_BATT_FLAG]
end

function Echoes.Compass.setBattery(item, value)
    if not item then return end
    if value < 0 then value = 0 end
    item:getModData()[COMPASS_BATT_FLAG] = value
end

function Echoes.Compass.toggle(item, player)
    if not item then return end
    local md = item:getModData()
    local wasOn = md[COMPASS_ON_FLAG] == true
    if wasOn then
        md[COMPASS_ON_FLAG] = false
    else
        if Echoes.Compass.getBattery(item) <= 0 then
            if HaloTextHelper and HaloTextHelper.addBadText then
                pcall(HaloTextHelper.addBadText, player or getPlayer(), Echoes.text("UI_EOK_NoBattery"))
            end
            return
        end
        md[COMPASS_ON_FLAG] = true
    end
    local msg = md[COMPASS_ON_FLAG] and Echoes.text("UI_EOK_CompassOn") or Echoes.text("UI_EOK_CompassOff")
    if HaloTextHelper and HaloTextHelper.addGoodText then
        pcall(HaloTextHelper.addGoodText, player or getPlayer(), msg)
    end
end

local lastBeepMs = 0

local function playBeep(player)
    if not player then return end
    pcall(function()
        player:playSound("CompassBeep")
    end)
end

-- Se llama una vez por segundo (aprox) desde Events.lua.
function Echoes.Compass.tick(deltaSeconds)
    local player = getPlayer()
    if not player then return end
    local watch = Echoes.Compass.findActiveWatch(player)
    if not watch then return end

    local batt = Echoes.Compass.getBattery(watch) - BATTERY_DRAIN_PER_SECOND * deltaSeconds
    Echoes.Compass.setBattery(watch, batt)
    if batt <= 0 then
        watch:getModData()[COMPASS_ON_FLAG] = false
        if HaloTextHelper and HaloTextHelper.addBadText then
            pcall(HaloTextHelper.addBadText, player, Echoes.text("UI_EOK_NoBattery"))
        end
        return
    end

    local dist = Echoes.distanceToNearest(player)
    if not dist then
        watch:getModData()[COMPASS_ON_FLAG] = false
        return
    end

    local interval = beepInterval(dist)
    local nowMs = getTimestampMs and getTimestampMs() or 0
    if nowMs - lastBeepMs >= interval * 1000 then
        lastBeepMs = nowMs
        playBeep(player)
    end
end
