--Granny script
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Made by 12345bacons7 and Nova | Granny: Multiplayer",
    Icon = 0, 
    LoadingTitle = "Made by 12345bacons7 and Nova",
    LoadingSubtitle = "by 12345bacons7 and Nova",
    Theme = "Default", 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, 
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Function to get an item
local function get(name)
    for i = 1, 10 do
        local preset = game.Workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild(name) then
            preset:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
        end
    end
end

-- Function to get ammo
local function ammo(name)
    for i = 1, 10 do
        local preset = game.Workspace:FindFirstChild("Preset" .. i)
        if preset then
            local ammoContainer = preset:FindFirstChild("Ammo")
            if ammoContainer and ammoContainer:FindFirstChild(name) then
                ammoContainer:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
            end
        end
    end
end

-- Function to get a weapon
local function weapon(name)
    local General = game.Workspace:FindFirstChild("General Items")
    if General and General:FindFirstChild(name) then
        General:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
    end
end

-- Get Items Tab
local Tab = Window:CreateTab("Chapter 1 - 3", 4483362458)
local Section = Tab:CreateSection("Get Items")

-- Inputs for Items, Ammo, and Weapons
local AmmoInput = Tab:CreateInput({
    Name = "Input Ammo/bullet",
    CurrentValue = "",
    PlaceholderText = "Input full name",
    RemoveTextAfterFocusLost = false,
    Flag = "AmmoInput",
})

local ItemInput = Tab:CreateInput({
    Name = "Input Item Name",
    CurrentValue = "",
    PlaceholderText = "Input full name",
    RemoveTextAfterFocusLost = false,
    Flag = "ItemInput",
})

local WeaponInput = Tab:CreateInput({
    Name = "Input Weapon Name",
    CurrentValue = "",
    PlaceholderText = "Input full name",
    RemoveTextAfterFocusLost = false,
    Flag = "WeaponInput",
})

-- Buttons to Get Items
Tab:CreateButton({ Name = "Get Item", Callback = function() get(ItemInput.CurrentValue) end })
Tab:CreateButton({ Name = "Get Ammo", Callback = function() ammo(AmmoInput.CurrentValue) end })
Tab:CreateButton({ Name = "Get Weapon", Callback = function() weapon(WeaponInput.CurrentValue) end })

-- ESP Tab
local ESP_Tab = Window:CreateTab("ESP", 4483362458)

local function createESP(target)
    if target then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = target
        highlight.Parent = game.CoreGui
    end
end

-- ESP Buttons
ESP_Tab:CreateButton({ Name = "ESP Granny & Slendrina Mother (Chapter 1)", Callback = function()
    for i = 1, 10 do
        local preset = game.Workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Locks") then
            createESP(preset.Locks.Granny)
            createESP(preset.Locks.SlendrinaMother)
        end
    end
end})

ESP_Tab:CreateButton({ Name = "ESP Granny & Grandpa (Chapter 2)", Callback = function()
    for i = 1, 10 do
        local preset = game.Workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Locks") then
            createESP(preset.Locks.Granny)
            createESP(preset.Locks.Grandpa)
        end
    end
end})

ESP_Tab:CreateButton({ Name = "ESP Granny, Grandpa & Slendrina (Chapter 3)", Callback = function()
    for i = 1, 10 do
        local preset = game.Workspace:FindFirstChild("Preset" .. i)
        createESP(preset.Granny)
        createESP(preset.Grandpa)
        createESP(preset.Slendrina)
    end
end})
