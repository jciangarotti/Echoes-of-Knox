-- MysteriousNote: lore hook. Se spawnea en un contenedor de la casa inicial
-- la primera vez que el personaje carga el mundo con el mod activo. Al hacer
-- clic derecho -> "Read Note", abre una ventana con la historia.

Echoes = Echoes or {}

local NOTE_FULLTYPE = "EchoesOfKnox.MysteriousNote"
local NOTE_GIVEN_FLAG = "EOK_NoteGiven"

-- Texto de la nota en formato RichText (soporta <LINE>, <CENTRE>, <SIZE:*>).
-- Bilingue: se elige EN/ES en runtime segun Echoes.getLang().
-- Español en variante chilena (tú + conjugaciones estandar).

local NOTE_TEXT_EN = table.concat({
    "<CENTRE>",
    "<SIZE:large> A Folded Note ",
    "<LINE>",
    "<SIZE:small>(handwritten, pencil, smudged in places)",
    "<LINE><LINE>",
    "<LEFT>",
    "To whoever made it through the first wave -",
    "<LINE><LINE>",
    "Something has been wrong in Knox County since long before the outbreak. ",
    "Read this carefully.",
    "<LINE><LINE>",
    "People were disappearing. Not bitten. Not turned. Just gone.",
    "<LINE><LINE>",
    "A nurse from the West Point clinic. A mechanic outside Rosewood. A ",
    "family from a farmhouse off Dixie Highway. And more - more names ",
    "than anyone was tracking, spread over a year, before I stopped ",
    "counting. The sheriff wrote them off as runaways. They weren't.",
    "<LINE><LINE>",
    "And every time someone vanished, the area around them changed. ",
    "Streetlights on a block of Muldraugh flickered three nights running. ",
    "A radio mast outside Riverside transmitted static on a dead frequency ",
    "for hours. Birds abandoned a patch of woods near March Ridge in a ",
    "single afternoon and never came back. Locals called it coincidence.",
    "<LINE><LINE>",
    "The Army was already there. Trucks. Tents. Too much fencing for a ",
    "training exercise. Whatever was taking those people, the military ",
    "knew, and they were tracking. Every one of the missing was tagged - ",
    "not metaphorically. A physical marker on the body, readable only by ",
    "specialized field equipment: a wristwatch with a compass-style dial, ",
    "issued to officers in the program. I never held one. I only saw a ",
    "photograph.",
    "<LINE><LINE>",
    "If you find one of those watches - a nightstand, a drawer, an Army ",
    "surplus crate - turn it on. It will beep. Slow when you're far. Fast ",
    "when you're close. Follow the beeps to the markers. Find the markers, ",
    "find the places. Find the places, find out what actually happened in ",
    "Knox.",
    "<LINE><LINE>",
    "I don't know what you'll learn. I don't know if it will help anyone ",
    "still alive. Someone has to look. I ran out of time.",
    "<LINE><LINE>",
    "<RIGHT>Good luck, whoever you are.",
}, " ")

local NOTE_TEXT_ES = table.concat({
    "<CENTRE>",
    "<SIZE:large> Una Nota Doblada ",
    "<LINE>",
    "<SIZE:small>(escrita a mano, a lápiz, manchada en partes)",
    "<LINE><LINE>",
    "<LEFT>",
    "Para quien sobrevivió a la primera ola —",
    "<LINE><LINE>",
    "Algo ha estado mal en Knox County desde mucho antes del brote. ",
    "Lee esto con atención.",
    "<LINE><LINE>",
    "La gente estaba desapareciendo. No mordidos. No infectados. ",
    "Simplemente se esfumaban.",
    "<LINE><LINE>",
    "Una enfermera de la clínica de West Point. Un mecánico a las afueras ",
    "de Rosewood. Una familia de una granja sobre la Dixie Highway. Y más ",
    "— más nombres de los que nadie llevaba la cuenta, a lo largo de un ",
    "año, antes de que yo dejara de contar. El sheriff los archivó como ",
    "fugitivos. No lo eran.",
    "<LINE><LINE>",
    "Y cada vez que alguien desaparecía, el área alrededor cambiaba. Las ",
    "luces de una cuadra entera de Muldraugh parpadearon tres noches ",
    "seguidas. Un mástil de radio a las afueras de Riverside transmitió ",
    "estática en una frecuencia muerta durante horas. Los pájaros ",
    "abandonaron un trozo de bosque cerca de March Ridge en una sola ",
    "tarde y no volvieron nunca. La gente lo llamó coincidencia.",
    "<LINE><LINE>",
    "El ejército ya estaba ahí. Camiones. Carpas. Demasiado alambrado ",
    "para un ejercicio de entrenamiento. Fuera lo que fuera lo que se ",
    "llevaba a esa gente, los militares lo sabían, y estaban rastreando. ",
    "Cada uno de los desaparecidos fue marcado — no metafóricamente. Un ",
    "marcador físico sobre el cuerpo, legible solo por equipo ",
    "especializado de campo: un reloj de pulsera con un dial tipo ",
    "brújula, entregado a oficiales del programa. Yo nunca tuve uno en ",
    "la mano. Solo vi una fotografía.",
    "<LINE><LINE>",
    "Si encuentras uno de esos relojes — una mesa de noche, un cajón, ",
    "una caja de excedentes del ejército — enciéndelo. Va a sonar. Lento ",
    "cuando estás lejos. Rápido cuando estás cerca. Sigue los pitidos ",
    "hasta los marcadores. Encuentra los marcadores, encuentra los ",
    "lugares. Encuentra los lugares, y vas a saber qué pasó realmente en ",
    "Knox.",
    "<LINE><LINE>",
    "No sé qué vas a aprender. No sé si va a servirle a alguien que siga ",
    "con vida. Alguien tiene que mirar. A mí se me acabó el tiempo.",
    "<LINE><LINE>",
    "<RIGHT>Buena suerte, seas quien seas.",
}, " ")

local function pickNoteText()
    if Echoes.getLang and Echoes.getLang() == "ES" then
        return NOTE_TEXT_ES
    end
    return NOTE_TEXT_EN
end

-- ---------------------------------------------------------------------------
-- Reading UI
-- ---------------------------------------------------------------------------

function Echoes.readNote(player)
    player = player or getPlayer()
    local w = 520
    local h = 600
    local x = (getCore():getScreenWidth() - w) / 2
    local y = (getCore():getScreenHeight() - h) / 2
    local text = pickNoteText()
    local modal = ISModalRichText:new(x, y, w, h, text, false, nil, nil,
        player and player:getPlayerNum() or 0)
    modal:initialise()
    modal:addToUIManager()
end

function Echoes.isMysteriousNote(item)
    if not item or not item.getFullType then return false end
    return item:getFullType() == NOTE_FULLTYPE
end

-- ---------------------------------------------------------------------------
-- Spawn in starting building
-- ---------------------------------------------------------------------------

local function collectContainersInBuilding(player, radius)
    local sq = player:getSquare()
    if not sq then return {} end
    local cell = getWorld():getCell()
    if not cell then return {} end
    local px = math.floor(player:getX())
    local py = math.floor(player:getY())
    local pz = math.floor(player:getZ())
    local containers = {}
    for dx = -radius, radius do
        for dy = -radius, radius do
            local s = cell:getGridSquare(px + dx, py + dy, pz)
            if s then
                local objs = s:getObjects()
                for i = 0, objs:size() - 1 do
                    local obj = objs:get(i)
                    if obj then
                        local ok, c = pcall(function() return obj:getContainer() end)
                        if ok and c then
                            table.insert(containers, c)
                        end
                    end
                end
            end
        end
    end
    return containers
end

function Echoes.spawnNoteIfNeeded(player)
    player = player or getPlayer()
    if not player then return end
    local md = player:getModData()
    if md[NOTE_GIVEN_FLAG] then return end

    local item = instanceItem(NOTE_FULLTYPE)
    if not item then return end

    -- Busca contenedores cerca del jugador (10 tiles). Tipicamente captura
    -- nightstands, cocina, roperos y comodas de la casa inicial.
    local containers = collectContainersInBuilding(player, 10)
    local placed = false
    if #containers > 0 then
        -- ZombRand(n) devuelve 0..n-1; +1 lo lleva a 1..n para Lua indexing.
        local idx = ZombRand(#containers) + 1
        local pick = containers[idx]
        if pick then
            pcall(function() pick:AddItem(item) end)
            placed = true
        end
    end
    if not placed then
        -- Fallback: dropeala en el suelo donde esta el jugador.
        local sq = player:getSquare()
        if sq then
            pcall(function() sq:AddWorldInventoryItem(item, 0, 0, 0) end)
            placed = true
        end
    end

    if placed then
        md[NOTE_GIVEN_FLAG] = true
        if HaloTextHelper and HaloTextHelper.addGoodText then
            pcall(HaloTextHelper.addGoodText, player,
                Echoes.text("UI_EOK_NoteHint"))
        end
    end
end

-- ---------------------------------------------------------------------------
-- Context menu: "Read Note"
-- ---------------------------------------------------------------------------

local function resolveItem(entry)
    if entry and entry.getFullType then return entry end
    if entry and entry.items and entry.items[1] then return entry.items[1] end
    return nil
end

local function onReadClick(player, item)
    Echoes.readNote(getSpecificPlayer(player))
end

local function onFillMenu(player, context, items)
    if not items or #items == 0 then return end
    for _, entry in ipairs(items) do
        local item = resolveItem(entry)
        if Echoes.isMysteriousNote(item) then
            local label = Echoes.text("UI_EOK_ReadNote")
            context:addOption(label, player, onReadClick, item)
            return
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(onFillMenu)
