-- DEBUG HELPER — Da un Compass Watch al jugador la primera vez que carga la
-- partida con el mod activo. Util para testear sin depender del sistema de
-- loot.
--
-- Para desactivar: cambia DEBUG_GIVE_WATCH a false (o borra este archivo)
-- una vez que hayas confirmado que el loot funciona bien en los contenedores.

Echoes = Echoes or {}
Echoes.DEBUG_GIVE_WATCH = false

-- Flag con version para que al cambiar el tipo del reloj en el .txt
-- el jugador reciba un item fresco.
local DEBUG_FLAG = "EOK_DebugWatchGiven_v1"

local function onGameStart()
    if not Echoes.DEBUG_GIVE_WATCH then return end
    local player = getPlayer()
    if not player then return end
    local md = player:getModData()
    if md[DEBUG_FLAG] then return end

    local inv = player:getInventory()
    if not inv then return end

    local item = instanceItem("EchoesOfKnox.CompassWatch_Right")
    if item then
        inv:AddItem(item)
        md[DEBUG_FLAG] = true
        if HaloTextHelper and HaloTextHelper.addGoodText then
            pcall(HaloTextHelper.addGoodText, player, "Compass Watch [DEBUG]")
        end
    end
end

Events.OnGameStart.Add(onGameStart)
