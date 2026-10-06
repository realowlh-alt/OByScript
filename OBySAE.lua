-- ============================================
-- OBy Steal An Egg - Delta Executor Script
-- Game: Steal An Egg
-- Tema: Abu-abu (Grey/Black)
-- By OBy | Keyless / No Key
-- ============================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Hapus GUI lama
if CoreGui:FindFirstChild("OBy_StealEgg") then
    CoreGui.OBy_StealEgg:Destroy()
end

-- ===== KONFIGURASI TEMA ABU-ABU =====
local COLORS = {
    bg = Color3.fromRGB(15, 15, 15),
    panel = Color3.fromRGB(25, 25, 25),
    border = Color3.fromRGB(60, 60, 60),
    accent = Color3.fromRGB(120, 120, 120),
    accentLight = Color3.fromRGB(180, 180, 180),
    text = Color3.fromRGB(220, 220, 220),
    textDim = Color3.fromRGB(120, 120, 120),
    green = Color3.fromRGB(0, 180, 80),
    red = Color3.fromRGB(180, 40, 40),
}

-- ===== DATA RARITY TELUR =====
local EGG_RARITIES = {
    "Basic",
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythical",
    "Divine",
    "Eternal",
    "Secret",
    "Nightflame",
    "BrainrotGod",
}

-- ===== SCREEN GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OBy_StealEgg"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- ===== MAIN FRAME =====
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 320, 0, 480)
Main.Position = UDim2.new(0.5, -160, 0.5, -240)
Main.BackgroundColor3 = COLORS.bg
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = COLORS.border
MainStroke.Thickness = 2
MainStroke.Parent = Main

-- ===== HEADER =====
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 55)
Header.BackgroundColor3 = COLORS.panel
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, 0, 0, 2)
HeaderLine.Position = UDim2.new(0, 0, 1, -2)
HeaderLine.BackgroundColor3 = COLORS.accent
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 26)
Title.Position = UDim2.new(0, 0, 0, 6)
Title.BackgroundTransparency = 1
Title.Text = "🥚 OBY STEAL EGG"
Title.TextColor3 = COLORS.accentLight
Title.Font = Enum.Font.Code
Title.TextSize = 16
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 16)
Subtitle.Position = UDim2.new(0, 0, 0, 30)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "By OBy · Keyless Edition"
Subtitle.TextColor3 = COLORS.textDim
Subtitle.Font = Enum.Font.Code
Subtitle.TextSize = 9
Subtitle.Parent = Header

-- Tombol Close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -32, 0, 8)
CloseBtn.BackgroundColor3 = COLORS.bg
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = COLORS.red
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 14
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = COLORS.border
CloseStroke.Thickness = 1
CloseStroke.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ===== SCROLLING AREA =====
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -16, 1, -120)
Scroll.Position = UDim2.new(0, 8, 0, 60)
Scroll.BackgroundColor3 = COLORS.bg
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = COLORS.accent
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Main

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 6)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = Scroll

-- ===== FUNGSI BIKIN TOGGLE =====
local function createToggle(name, key, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -8, 0, 38)
    Frame.BackgroundColor3 = COLORS.panel
    Frame.BorderSizePixel = 0
    Frame.Parent = Scroll

    local FC = Instance.new("UICorner")
    FC.CornerRadius = UDim.new(0, 6)
    FC.Parent = Frame

    local FS = Instance.new("UIStroke")
    FS.Color = COLORS.border
    FS.Thickness = 1
    FS.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = COLORS.text
    Label.Font = Enum.Font.Code
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 44, 0, 22)
    ToggleBtn.Position = UDim2.new(1, -52, 0.5, -11)
    ToggleBtn.BackgroundColor3 = COLORS.bg
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = COLORS.textDim
    ToggleBtn.Font = Enum.Font.Code
    ToggleBtn.TextSize = 10
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Parent = Frame

    local TC = Instance.new("UICorner")
    TC.CornerRadius = UDim.new(0, 6)
    TC.Parent = ToggleBtn

    local TS = Instance.new("UIStroke")
    TS.Color = COLORS.border
    TS.Thickness = 1
    TS.Parent = ToggleBtn

    local state = false
    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            ToggleBtn.Text = "ON"
            ToggleBtn.TextColor3 = COLORS.green
            TS.Color = COLORS.green
        else
            ToggleBtn.Text = "OFF"
            ToggleBtn.TextColor3 = COLORS.textDim
            TS.Color = COLORS.border
        end
        if callback then callback(state) end
    end)

    return Frame
end

-- ===== FUNGSI BIKIN RARITY SELECTOR =====
local function createRaritySection()
    local Section = Instance.new("Frame")
    Section.Size = UDim2.new(1, -8, 0, 30)
    Section.BackgroundColor3 = COLORS.bg
    Section.BorderSizePixel = 0
    Section.Parent = Scroll

    local SectionLabel = Instance.new("TextLabel")
    SectionLabel.Size = UDim2.new(1, 0, 1, 0)
    SectionLabel.BackgroundTransparency = 1
    SectionLabel.Text = "🎯 TARGET RARITY"
    SectionLabel.TextColor3 = COLORS.accentLight
    SectionLabel.Font = Enum.Font.Code
    SectionLabel.TextSize = 11
    SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
    SectionLabel.Parent = Section

    -- Buat toggle untuk tiap rarity
    local rarityStates = {}
    for _, rarity in ipairs(EGG_RARITIES) do
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, -8, 0, 32)
        Frame.BackgroundColor3 = COLORS.panel
        Frame.BorderSizePixel = 0
        Frame.Parent = Scroll

        local FC = Instance.new("UICorner")
        FC.CornerRadius = UDim.new(0, 6)
        FC.Parent = Frame

        local FS = Instance.new("UIStroke")
        FS.Color = COLORS.border
        FS.Thickness = 1
        FS.Parent = Frame

        local RLabel = Instance.new("TextLabel")
        RLabel.Size = UDim2.new(1, -60, 1, 0)
        RLabel.Position = UDim2.new(0, 10, 0, 0)
        RLabel.BackgroundTransparency = 1
        RLabel.Text = rarity
        RLabel.TextColor3 = COLORS.text
        RLabel.Font = Enum.Font.Code
        RLabel.TextSize = 11
        RLabel.TextXAlignment = Enum.TextXAlignment.Left
        RLabel.Parent = Frame

        local RBtn = Instance.new("TextButton")
        RBtn.Size = UDim2.new(0, 40, 0, 20)
        RBtn.Position = UDim2.new(1, -48, 0.5, -10)
        RBtn.BackgroundColor3 = COLORS.bg
        RBtn.Text = "OFF"
        RBtn.TextColor3 = COLORS.textDim
        RBtn.Font = Enum.Font.Code
        RBtn.TextSize = 9
        RBtn.BorderSizePixel = 0
        RBtn.Parent = Frame

        local RC = Instance.new("UICorner")
        RC.CornerRadius = UDim.new(0, 5)
        RC.Parent = RBtn

        local RS = Instance.new("UIStroke")
        RS.Color = COLORS.border
        RS.Thickness = 1
        RS.Parent = RBtn

        local rState = false
        RBtn.MouseButton1Click:Connect(function()
            rState = not rState
            rarityStates[rarity] = rState
            if rState then
                RBtn.Text = "ON"
                RBtn.TextColor3 = COLORS.green
                RS.Color = COLORS.green
            else
                RBtn.Text = "OFF"
                RBtn.TextColor3 = COLORS.textDim
                RS.Color = COLORS.border
            end
        end)
    end

    return rarityStates
end

-- ===== BUAT SEMUA FITUR =====
local rarityStates = createRaritySection()

createToggle("🥚 Auto Steal Egg", "AutoSteal", function(state)
    if state then
        print("[OBy] Auto Steal: ON")
    else
        print("[OBy] Auto Steal: OFF")
    end
end)

createToggle("🎯 Auto Target Rarity", "TargetRarity")
createToggle("📦 Auto Place Egg", "AutoPlace")
createToggle("🏃 Fast Grab", "FastGrab")
createToggle("💨 Speed Boost", "SpeedBoost")
createToggle("🛡️ Anti Ragdoll", "AntiRagdoll")
createToggle("👁️ Egg ESP", "EggESP")
createToggle("🔮 Egg Prediction", "EggPredict")
createToggle("🔄 Auto Server Hop", "ServerHop")
createToggle("⚡ Anti Lag", "AntiLag")

-- ===== SEPARATOR =====
local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -8, 0, 2)
Sep.BackgroundColor3 = COLORS.border
Sep.BorderSizePixel = 0
Sep.Parent = Scroll

-- ===== LABEL INFO =====
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -8, 0, 30)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "⚡ Script ini keyless. Aktifkan toggle buat fitur."
InfoLabel.TextColor3 = COLORS.textDim
InfoLabel.Font = Enum.Font.Code
InfoLabel.TextSize = 9
InfoLabel.TextWrapped = true
InfoLabel.Parent = Scroll

-- ===== NOTIFIKASI =====
local function notif(msg)
    local n = Instance.new("TextLabel")
    n.Size = UDim2.new(0, 240, 0, 36)
    n.Position = UDim2.new(0.5, -120, 0, 20)
    n.BackgroundColor3 = COLORS.panel
    n.Text = msg
    n.TextColor3 = COLORS.accentLight
    n.Font = Enum.Font.Code
    n.TextSize = 12
    n.BorderSizePixel = 0
    n.Parent = ScreenGui

    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 8)
    nc.Parent = n

    local ns = Instance.new("UIStroke")
    ns.Color = COLORS.accent
    ns.Thickness = 2
    ns.Parent = n

    task.wait(2.5)
    n:Destroy()
end

notif("⚡ OBY STEAL EGG LOADED! By OBy")