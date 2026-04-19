-- Detecta cuando el jugador levanta una Dog Tag y la marca como recolectada.
-- Si junto las 7, muestra la notificacion del logro.

Echoes = Echoes or {}

local DOGTAG_FULLTYPES = {
    ["EchoesOfKnox.DogTag_Subject01"] = 1,
    ["EchoesOfKnox.DogTag_Subject02"] = 2,
    ["EchoesOfKnox.DogTag_Subject03"] = 3,
    ["EchoesOfKnox.DogTag_Subject04"] = 4,
    ["EchoesOfKnox.DogTag_Subject05"] = 5,
    ["EchoesOfKnox.DogTag_Subject06"] = 6,
    ["EchoesOfKnox.DogTag_Subject07"] = 7,
}

local alreadyAnnouncedAll = false

local function onPickupScan()
    local player = getPlayer()
    if not player then return end
    local inv = player:getInventory()
    if not inv then return end
    local items = inv:getItems()
    local foundAnyNew = false
    for i = 0, items:size() - 1 do
        local it = items:get(i)
        if it then
            local ft = it:getFullType()
            local n = DOGTAG_FULLTYPES[ft]
            if n then
                local st = Echoes.getState(player)
                if st and st.dogtags and st.dogtags[n] and not st.dogtags[n].collected then
                    st.dogtags[n].collected = true
                    foundAnyNew = true
                    local dogtagName = Echoes.text("UI_EOK_DogTag" .. n)
                    local msg = Echoes.text("UI_EOK_Found", dogtagName)
                    if HaloTextHelper and HaloTextHelper.addTextWithArrow then
                        local color = (Color and Color.new)
                            and Color.new(0.42, 0.52, 0.27, 1.0)   -- verde militar
                            or HaloTextHelper.getGoodColor()
                        pcall(HaloTextHelper.addTextWithArrow,
                            player, msg, dogtagName, true, color)
                    elseif HaloTextHelper and HaloTextHelper.addGoodText then
                        pcall(HaloTextHelper.addGoodText, player, msg)
                    end
                end
            end
        end
    end

    if foundAnyNew or not alreadyAnnouncedAll then
        if Echoes.collectedCount(player) >= Echoes.TOTAL_DOGTAGS
                and not alreadyAnnouncedAll then
            alreadyAnnouncedAll = true
            local msg = Echoes.text("UI_EOK_AllSeven")
            if HaloTextHelper and HaloTextHelper.addGoodText then
                pcall(HaloTextHelper.addGoodText, player, msg)
            end
        end
    end
end

Echoes.onPickupScan = onPickupScan
