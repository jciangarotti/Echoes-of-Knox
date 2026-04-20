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
    "<SIZE:large> A Folded Letter ",
    "<LINE>",
    "<SIZE:small>(several pages, handwritten in dark ink, sealed in an envelope on the cabin table)",
    "<LINE><LINE>",
    "<LEFT>",
    "To whoever wakes up in this cabin:",
    "<LINE><LINE>",
    "I won't greet you by your name. It wouldn't be honest. ",
    "Right now you don't remember it either, and writing it ",
    "here would be a way of deciding things for you that I'd ",
    "rather not decide. Call yourself whatever you want. The ",
    "name, if you want one, will come later.",
    "<LINE><LINE>",
    "You don't know me. Maybe that's for the best.",
    "<LINE><LINE>",
    "FIRST - SURVIVE",
    "<LINE><LINE>",
    "Out there is a world that broke. It's not a metaphor. If ",
    "you open the curtain before you finish reading this, ",
    "you're going to see things moving between the trees. They ",
    "don't move the way people move. Don't get near them. ",
    "Don't let them get near you. One bite is enough.",
    "<LINE><LINE>",
    "The cabin is locked from the inside with a simple ",
    "mechanism. You can leave whenever you want.",
    "<LINE><LINE>",
    "In the cupboards there is food for several months. You ",
    "know how to use knives and weapons, even if you don't ",
    "remember. Your body knows things your head doesn't.",
    "<LINE><LINE>",
    "SECOND - THE WATCH",
    "<LINE><LINE>",
    "At some point, when you leave this cabin and reach one of ",
    "the towns, you will see wristwatches on people's wrists. ",
    "A specific model. Square case, black leather strap, no ",
    "visible brand on the face, a small button on the right ",
    "side. You'll recognize them when you see them. They are ",
    "not ordinary watches, even if they look like it at first.",
    "<LINE><LINE>",
    "They were worn by normal people. Neighbors. Pharmacy ",
    "clerks. Receptionists. Teachers. Secretaries. None of ",
    "them fully understood what the watch they were wearing ",
    "was for. Some did. Most didn't. I won't explain that here ",
    "either. You'll see.",
    "<LINE><LINE>",
    "You need one. Any one. The first one you find will do, ",
    "whether or not the people carrying them are still alive. ",
    "Take it off them. Put it on yourself. Never take it off ",
    "again, not to sleep, not to bathe.",
    "<LINE><LINE>",
    "The watch has a second function besides telling time. On ",
    "the back, a small slot that fits a very specific object: ",
    "a metal tag the size of a thumbtip, with a number ",
    "engraved on it. When one of those tags comes near a watch ",
    "like this - even from several meters away - the watch ",
    "detects it and starts to sound. The closer, the louder. ",
    "Without the watch, the tags are useless pieces of metal. ",
    "With the watch, they are a map.",
    "<LINE><LINE>",
    "There are seven tags in the world. Numbered from 01 to 07.",
    "<LINE><LINE>",
    "If you find all of them and fit them into the back of the ",
    "watch, one by one, the watch is going to give you ",
    "something back. I'm not going to write here what it is. ",
    "If I tell you now, you won't believe me, and if you ",
    "believe me, you'll understand it wrong. Find all seven. ",
    "Then you'll understand.",
    "<LINE><LINE>",
    "THIRD - WHAT I WON'T TELL YOU",
    "<LINE><LINE>",
    "There were others before you. You didn't know them. You ",
    "won't. Each of them was carrying one of the seven tags ",
    "when the world fell.",
    "<LINE><LINE>",
    "Some left the tag to you before being lost. Others still ",
    "have them, somewhere, in a pocket, on a chain, hanging ",
    "from a neck that isn't the same neck anymore.",
    "<LINE><LINE>",
    "You'll have to go looking. Muldraugh. Riverside. ",
    "Rosewood. West Point. Somewhere among those four towns ",
    "are the seven. Once you get the watch, it is going to ",
    "tell you whether you're getting closer or farther. The ",
    "rest is up to you.",
    "<LINE><LINE>",
    "If you find a tag hanging from something that walks, ",
    "remember that the thing that walks is no longer a person. ",
    "Take the tag from it. Don't look at its face any longer ",
    "than you need to. Move on.",
    "<LINE><LINE>",
    "FOURTH - YOU",
    "<LINE><LINE>",
    "You are not like the rest. Not in the heroic sense of the ",
    "word. In a smaller, more biological, more boring sense. ",
    "Your body has a particularity you share with almost no ",
    "one. That's why you're here. That's why you're alive.",
    "<LINE><LINE>",
    "LAST",
    "<LINE><LINE>",
    "You're going to want to know why I'm writing this to you. ",
    "You're going to want to know what that watch is for, why ",
    "there are seven tags, why I know everything I know. Those ",
    "questions have answers. And the answers will come, in time.",
    "<LINE><LINE>",
    "When you understand, you're going to have a reason to ",
    "hate me. That's all right. By that point I won't be ",
    "anywhere your hate can reach. The only thing I ask - and ",
    "this is not a demand, it's a suggestion - is that before ",
    "you hate me, you read everything. To the end. Without ",
    "skipping anything.",
    "<LINE><LINE>",
    "After that, what remains of the world is yours. Do with ",
    "it what you can.",
    "<LINE><LINE>",
    "<RIGHT>With the only honesty I have left,",
}, " ")

local NOTE_TEXT_ES = table.concat({
    "<CENTRE>",
    "<SIZE:large> Una Carta Doblada ",
    "<LINE>",
    "<SIZE:small>(varias paginas, escritas a mano con tinta oscura, selladas en un sobre sobre la mesa de la cabana)",
    "<LINE><LINE>",
    "<LEFT>",
    "A quien despierta en esta cabana:",
    "<LINE><LINE>",
    "No te voy a saludar por tu nombre. No seria honesto. En ",
    "este momento tu tampoco lo recuerdas, y escribirlo aqui ",
    "seria una forma de decidir por ti cosas que prefiero no ",
    "decidir. Llamate como quieras. El nombre, si lo quieres, ",
    "vendra despues.",
    "<LINE><LINE>",
    "No me conoces. Puede que eso sea mejor.",
    "<LINE><LINE>",
    "LO PRIMERO - SOBREVIVIR",
    "<LINE><LINE>",
    "Afuera hay un mundo que se rompio. No es una metafora. ",
    "Si abres la cortina antes de leer esto entero, vas a ver ",
    "cosas que se mueven entre los arboles. No se mueven como ",
    "se mueve la gente. No te les acerques. No los dejes ",
    "acercarse. Una mordida basta.",
    "<LINE><LINE>",
    "La cabana esta cerrada desde adentro con un mecanismo ",
    "simple. Puedes salir cuando quieras.",
    "<LINE><LINE>",
    "En las alacenas hay comida para varios meses. Sabes usar ",
    "cuchillos y armas, aunque no lo recuerdes. Tu cuerpo sabe ",
    "cosas que tu cabeza no.",
    "<LINE><LINE>",
    "LO SEGUNDO - EL RELOJ",
    "<LINE><LINE>",
    "En algun momento, cuando salgas de esta cabana y llegues ",
    "a alguno de los pueblos, vas a ver relojes de pulsera en ",
    "las munecas de la gente. Un modelo especifico. Caja ",
    "cuadrada, correa de cuero negro, esfera sin marca ",
    "visible, un boton pequeno en el lado derecho. Los vas a ",
    "reconocer cuando los veas. No son relojes comunes, aunque ",
    "a simple vista lo parezcan.",
    "<LINE><LINE>",
    "Los llevaba gente normal. Vecinos. Empleados de farmacia. ",
    "Recepcionistas. Profesores. Secretarias. Ninguno de ellos ",
    "entendia del todo para que servia el reloj que traia ",
    "puesto. Algunos si. La mayoria no. Eso tampoco te lo voy ",
    "a explicar aca. Ya vas a ver.",
    "<LINE><LINE>",
    "Necesitas uno. Cualquiera. El primero que encuentres te ",
    "sirve, esten vivos o no los que lo llevan. Sacaselo. ",
    "Pontelo tu. No te lo saques nunca mas, ni para dormir, ni ",
    "para banarte.",
    "<LINE><LINE>",
    "El reloj tiene una segunda funcion ademas de dar la hora. ",
    "En el reverso, una ranura pequena que encaja con un ",
    "objeto muy especifico: una placa metalica del tamano de ",
    "la yema del pulgar, con un numero grabado. Cuando una de ",
    "esas placas se acerca a un reloj de estos - aunque sea a ",
    "varios metros - el reloj lo detecta y empieza a sonar. ",
    "Mientras mas cerca, mas fuerte. Sin el reloj, las placas ",
    "son pedazos de metal inutiles. Con el reloj, son un mapa.",
    "<LINE><LINE>",
    "Hay siete placas en el mundo. Numeradas del 01 al 07.",
    "<LINE><LINE>",
    "Si las encuentras todas y las encajas en el reverso del ",
    "reloj, una por una, el reloj te va a devolver algo a ",
    "cambio. No te voy a escribir aqui que es. Si te lo digo ",
    "ahora, no me lo vas a creer, y si me lo crees lo vas a ",
    "entender mal. Encuentra las siete. Despues entiendes.",
    "<LINE><LINE>",
    "LO TERCERO - LO QUE NO TE VOY A DECIR",
    "<LINE><LINE>",
    "Hubo otros antes que tu. No los conociste. No los vas a ",
    "conocer. Cada uno de ellos llevaba una de las siete ",
    "placas encima cuando el mundo se cayo.",
    "<LINE><LINE>",
    "Algunos te la dejaron antes de perderse. Otros la tienen ",
    "todavia, en algun lugar, en un bolsillo, en una cadena, ",
    "colgada de un cuello que ya no es el mismo cuello.",
    "<LINE><LINE>",
    "Vas a tener que ir a buscarlas. Muldraugh. Riverside. ",
    "Rosewood. West Point. En algun punto entre esos cuatro ",
    "pueblos estan las siete. Cuando consigas el reloj, el te ",
    "va a ir diciendo si te acercas o te alejas. Lo demas lo ",
    "tienes que hacer tu.",
    "<LINE><LINE>",
    "Si encuentras una placa colgada de algo que camina, ",
    "acuerdate de que eso que camina ya no es una persona. ",
    "Sacale la placa. No lo mires a la cara mas tiempo del ",
    "necesario. Sigue.",
    "<LINE><LINE>",
    "LO CUARTO - TU",
    "<LINE><LINE>",
    "No eres como los demas. No en el sentido heroico de la ",
    "palabra. En un sentido mas pequeno, mas biologico, mas ",
    "aburrido. Tu cuerpo tiene una particularidad que no ",
    "compartes con casi nadie. Por eso estas aqui. Por eso ",
    "estas vivo.",
    "<LINE><LINE>",
    "LO ULTIMO",
    "<LINE><LINE>",
    "Vas a querer saber por que te escribo esto. Vas a querer ",
    "saber para que sirve ese reloj, por que hay siete placas, ",
    "por que yo se todo lo que se. Esas preguntas tienen ",
    "respuesta. Y vendran con el tiempo.",
    "<LINE><LINE>",
    "Cuando lo entiendas, vas a tener un motivo para odiarme. ",
    "Esta bien. A esa altura yo ya no voy a estar en ningun ",
    "lado donde tu odio pueda alcanzarme. Lo unico que te pido ",
    "- y esto no es una exigencia, es una sugerencia - es que ",
    "antes de odiarme, leas todo. Hasta el final. Sin saltarte ",
    "nada.",
    "<LINE><LINE>",
    "Despues, el mundo que queda es tuyo. Haz con el lo que ",
    "puedas.",
    "<LINE><LINE>",
    "<RIGHT>Con la unica honestidad que todavia me queda,",
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
