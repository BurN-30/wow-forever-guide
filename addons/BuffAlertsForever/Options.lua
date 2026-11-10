-- BuffAlerts Forever - Options window
local ADDON, ns = ...

local panel
local refreshers = {}

local function AddRefresher(fn) refreshers[#refreshers + 1] = fn end

function ns.RefreshOptions()
    for _, fn in ipairs(refreshers) do fn() end
end

local function CreateCheck(parent, label, getter, setter)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetSize(26, 26)
    local text = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("LEFT", cb, "RIGHT", 2, 0)
    text:SetText(label)
    cb:SetScript("OnClick", function(self) setter(self:GetChecked() and true or false) end)
    AddRefresher(function() cb:SetChecked(getter()) end)
    return cb
end

local function CreateSlider(parent, label, minV, maxV, step, getter, setter)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetSize(220, 38)

    local title = holder:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    title:SetPoint("TOPLEFT")
    title:SetText(label)

    -- Typed value + / - buttons for fine adjustment
    local plus = CreateFrame("Button", nil, holder, "UIPanelButtonTemplate")
    plus:SetSize(20, 18)
    plus:SetPoint("TOPRIGHT", 0, 3)
    plus:SetText("+")

    local box = CreateFrame("EditBox", nil, holder, "InputBoxTemplate")
    box:SetSize(46, 18)
    box:SetPoint("RIGHT", plus, "LEFT", -2, 0)
    box:SetAutoFocus(false)
    box:SetNumeric(false)
    box:SetJustifyH("CENTER")
    box:SetMaxLetters(6)

    local minus = CreateFrame("Button", nil, holder, "UIPanelButtonTemplate")
    minus:SetSize(20, 18)
    minus:SetPoint("RIGHT", box, "LEFT", -6, 0)
    minus:SetText("-")

    local valueText = { SetText = function(_, v) if not box:HasFocus() then box:SetText(tostring(v)) end end }

    local s = CreateFrame("Slider", nil, holder)
    s:SetOrientation("HORIZONTAL")
    s:SetSize(220, 14)
    s:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
    s:SetMinMaxValues(minV, maxV)
    s:SetValueStep(step)
    s:SetObeyStepOnDrag(true)

    local track = s:CreateTexture(nil, "BACKGROUND")
    track:SetPoint("LEFT")
    track:SetPoint("RIGHT")
    track:SetHeight(4)
    track:SetColorTexture(0.3, 0.3, 0.3, 1)

    local thumb = s:CreateTexture(nil, "OVERLAY")
    thumb:SetSize(10, 16)
    thumb:SetColorTexture(1, 0.82, 0, 1)
    s:SetThumbTexture(thumb)

    local function Round(v) return math.floor(v / step + 0.5) * step end

    s:SetScript("OnValueChanged", function(self, v)
        v = Round(v)
        valueText:SetText(v)
        if not self.updating then setter(v) end
    end)

    local function Apply(v)
        v = tonumber(v)
        if not v then valueText:SetText(getter()) return end
        v = math.max(minV, math.min(maxV, Round(v)))
        s:SetValue(v)
        valueText:SetText(v)
    end
    box:SetScript("OnEnterPressed", function(self) Apply(self:GetText()); self:ClearFocus() end)
    box:SetScript("OnEscapePressed", function(self) self:SetText(tostring(getter())); self:ClearFocus() end)
    box:SetScript("OnEditFocusLost", function(self) Apply(self:GetText()) end)
    plus:SetScript("OnClick", function() Apply(getter() + step) end)
    minus:SetScript("OnClick", function() Apply(getter() - step) end)

    AddRefresher(function()
        s.updating = true
        s:SetValue(getter())
        s.updating = false
        valueText:SetText(getter())
    end)
    return holder
end

local COL_W = 252      -- width of one section column
local MAX_COLS = 4     -- number of columns; sections fill the shortest column
local MAX_VIEW_H = 600 -- taller content scrolls with the mouse wheel
local BOTTOM_H = 70    -- room for the buttons under the scroll area

-- Element heights used to measure a section before it is laid out
local H_HEADER, H_CHECK, H_CYCLE, H_SLIDER, H_GAP, H_MARGIN = 30, 26, 26, 48, 10, 20

local function BuildHeader(parent, title, x, y)
    local header = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
    header:SetText(title)
    return header
end

local function IsBuffAlert(alert) return alert ~= nil and alert.families ~= nil and not alert.noSpell end

local function CreateCycle(parent, alert)
    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetSize(220, 22)
    local options = { "auto" }
    for _, fk in ipairs(alert.choices) do options[#options + 1] = fk end
    local function Label()
        local c = ns.db[alert.key].choice or "auto"
        if c == "auto" then
            return "Auto: " .. ns.AutoRecommendationName(alert.key)
        end
        return "Fixed: " .. ns.FamilyName(c)
    end
    b:SetScript("OnClick", function()
        local cur, idx = ns.db[alert.key].choice or "auto", 1
        for i, v in ipairs(options) do if v == cur then idx = i end end
        ns.db[alert.key].choice = options[idx % #options + 1]
        ns.Resolve()
        ns.Update()
        b:SetText(Label())
    end)
    AddRefresher(function() b:SetText(Label()) end)
    return b
end

-- Height an alert section will take (mirrors BuildAlertSection)
local function MeasureAlertSection(key, alert)
    local cfg = ns.db[key]
    local h = H_HEADER + H_CHECK + H_CHECK                       -- enable + sound
    if cfg.combatOnly ~= nil then h = h + H_CHECK end
    if cfg.allSpecs ~= nil then h = h + H_CHECK end
    if IsBuffAlert(alert) then
        h = h + H_CHECK
        if alert.choices then h = h + H_CYCLE end
    end
    if alert and alert.threshold then h = h + H_SLIDER end
    if cfg.expiryWarn ~= nil then h = h + H_SLIDER end
    if cfg.showTimer ~= nil then h = h + H_CHECK end
    return h + 3 * H_SLIDER + H_MARGIN
end

local function MeasurePartySection()
    return H_HEADER + H_CHECK + H_SLIDER + H_CHECK + 24 + H_MARGIN
end

-- Section for an on-screen alert (buffs, reactive abilities, weapons, pets)
local function BuildAlertSection(parent, key, title, x, y, alert)
    local header = BuildHeader(parent, title, x, y)
    local cfg = function() return ns.db[key] end
    local function set(field, v)
        cfg()[field] = v
        ns.ApplyLayout(key)
        ns.Update()
    end

    local h = H_HEADER + H_CHECK
    local cb = CreateCheck(parent, "Enable alert",
        function() return cfg().enabled end,
        function(v) set("enabled", v) end)
    cb:SetPoint("TOPLEFT", header, "BOTTOMLEFT", -4, -8)
    local last, lastIsCheck = cb, true
    if cfg().combatOnly ~= nil then
        h = h + H_CHECK
        local combat = CreateCheck(parent, "Only in combat",
            function() return cfg().combatOnly end,
            function(v) set("combatOnly", v) end)
        combat:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, 0)
        last = combat
    end
    if cfg().allSpecs ~= nil then
        h = h + H_CHECK
        local all = CreateCheck(parent, "Show for all specs",
            function() return cfg().allSpecs end,
            function(v) set("allSpecs", v) end)
        all:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, 0)
        last = all
    end

    local sound = CreateCheck(parent, "Play sound",
        function() return cfg().sound end,
        function(v) set("sound", v) end)
    sound:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, 0)
    last = sound
    h = h + H_CHECK

    if IsBuffAlert(alert) then
        h = h + H_CHECK
        local strict = CreateCheck(parent, "Require recommended",
            function() return cfg().strict end,
            function(v) set("strict", v) end)
        strict:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 0, 0)
        last = strict

        if alert.choices then
            h = h + H_CYCLE
            local cycle = CreateCycle(parent, alert)
            cycle:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 4, -4)
            last, lastIsCheck = cycle, false
        end
    end

    if alert and alert.threshold then
        h = h + H_SLIDER
        local t = alert.threshold
        local th = CreateSlider(parent, t.label, t.min, t.max, t.step,
            function() return cfg().threshold end, function(v) set("threshold", v) end)
        th:SetPoint("TOPLEFT", last, "BOTTOMLEFT", lastIsCheck and 4 or 0, -10)
        last, lastIsCheck = th, false
    end

    if cfg().showTimer ~= nil then
        local st = CreateCheck(parent, "Show timer while active",
            function() return cfg().showTimer end,
            function(v) set("showTimer", v) end)
        st:SetPoint("TOPLEFT", last, "BOTTOMLEFT", lastIsCheck and 0 or -4, lastIsCheck and 0 or -4)
        last, lastIsCheck = st, true
    end
    if cfg().expiryWarn ~= nil then
        local w = CreateSlider(parent, "Warn before expiry (sec, 0 = off)", 0, 60, 1,
            function() return cfg().expiryWarn end, function(v) set("expiryWarn", v) end)
        w:SetPoint("TOPLEFT", last, "BOTTOMLEFT", lastIsCheck and 4 or 0, -10)
        last, lastIsCheck = w, false
    end

    local size = CreateSlider(parent, "Size", 24, 256, 2,
        function() return cfg().size end, function(v) set("size", v) end)
    size:SetPoint("TOPLEFT", last, "BOTTOMLEFT", lastIsCheck and 4 or 0, -10)

    local px = CreateSlider(parent, "Position X (horizontal)", -800, 800, 1,
        function() return cfg().x end, function(v) set("x", v) end)
    px:SetPoint("TOPLEFT", size, "BOTTOMLEFT", 0, -10)

    local anchorTop = ns.db[key].anchor == "TOP"
    local py = CreateSlider(parent, anchorTop and "Position Y (from the top)" or "Position Y (vertical)", anchorTop and -1000 or -500, anchorTop and 0 or 500, 1,
        function() return cfg().y end, function(v) set("y", v) end)
    py:SetPoint("TOPLEFT", px, "BOTTOMLEFT", 0, -10)
    return h + 3 * H_SLIDER + H_MARGIN
end

-- Section for the party frame indicators
local function BuildPartySection(parent, alert, x, y)
    local header = BuildHeader(parent, alert.label, x, y)
    local cfg = function() return ns.db[alert.key] end

    local cb = CreateCheck(parent, "Show on party frame",
        function() return cfg().enabled end,
        function(v) cfg().enabled = v; ns.UpdateParty() end)
    cb:SetPoint("TOPLEFT", header, "BOTTOMLEFT", -4, -8)

    local size = CreateSlider(parent, "Indicator size", 10, 48, 1,
        function() return cfg().size end, function(v) cfg().size = v; ns.UpdateParty() end)
    size:SetPoint("TOPLEFT", cb, "BOTTOMLEFT", 4, -10)

    local left = CreateCheck(parent, "Show on the left side",
        function() return cfg().side == "left" end,
        function(v) cfg().side = v and "left" or "right"; ns.UpdateParty() end)
    left:SetPoint("TOPLEFT", size, "BOTTOMLEFT", -4, -6)

    local note = parent:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    note:SetPoint("TOPLEFT", left, "BOTTOMLEFT", 4, -4)
    note:SetWidth(220)
    note:SetJustifyH("LEFT")
    note:SetText("Updates out of combat. Hidden in raids.")
    return H_HEADER + H_CHECK + H_SLIDER + H_CHECK + 24 + H_MARGIN
end

function ns.CreateOptions()
    if panel then return end

    -- Columns for the current class
    local columns = {}
    for _, alert in ipairs(ns.myAlerts or {}) do
        columns[#columns + 1] = function(p, x, y, m) if m then return MeasureAlertSection(alert.key, alert) end BuildAlertSection(p, alert.key, alert.label, x, y, alert) end
    end
    for _, list in ipairs({ ns.myUsable or {}, ns.myWeapon or {}, ns.myPet or {} }) do
        for _, alert in ipairs(list) do
            columns[#columns + 1] = function(p, x, y, m) if m then return MeasureAlertSection(alert.key, nil) end BuildAlertSection(p, alert.key, alert.label, x, y, nil) end
        end
    end
    for _, alert in ipairs(ns.myUtility or {}) do
        columns[#columns + 1] = function(p, x, y, m) if m then return MeasureAlertSection(alert.key, alert) end BuildAlertSection(p, alert.key, alert.label, x, y, alert) end
    end
    for _, alert in ipairs(ns.myWarn or {}) do
        columns[#columns + 1] = function(p, x, y, m) if m then return MeasureAlertSection(alert.key, nil) end BuildAlertSection(p, alert.key, alert.label .. " (combat)", x, y, nil) end
    end
    for _, alert in ipairs(ns.myParty or {}) do
        columns[#columns + 1] = function(p, x, y, m) if m then return MeasurePartySection() end BuildPartySection(p, alert, x, y) end
    end

    -- Grid: sections fill rows left to right; each row is as tall as its tallest section,
    -- so every alert in a row starts on the same line and nothing overlaps
    local cols = math.max(2, math.min(MAX_COLS, #columns))
    local placements, rowY, rowH = {}, 4, 0
    for i, build in ipairs(columns) do
        local col = (i - 1) % cols + 1
        if col == 1 and i > 1 then rowY = rowY + rowH; rowH = 0 end
        placements[i] = { col = col, y = rowY }
        rowH = math.max(rowH, build(nil, 0, 0, true))   -- measure only
    end
    local contentH = rowY + rowH
    local viewH = math.min(contentH, MAX_VIEW_H)
    local width = cols * COL_W + 40
    panel = CreateFrame("Frame", "BuffAlertsForeverOptions", UIParent, "BackdropTemplate")
    panel:SetSize(width, viewH + 46 + BOTTOM_H)
    panel.bg = panel:CreateTexture(nil, "BACKGROUND")
    panel.bg:SetAllPoints()
    panel.bg:SetColorTexture(0.05, 0.05, 0.05, 0.95)
    panel:SetPoint("CENTER")
    panel:SetFrameStrata("FULLSCREEN_DIALOG")
    panel:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    panel:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
    panel:SetMovable(true)
    panel:EnableMouse(true)
    panel:RegisterForDrag("LeftButton")
    panel:SetScript("OnDragStart", panel.StartMoving)
    panel:SetScript("OnDragStop", panel.StopMovingOrSizing)
    panel:Hide()
    -- Not registered in UISpecialFrames on purpose: that list is closed together with the
    -- Blizzard Options window. Escape is handled here instead.
    panel:EnableKeyboard(true)
    panel:SetScript("OnKeyDown", function(self, key)
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false)
            self:Hide()
        else
            self:SetPropagateKeyboardInput(true)
        end
    end)

    local title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    title:SetPoint("TOP", 0, -14)
    title:SetText("BuffAlerts Forever")

    local close = CreateFrame("Button", nil, panel, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -4, -4)

    if #columns == 0 then
        local msg = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        msg:SetPoint("CENTER")
        msg:SetText("No alerts available for this class.")
    end
    -- Scrollable area holding the sections in a grid
    local scroll = CreateFrame("ScrollFrame", nil, panel)
    scroll:SetPoint("TOPLEFT", 12, -46)
    scroll:SetSize(width - 24, viewH)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(width - 24, contentH)
    scroll:SetScrollChild(content)
    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", function(self, delta)
        local maxV = math.max(0, contentH - viewH)
        self:SetVerticalScroll(math.max(0, math.min(maxV, self:GetVerticalScroll() - delta * 60)))
    end)
    for i, build in ipairs(columns) do
        local p = placements[i]
        build(content, 12 + (p.col - 1) * COL_W, p.y)
    end
    if contentH > viewH then
        local more = panel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
        more:SetPoint("TOPRIGHT", -30, -34)
        more:SetText("Scroll for more settings")
    end

    local specText = panel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    specText:SetPoint("TOPLEFT", 24, -34)
    AddRefresher(function()
        local s = ns.GetSpec()
        specText:SetText(s ~= "none" and ("Detected spec: " .. s) or "")
    end)

    local move = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    move:SetSize(150, 24)
    move:SetPoint("BOTTOMLEFT", 20, 16)
    local function UpdateMoveText()
        move:SetText(ns.unlocked and "Lock icons" or "Move icons")
    end
    move:SetScript("OnClick", function()
        ns.SetUnlocked(not ns.unlocked)
        UpdateMoveText()
    end)
    AddRefresher(UpdateMoveText)

    local hideAll = CreateCheck(panel, "Hide all alerts",
        function() return ns.db.hideAll end,
        function(v) ns.db.hideAll = v; ns.Update(); ns.UpdateParty() end)
    hideAll:SetPoint("LEFT", move, "RIGHT", 12, 0)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    reset:SetSize(150, 24)
    reset:SetPoint("BOTTOMRIGHT", -20, 16)
    reset:SetText("Reset to defaults")
    reset:SetScript("OnClick", function()
        ns.ResetDefaults()
        ns.RefreshOptions()
    end)

    local hint = panel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    hint:SetPoint("BOTTOM", 0, 22)
    hint:SetText("Drag the icons while\n\"Move icons\" is on")

    panel:SetScript("OnShow", ns.RefreshOptions)
    panel:SetScript("OnHide", function()
        if ns.unlocked then ns.SetUnlocked(false) end
    end)

    -- Entry under Options > AddOns
    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        pcall(function()
            local stub = CreateFrame("Frame")
            local t = stub:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            t:SetPoint("TOPLEFT", 16, -16)
            t:SetText("BuffAlerts Forever")
            local b = CreateFrame("Button", nil, stub, "UIPanelButtonTemplate")
            b:SetSize(180, 26)
            b:SetPoint("TOPLEFT", t, "BOTTOMLEFT", 0, -12)
            b:SetText("Open options")
            b:SetScript("OnClick", function()
                if SettingsPanel and HideUIPanel then pcall(HideUIPanel, SettingsPanel) end
                panel:Show()
            end)
            local category = Settings.RegisterCanvasLayoutCategory(stub, "BuffAlerts Forever")
            Settings.RegisterAddOnCategory(category)
        end)
    end
end

function ns.ToggleOptions()
    if not panel then ns.CreateOptions() end
    panel:SetShown(not panel:IsShown())
end
