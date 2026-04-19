-- Core: estado del mod en ModData del jugador (single-player v0.1).
--
-- Estructura:
--   md.EchoesOfKnox = {
--       version = 1,
--       seed = <int>,                 -- para repetibilidad
--       dogtags = {
--           [n] = { n = N, x = X, y = Y, z = Z, spawned = bool, collected = bool }
--           -- una entrada por dog tag, n = 1..7
--       }
--   }

Echoes = Echoes or {}
Echoes.MODDATA_KEY = "EchoesOfKnox"
Echoes.VERSION = 1
Echoes.TOTAL_DOGTAGS = 7

-- Fulltype por sujeto (el item en scripts).
Echoes.dogtagFullType = function(n)
    return string.format("EchoesOfKnox.DogTag_Subject%02d", n)
end

function Echoes.getState(player)
    player = player or getPlayer()
    if not player then return nil end
    local md = player:getModData()
    local st = md[Echoes.MODDATA_KEY]
    if not st or type(st) ~= "table" then
        st = { version = Echoes.VERSION, dogtags = {}, seed = 0 }
        md[Echoes.MODDATA_KEY] = st
    end
    st.dogtags = st.dogtags or {}
    st.version = Echoes.VERSION
    return st
end

function Echoes.isInitialized(player)
    local st = Echoes.getState(player)
    return st and st.dogtags and st.dogtags[1] ~= nil
end

-- Calcula cuantas dog tags quedan sin encontrar.
function Echoes.remainingCount(player)
    local st = Echoes.getState(player)
    if not st then return 0 end
    local remaining = 0
    for _, b in pairs(st.dogtags) do
        if not b.collected then remaining = remaining + 1 end
    end
    return remaining
end

function Echoes.collectedCount(player)
    return Echoes.TOTAL_DOGTAGS - Echoes.remainingCount(player)
end

function Echoes.markCollected(n, player)
    local st = Echoes.getState(player)
    if not st then return end
    if st.dogtags[n] then
        st.dogtags[n].collected = true
    end
end

-- Reset solo de debug.
function Echoes.reset(player)
    local p = player or getPlayer()
    if not p then return end
    p:getModData()[Echoes.MODDATA_KEY] = nil
end
