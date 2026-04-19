-- Registra la tecla J para abrir la ventana de coleccion (Echoes Collection).

Echoes = Echoes or {}
Echoes.Collection = Echoes.Collection or {}

local KEYBIND_LABEL = "Open Echoes Collection"

local function registerKeybind()
    -- Cabecera de seccion en Options > Key Bindings.
    local header = {}
    header.value = "[Echoes of Knox]"
    table.insert(keyBinding, header)

    local bind = {}
    bind.value = KEYBIND_LABEL
    bind.key = Keyboard.KEY_J
    table.insert(keyBinding, bind)
end

local function onKeyPressed(key)
    if key == getCore():getKey(KEYBIND_LABEL) then
        if Echoes.Collection and Echoes.Collection.toggleUI then
            Echoes.Collection.toggleUI()
        end
    end
end

local function startListener()
    Events.OnKeyPressed.Add(onKeyPressed)
end

Events.OnGameBoot.Add(registerKeybind)
Events.OnGameStart.Add(startListener)
