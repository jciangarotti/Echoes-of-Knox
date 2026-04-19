-- Agrega "Toggle Compass Watch" al clic derecho sobre un Compass Watch.

Echoes = Echoes or {}

local function resolveItem(entry)
    if entry and entry.getFullType then return entry end
    if entry and entry.items and entry.items[1] then return entry.items[1] end
    return nil
end

local function onToggle(player, item)
    Echoes.Compass.toggle(item, player)
end

local function onFillMenu(player, context, items)
    if not items or #items == 0 then return end
    for _, entry in ipairs(items) do
        local item = resolveItem(entry)
        if Echoes.Compass and Echoes.Compass.isCompassWatch
                and Echoes.Compass.isCompassWatch(item) then
            local label = Echoes.text("UI_EOK_Toggle")
            local md = item:getModData()
            local on = md and md.EOK_CompassOn == true
            if on then
                label = label .. "  [ON]"
            else
                label = label .. "  [OFF]"
            end
            context:addOption(label, getSpecificPlayer(player), onToggle, item)
            return
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(onFillMenu)
