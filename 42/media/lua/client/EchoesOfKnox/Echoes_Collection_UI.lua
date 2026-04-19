-- Collection UI: ventana tipo "Pokédex" para la coleccion de Echoes of Knox.
--   - Sidebar izquierda: lista de los 7 sujetos con contador de progreso.
--   - Panel derecho: info del sujeto seleccionado (nombre + profesion si el
--     jugador ya tiene la dog tag; sino queda en "???"), estado del tag, y
--     grilla 2x5 con las 10 celdas de diarios (descubiertos vs no).
--   - Click en una celda descubierta reabre el modal de lectura.
--   - Barra de progreso global en el header.
--
-- Se abre con la tecla J (registrada en Echoes_Collection_Keybind.lua) o via
-- Echoes.Collection.toggleUI().

require "ISUI/ISCollapsableWindow"
require "ISUI/ISScrollingListBox"

Echoes = Echoes or {}
Echoes.Collection = Echoes.Collection or {}

local FONT_SMALL = UIFont.Small
local FONT_MEDIUM = UIFont.Medium
local FONT_LARGE = UIFont.Large
local FH_SMALL = getTextManager():getFontHeight(FONT_SMALL)
local FH_MEDIUM = getTextManager():getFontHeight(FONT_MEDIUM)
local FH_LARGE = getTextManager():getFontHeight(FONT_LARGE)

local PAD = 8
local HEADER_H = 42
local SIDEBAR_W = 240
local SIDEBAR_ROW_H = 54
local CELL_SIZE = 95
local CELL_PAD = 8
local TAG_BLOCK_H = 72

-- ============================================================================
-- Sidebar list
-- ============================================================================

local EchoesSidebar = ISScrollingListBox:derive("EchoesSidebar")

function EchoesSidebar:doDrawItem(y, item, alt)
    local w = self:getWidth() - (self.vscroll and self.vscroll.barwidth or 0)
    local h = item.height
    local subjectID = item.item
    local player = getPlayer()
    local progress = Echoes.Collection.getSubjectProgress(subjectID, player)

    -- Fondo (resaltado si seleccionado)
    if self.selected == item.index then
        self:drawRect(0, y, w, h - 1, 0.3, 0.60, 0.45, 0.15)
    end
    self:drawRectBorder(0, y, w, h, 0.4, 0.35, 0.35, 0.35)

    -- Label del sujeto: oculta nombre si el tag no esta
    local label
    if progress.tagFound then
        -- Usa el texto UI_EOK_DogTagN que ya incluye "Subject NN (Name, Profession)"
        label = Echoes.text("UI_EOK_DogTag" .. subjectID)
        -- Pero esa string es larga para la sidebar; cortarla al primer "("
        local paren = string.find(label, "%(")
        if paren then
            label = string.sub(label, 1, paren - 2)  -- solo "Dog Tag - Subject NN" part
        end
        -- Mejor mostrar solo "Subject NN — Name"
        local fullLabel = Echoes.text("UI_EOK_DogTag" .. subjectID)
        local nameStart = string.find(fullLabel, "%(")
        local nameEnd = string.find(fullLabel, ",", nameStart or 1)
        if nameStart and nameEnd then
            local name = string.sub(fullLabel, nameStart + 1, nameEnd - 1)
            label = string.format("Subject %02d — %s", subjectID, name)
        else
            label = string.format("Subject %02d", subjectID)
        end
    else
        label = string.format("Subject %02d — ???", subjectID)
    end

    self:drawText(label, 8, y + 4, 1, 1, 1, 1, FONT_SMALL)

    -- Contador X/11
    local counter = string.format("%d/%d", progress.totalFound, progress.totalTotal)
    local tw = getTextManager():MeasureStringX(FONT_SMALL, counter)
    self:drawText(counter, w - tw - 8, y + 4, 0.85, 0.9, 0.85, 1, FONT_SMALL)

    -- Barra de progreso pequeña
    local barX = 8
    local barY = y + h - 10
    local barW = w - 16
    local barH = 4
    self:drawRect(barX, barY, barW, barH, 0.6, 0.15, 0.15, 0.15)
    if progress.pct > 0 then
        local r, g, b = 0.45, 0.72, 0.45  -- verde militar
        if progress.pct >= 1 then r, g, b = 1.0, 0.82, 0.30 end  -- dorado si completo
        self:drawRect(barX, barY, math.floor(barW * progress.pct), barH, 1, r, g, b)
    end

    -- Marca si el tag esta recolectado (pequeño punto en la esquina)
    if progress.tagFound then
        self:drawRect(w - 14, y + 6, 8, 8, 1, 0.85, 0.72, 0.28)
    end

    return y + h
end

-- ============================================================================
-- Main window
-- ============================================================================

EchoesCollectionWindow = ISCollapsableWindow:derive("EchoesCollectionWindow")

function EchoesCollectionWindow:new(x, y, w, h)
    local o = ISCollapsableWindow:new(x, y, w, h)
    setmetatable(o, self)
    self.__index = self
    o.title = Echoes.text("UI_EOK_CollectionTitle")
    o.resizable = true
    o.minimumWidth = 720
    o.minimumHeight = 460
    o.backgroundColor = { r = 0.05, g = 0.05, b = 0.06, a = 0.95 }
    o.selectedSubject = 1
    -- Cache de bounds de celdas para manejo de click (se rellena en prerender).
    o.cellBounds = {}
    return o
end

function EchoesCollectionWindow:createChildren()
    ISCollapsableWindow.createChildren(self)

    local th = self:titleBarHeight()
    local bodyY = th + HEADER_H + PAD
    local bodyH = self.height - bodyY - PAD

    -- Sidebar: ISScrollingListBox con los 7 sujetos.
    self.sidebar = EchoesSidebar:new(PAD, bodyY, SIDEBAR_W, bodyH)
    self.sidebar:initialise()
    self.sidebar:instantiate()
    self.sidebar.itemheight = SIDEBAR_ROW_H
    self.sidebar.selected = 1
    self.sidebar.drawBorder = true
    self.sidebar.backgroundColor = { r = 0.08, g = 0.08, b = 0.10, a = 0.85 }
    self.sidebar.borderColor = { r = 0.35, g = 0.35, b = 0.35, a = 1 }
    self.sidebar:setOnMouseDownFunction(self, EchoesCollectionWindow.onSidebarClick)
    self:addChild(self.sidebar)

    self:rebuildSidebar()
end

function EchoesCollectionWindow:rebuildSidebar()
    self.sidebar:clear()
    for s = 1, Echoes.Collection.TOTAL_SUBJECTS do
        self.sidebar:addItem("", s)
    end
    self.sidebar.selected = self.selectedSubject
end

function EchoesCollectionWindow:onSidebarClick(item)
    if item and item.item then
        self.selectedSubject = item.item
        self.sidebar.selected = item.index
    end
end

-- Layout anchors que usamos tanto en prerender como en onMouseUp.
function EchoesCollectionWindow:rightPanelBounds()
    local th = self:titleBarHeight()
    local panelX = PAD * 2 + SIDEBAR_W
    local panelY = th + HEADER_H + PAD
    local panelW = self.width - panelX - PAD
    local panelH = self.height - panelY - PAD
    return panelX, panelY, panelW, panelH
end

-- Devuelve la posicion (x,y) de la celda del diario n (1..10), en coordenadas
-- relativas al window (NO absolutas de pantalla).
function EchoesCollectionWindow:diaryCellPos(n)
    local panelX, panelY = self:rightPanelBounds()
    local gridY = panelY + TAG_BLOCK_H + PAD * 2 + FH_MEDIUM + 8
    local col = (n - 1) % 5
    local row = math.floor((n - 1) / 5)
    local cellX = panelX + col * (CELL_SIZE + CELL_PAD)
    local cellY = gridY + row * (CELL_SIZE + CELL_PAD)
    return cellX, cellY
end

function EchoesCollectionWindow:prerender()
    ISCollapsableWindow.prerender(self)

    local th = self:titleBarHeight()
    local player = getPlayer()

    -- Header: barra de progreso global -----------------------------------
    local headerY = th + PAD
    local overall = Echoes.Collection.getOverallProgress(player)
    local barX = PAD
    local barW = self.width - PAD * 2
    local barH = HEADER_H - PAD
    self:drawRect(barX, headerY, barW, barH, 0.6, 0.10, 0.10, 0.10)
    if overall.pct > 0 then
        local r, g, b = 0.45, 0.72, 0.45
        if overall.pct >= 1 then r, g, b = 1.0, 0.82, 0.30 end
        self:drawRect(barX, headerY, math.floor(barW * overall.pct), barH, 0.85, r, g, b)
    end
    self:drawRectBorder(barX, headerY, barW, barH, 0.9, 0.5, 0.5, 0.5)

    local label = string.format("%s:  %d / %d   (%d%%)",
        Echoes.text("UI_EOK_OverallProgress"),
        overall.totalFound, overall.totalTotal,
        math.floor(overall.pct * 100 + 0.5))
    self:drawText(label, barX + 8, headerY + (barH - FH_MEDIUM) / 2, 1, 1, 1, 1, FONT_MEDIUM)

    -- Right panel: detalle del sujeto seleccionado -----------------------
    local s = self.selectedSubject
    local panelX, panelY, panelW, panelH = self:rightPanelBounds()
    local progress = Echoes.Collection.getSubjectProgress(s, player)

    -- Titulo del sujeto
    local titleText
    if progress.tagFound then
        titleText = Echoes.text("UI_EOK_DogTag" .. s)
        -- Remover el prefijo "Dog Tag - " o "Placa - " para mostrar solo nombre+rol
        local idx = string.find(titleText, "Subject")
        if idx then
            titleText = string.sub(titleText, idx)
        end
    else
        titleText = string.format("Subject %02d — %s", s, Echoes.text("UI_EOK_UnknownSubject"))
    end
    self:drawText(titleText, panelX, panelY, 1, 0.95, 0.82, 1, FONT_LARGE)

    -- Linea separadora
    self:drawRect(panelX, panelY + FH_LARGE + 4, panelW, 1, 0.5, 0.4, 0.4, 0.4)

    -- Bloque del Dog Tag
    local tagBlockY = panelY + FH_LARGE + 12
    local tagBoxSize = TAG_BLOCK_H - 12
    self:drawRect(panelX, tagBlockY, tagBoxSize, tagBoxSize,
        progress.tagFound and 0.5 or 0.3, 0.10, 0.12, 0.10)
    self:drawRectBorder(panelX, tagBlockY, tagBoxSize, tagBoxSize,
        0.85, 0.35, 0.35, 0.35)

    local tagIconTex = getTexture("Item_DogTag_Subject" .. string.format("%02d", s))
    if tagIconTex and progress.tagFound then
        self:drawTextureScaledAspect2(tagIconTex,
            panelX + 6, tagBlockY + 6,
            tagBoxSize - 12, tagBoxSize - 12, 1, 1, 1, 1)
    elseif tagIconTex then
        -- Silueta gris
        self:drawTextureScaledAspect2(tagIconTex,
            panelX + 6, tagBlockY + 6,
            tagBoxSize - 12, tagBoxSize - 12, 0.85, 0.1, 0.1, 0.1)
    end

    local tagStatusLabel = progress.tagFound
        and Echoes.text("UI_EOK_TagRecovered")
        or Echoes.text("UI_EOK_TagMissing")
    local tagStatusColor = progress.tagFound
        and { 0.45, 0.85, 0.45 } or { 0.85, 0.40, 0.40 }
    self:drawText(tagStatusLabel,
        panelX + tagBoxSize + 12, tagBlockY + (tagBoxSize - FH_MEDIUM) / 2,
        tagStatusColor[1], tagStatusColor[2], tagStatusColor[3], 1, FONT_MEDIUM)

    -- Grilla de diarios 2x5
    self.cellBounds = {}
    local gridHeaderY = tagBlockY + tagBoxSize + PAD
    self:drawText(Echoes.text("UI_EOK_Journals") ..
        string.format(": %d/10", progress.diariesFound),
        panelX, gridHeaderY, 0.95, 0.95, 0.85, 1, FONT_MEDIUM)

    for n = 1, 10 do
        local cx, cy = self:diaryCellPos(n)
        local discovered = Echoes.Collection.isDiaryDiscovered(s, n, player)
        -- Guardar bounds para click handler
        self.cellBounds[n] = { x = cx, y = cy, w = CELL_SIZE, h = CELL_SIZE, n = n }

        if discovered then
            self:drawRect(cx, cy, CELL_SIZE, CELL_SIZE, 0.55, 0.15, 0.17, 0.13)
        else
            self:drawRect(cx, cy, CELL_SIZE, CELL_SIZE, 0.4, 0.05, 0.05, 0.07)
        end
        self:drawRectBorder(cx, cy, CELL_SIZE, CELL_SIZE,
            0.85, 0.35, 0.35, 0.35)

        local journalIconTex = getTexture(
            "Item_Journal_Subject" .. string.format("%02d", s))
        if journalIconTex then
            local iconSize = 52
            local ix = cx + (CELL_SIZE - iconSize) / 2
            local iy = cy + 8
            if discovered then
                self:drawTextureScaledAspect2(journalIconTex, ix, iy,
                    iconSize, iconSize, 1, 1, 1, 1)
            else
                self:drawTextureScaledAspect2(journalIconTex, ix, iy,
                    iconSize, iconSize, 0.8, 0.15, 0.15, 0.15)
            end
        end

        local cellLabel
        if discovered then
            cellLabel = (Echoes.getLang and Echoes.getLang() == "ES")
                and ("Entrada " .. n) or ("Entry " .. n)
        else
            cellLabel = "???"
        end
        local ltw = getTextManager():MeasureStringX(FONT_SMALL, cellLabel)
        local lx = cx + (CELL_SIZE - ltw) / 2
        local ly = cy + CELL_SIZE - FH_SMALL - 6
        local lr, lg, lb = 1, 1, 1
        if not discovered then lr, lg, lb = 0.5, 0.5, 0.55 end
        self:drawText(cellLabel, lx, ly, lr, lg, lb, 1, FONT_SMALL)
    end
end

-- Click handler: si fue sobre una celda de diario descubierta, abre el modal.
function EchoesCollectionWindow:onMouseUp(x, y)
    local s = self.selectedSubject
    local player = getPlayer()
    for _, c in ipairs(self.cellBounds or {}) do
        if x >= c.x and x <= c.x + c.w and y >= c.y and y <= c.y + c.h then
            if Echoes.Collection.isDiaryDiscovered(s, c.n, player) then
                if Echoes.Diaries and Echoes.Diaries.readDiary then
                    Echoes.Diaries.readDiary(s, c.n, player)
                end
            end
            return true
        end
    end
    return ISCollapsableWindow.onMouseUp(self, x, y)
end

-- ============================================================================
-- Public API: toggle
-- ============================================================================

local currentWindow

function Echoes.Collection.toggleUI()
    if currentWindow then
        if currentWindow:isVisible() then
            currentWindow:removeFromUIManager()
            currentWindow = nil
            return
        end
    end
    local w = 820
    local h = 540
    local x = (getCore():getScreenWidth() - w) / 2
    local y = (getCore():getScreenHeight() - h) / 2
    currentWindow = EchoesCollectionWindow:new(x, y, w, h)
    currentWindow:initialise()
    currentWindow:addToUIManager()
    currentWindow:rebuildSidebar()
end
