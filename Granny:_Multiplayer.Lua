--Granny Script
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

-- Function to create ESP
local function createESP(object, color)
    if object and not object:FindFirstChild("ESP") then
        local highlight = Instance.new("Highlight")
        highlight.Parent = object
        highlight.Name = "ESP"
        highlight.FillColor = color
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.OutlineTransparency = 0.5
    end
end

-- ESP Functions
local function espGranny()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Locks") and preset.Locks:FindFirstChild("Granny") then
            createESP(preset.Locks.Granny, Color3.fromRGB(255, 0, 0)) -- Red
        end
    end
end

local function espGrandpa()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Locks") and preset.Locks:FindFirstChild("Grandpa") then
            createESP(preset.Locks.Grandpa, Color3.fromRGB(0, 255, 0)) -- Green
        end
    end
end

local function espSlendrinaMother()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Locks") and preset.Locks:FindFirstChild("SlendrinaMother") then
            createESP(preset.Locks.SlendrinaMother, Color3.fromRGB(0, 0, 255)) -- Blue
        end
    end
end

local function espGranny_Chapter3()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Granny") then
            createESP(preset.Granny, Color3.fromRGB(255, 0, 0)) -- Red
        end
    end
end

local function espGrandpa_Chapter3()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Grandpa") then
            createESP(preset.Grandpa, Color3.fromRGB(0, 255, 0)) -- Green
        end
    end
end

local function espSlendrina_Chapter3()
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Slendrina") then
            createESP(preset.Slendrina, Color3.fromRGB(255, 255, 0)) -- Yellow
        end
    end
end

-- ESP Tab
local ESP_Tab = Window:CreateTab("ESP", 4483362458)

local ESP_Chapter1 = ESP_Tab:CreateSection("Chapter 1 ESP")
ESP_Tab:CreateButton({ Name = "ESP Granny", Callback = espGranny })
ESP_Tab:CreateButton({ Name = "ESP Slendrina Mother", Callback = espSlendrinaMother })

local ESP_Chapter2 = ESP_Tab:CreateSection("Chapter 2 ESP")
ESP_Tab:CreateButton({ Name = "ESP Granny (Chapter 2)", Callback = espGranny })
ESP_Tab:CreateButton({ Name = "ESP Grandpa", Callback = espGrandpa })

local ESP_Chapter3 = ESP_Tab:CreateSection("Chapter 3 ESP")
ESP_Tab:CreateButton({ Name = "ESP Granny (Chapter 3)", Callback = espGranny_Chapter3 })
ESP_Tab:CreateButton({ Name = "ESP Grandpa (Chapter 3)", Callback = espGrandpa_Chapter3 })
ESP_Tab:CreateButton({ Name = "ESP Slendrina (Chapter 3)", Callback = espSlendrina_Chapter3 })

-- Item System
local function get(name)
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild(name) then
            preset:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
        end
    end
end

local function ammo(name)
    for i = 1, 10 do
        local preset = game.workspace:FindFirstChild("Preset" .. i)
        if preset and preset:FindFirstChild("Ammo") and preset.Ammo:FindFirstChild(name) then
            preset.Ammo:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
        end
    end
end

local function weapon(name)
    local General = game.workspace:FindFirstChild("General Items")
    if General and General:FindFirstChild(name) then
        General:FindFirstChild(name).InteractRemote:FireServer(game.Players.LocalPlayer)
    end
end

-- Create UI Elements for Items
local Item_Tab = Window:CreateTab("Chapter 1 - 3", 4483362458)
local Item_Section = Item_Tab:CreateSection("Get Items")

local ItemInput = Item_Tab:CreateInput({
    Name = "Input Item Name",
    PlaceholderText = "Input full name",
    Flag = "ItemInput",
    Callback = function(Text) end
})

local AmmoInput = Item_Tab:CreateInput({
    Name = "Input Ammo/bullet",
    PlaceholderText = "Input full name",
    Flag = "AmmoInput",
    Callback = function(Text) end
})

local WeaponInput = Item_Tab:CreateInput({
    Name = "Input Weapon Name",
    PlaceholderText = "Input full name",
    Flag = "WeaponInput",
    Callback = function(Text) end
})

Item_Tab:CreateButton({
    Name = "Get Item",
    Callback = function()
        if ItemInput.CurrentValue ~= "" then get(ItemInput.CurrentValue) else
            Rayfield:Notify({ Title = "Error", Content = "Enter an item name!", Duration = 3, Type = "Warning" })
        end
    end,
})

Item_Tab:CreateButton({
    Name = "Get Ammo",
    Callback = function()
        if AmmoInput.CurrentValue ~= "" then ammo(AmmoInput.CurrentValue) else
            Rayfield:Notify({ Title = "Error", Content = "Enter an ammo name!", Duration = 3, Type = "Warning" })
        end
    end,
})

Item_Tab:CreateButton({
    Name = "Get Weapon",
    Callback = function()
        if WeaponInput.CurrentValue ~= "" then weapon(WeaponInput.CurrentValue) else
            Rayfield:Notify({ Title = "Error", Content = "Enter a weapon name!", Duration = 3, Type = "Warning" })
        end
    end,
})
