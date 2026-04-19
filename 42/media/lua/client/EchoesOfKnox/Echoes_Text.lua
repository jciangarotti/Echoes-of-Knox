-- Helper de getText con fallback hardcodeado bilingue (EN/ES).
-- Asegura que la UI no muestre keys crudas aunque el JSON no cargue, y
-- expone Echoes.getLang() para que Note/Diaries elijan su texto por idioma.
-- Español en variante neutra/chilena (tú + conjugaciones estandar).

Echoes = Echoes or {}

local DEFAULTS_EN = {
    UI_EOK_CompassOn  = "Compass Watch: ON",
    UI_EOK_CompassOff = "Compass Watch: OFF",
    UI_EOK_Toggle     = "Toggle Compass Watch",
    UI_EOK_NoBattery  = "Compass Watch needs battery",
    UI_EOK_Found      = "Recovered %1",
    UI_EOK_AllSeven   = "All 7 dog tags recovered. The truth of Knox is yours.",
    UI_EOK_DogTag1    = "Dog Tag - Subject 01 (Elliot James Hargreaves, Physician)",
    UI_EOK_DogTag2    = "Dog Tag - Subject 02 (Claire Elizabeth Vance, RN)",
    UI_EOK_DogTag3    = "Dog Tag - Subject 03 (Marcus Raymond Delaney, Store Clerk)",
    UI_EOK_DogTag4    = "Dog Tag - Subject 04 (Tobias Matthew Cross, Priest)",
    UI_EOK_DogTag5    = "Dog Tag - Subject 05 (Rhett Alan Malone, Auto Mechanic)",
    UI_EOK_DogTag6    = "Dog Tag - Subject 06 (Daniel Antonio Orozco, P.E. Teacher)",
    UI_EOK_DogTag7    = "Dog Tag - Subject 07 (Isaac Mikhail Volkov, Biologist)",
    UI_EOK_ReadNote   = "Read Note",
    UI_EOK_NoteHint   = "You notice a folded note nearby...",
    UI_EOK_ReadDiary  = "Read Journal Entry",
}

local DEFAULTS_ES = {
    UI_EOK_CompassOn  = "Reloj Brújula: ENCENDIDO",
    UI_EOK_CompassOff = "Reloj Brújula: APAGADO",
    UI_EOK_Toggle     = "Encender/Apagar Reloj Brújula",
    UI_EOK_NoBattery  = "El Reloj Brújula necesita batería",
    UI_EOK_Found      = "Recuperaste %1",
    UI_EOK_AllSeven   = "Recuperaste las 7 placas. La verdad sobre Knox es tuya.",
    UI_EOK_DogTag1    = "Placa - Sujeto 01 (Elliot James Hargreaves, Médico)",
    UI_EOK_DogTag2    = "Placa - Sujeto 02 (Claire Elizabeth Vance, Enfermera)",
    UI_EOK_DogTag3    = "Placa - Sujeto 03 (Marcus Raymond Delaney, Cajero)",
    UI_EOK_DogTag4    = "Placa - Sujeto 04 (Tobias Matthew Cross, Sacerdote)",
    UI_EOK_DogTag5    = "Placa - Sujeto 05 (Rhett Alan Malone, Mecánico)",
    UI_EOK_DogTag6    = "Placa - Sujeto 06 (Daniel Antonio Orozco, Profesor de Ed. Física)",
    UI_EOK_DogTag7    = "Placa - Sujeto 07 (Isaac Mikhail Volkov, Biólogo)",
    UI_EOK_ReadNote   = "Leer nota",
    UI_EOK_NoteHint   = "Notas una nota doblada cerca...",
    UI_EOK_ReadDiary  = "Leer entrada del diario",
}

local cachedLang

-- Devuelve "ES" o "EN" segun la config del juego. Cacheado despues del
-- primer lookup para no repetir pcall.
function Echoes.getLang()
    if cachedLang then return cachedLang end
    local lang = "EN"
    local ok, v = pcall(function() return getCore():getOptionLanguage() end)
    if ok and v then
        local s = tostring(v):upper()
        if s == "ES" or s == "AR" then
            lang = "ES"
        end
    end
    cachedLang = lang
    return lang
end

local function pickFallback()
    if Echoes.getLang() == "ES" then return DEFAULTS_ES end
    return DEFAULTS_EN
end

function Echoes.text(key, ...)
    local tr = getText(key, ...)
    if tr == key then
        local def = pickFallback()[key]
        if def then
            local args = {...}
            return (def:gsub("%%(%d+)", function(n)
                return tostring(args[tonumber(n)] or "")
            end))
        end
    end
    return tr
end
