-- Collection Events: escanea el inventario del jugador en busca de diarios
-- recien recolectados. Detecta items Journal_SubjectNN_MM y los marca como
-- descubiertos. Corre throttled (cada 500ms) sobre OnPlayerUpdate.

Echoes = Echoes or {}
Echoes.Collection = Echoes.Collection or {}

local SCAN_COOLDOWN_MS = 500
local lastScanMs = 0

-- Regex-parse del fulltype para extraer subjectID, entryN. Reutiliza la misma
-- logica que Echoes.Diaries pero standalone por si se carga antes.
local function parseJournalFT(fullType)
    if not fullType then return nil end
    local s, e = string.match(fullType, "^EchoesOfKnox%.Journal_Subject(%d+)_(%d+)$")
    if s and e then return tonumber(s), tonumber(e) end
    return nil
end

local function scanContainerRecursive(container, seen, player, newDiscoveries)
    if not container then return end
    local items = container:getItems()
    if not items then return end
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item then
            local ft = item:getFullType()
            if ft and not seen[ft] then
                seen[ft] = true
                local s, e = parseJournalFT(ft)
                if s and e then
                    if Echoes.Collection.markDiaryDiscovered(s, e, player) then
                        table.insert(newDiscoveries, { subject = s, entry = e })
                    end
                end
            end
            -- Contenedor anidado (mochilas, bolsos).
            if item.getInventory then
                local nested = item:getInventory()
                if nested then
                    scanContainerRecursive(nested, seen, player, newDiscoveries)
                end
            end
        end
    end
end

local function notifyDiscovery(player, subject, entry)
    if not HaloTextHelper then return end
    local msg = "Subject " .. string.format("%02d", subject)
        .. " - Entry " .. tostring(entry) .. " logged"
    if Echoes.getLang and Echoes.getLang() == "ES" then
        msg = "Sujeto " .. string.format("%02d", subject)
            .. " - Entrada " .. tostring(entry) .. " registrada"
    end
    if HaloTextHelper.addTextWithArrow then
        local color = (Color and Color.new)
            and Color.new(0.75, 0.65, 0.25, 1.0)  -- ocre
            or HaloTextHelper.getGoodColor()
        pcall(HaloTextHelper.addTextWithArrow, player, msg, "", true, color)
    elseif HaloTextHelper.addGoodText then
        pcall(HaloTextHelper.addGoodText, player, msg)
    end
end

local function onPlayerUpdate(player)
    if not player or player ~= getPlayer() then return end
    local now = getTimestampMs and getTimestampMs() or 0
    if now - lastScanMs < SCAN_COOLDOWN_MS then return end
    lastScanMs = now

    local inv = player:getInventory()
    if not inv then return end
    local seen = {}
    local newDiscoveries = {}
    scanContainerRecursive(inv, seen, player, newDiscoveries)

    for _, d in ipairs(newDiscoveries) do
        notifyDiscovery(player, d.subject, d.entry)
    end
end

Events.OnPlayerUpdate.Add(onPlayerUpdate)
