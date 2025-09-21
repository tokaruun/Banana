-- Tạo ScreenGui
-- Check for existing ScreenGui to prevent duplicates
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = playerGui:FindFirstChild("BananaHubGui")
if not screenGui then
	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "BananaHubGui"
	screenGui.Parent = playerGui
end

-- Create TextBox
local textBox = Instance.new("TextBox")
textBox.Parent = screenGui
textBox.Size = UDim2.new(0, 446, 0, 50)
textBox.Position = UDim2.new(0.360450566, 0, 0.256281406, 0)
textBox.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow text
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Dark gray background
textBox.BorderSizePixel = 0
textBox.Font = Enum.Font.SourceSansBold
textBox.TextSize = 20
textBox.PlaceholderText = "Enter key here"

-- Tạo TextLabel 
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = screenGui -- Fixed: Parent to screenGui, not StarterGui
titleLabel.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 0
titleLabel.Position = UDim2.new(0.372340411, 0, 0.0791457295, 0)
titleLabel.Size = UDim2.new(0, 407, 0, 50)
titleLabel.Font = Enum.Font.SourceSans
titleLabel.Text = " Kaitun Bloxfruit "
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
titleLabel.TextScaled = true
titleLabel.TextSize = 14
titleLabel.TextWrapped = true

-- Tạo TextLabel
local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Parent = screenGui
welcomeLabel.Size = UDim2.new(0, 460, 0, 86)
welcomeLabel.Position = UDim2.new(0.418648303, -100, 0.179648235, -25) -- Removed offset
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
welcomeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeLabel.BorderSizePixel = 0
welcomeLabel.Font = Enum.Font.SourceSansBold
welcomeLabel.TextSize = 20
welcomeLabel.Text = "Player: " .. player.Name .. "\nChào mừng bạn đến với Banana Hub. Nhập key để sử dụng."

-- Hàm keybnn để kiểm tra và chạy script
-- Function to validate and run script
local function keybnn(key)
	if key == "" then
		welcomeLabel.Text = "Error: Please enter a valid key."
		return
	end

	repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
	getgenv().Key = key
    getgenv().SettingFarm ={
        ["Hide UI"] = false,
        ["Reset Teleport"] = {
            ["Enabled"] = false,
            ["Delay Reset"] = 3,
            ["Item Dont Reset"] = {
                ["Fruit"] = {
                    ["Enabled"] = true,
                    ["All Fruit"] = true, 
                    ["Select Fruit"] = {
                        ["Enabled"] = false,
                        ["Fruit"] = {},
                    },
                },
            },
        },
        ["White Screen"] = false,
        ["Lock Fps"] = {
            ["Enabled"] = true,
            ["FPS"] = 5,
        },
        ["Get Items"] = {
            ["Saber"] = true,
            ["Godhuman"] =  true,
            ["Skull Guitar"] = true,
            ["Mirror Fractal"] = true,
            ["Cursed Dual Katana"] = true,
            ["Upgrade Race V2-V3"] = true,
            ["Auto Pull Lever"] = true,
            ["Shark Anchor"] = true, --- if have cdk,sg,godhuman
        },
        ["Get Rare Items"] = {
            ["Rengoku"] = false,
            ["Dragon Trident"] = false, 
            ["Pole (1st Form)"] = false,
            ["Gravity Blade"]  = false,
        },
        ["Farm Fragments"] = {
            ["Enabled"]  = false,
            ["Fragment"] = 50000,
        },
        ["Auto Chat"] = {
            ["Enabled"] = false,
            ["Text"] = "",
        },
        ["Auto Summon Rip Indra"] = true, --- auto buy haki and craft haki legendary 
        ["Select Hop"] = { -- 70% will have it
            ["Hop Server If Have Player Near"] = false, 
            ["Hop Find Rip Indra Get Valkyrie Helm or Get Tushita"] = true, 
            ["Hop Find Dough King Get Mirror Fractal"] = true,
            ["Hop Find Raids Castle [CDK]"] = true,
            ["Hop Find Cake Queen [CDK]"] = true,
            ["Hop Find Soul Reaper [CDK]"] = true,
            ["Hop Find Darkbeard [SG]"] = true,
            ["Hop Find Mirage [ Pull Lever ]"] = false,
        },
        ["Farm Mastery"] = {
            ["Melee"] = false,
            ["Sword"] = false,
        },
        ["Buy Haki"] = {
            ["Enhancement"] = false,
            ["Skyjump"] = true,
            ["Flash Step"] = true,
            ["Observation"] = true,
        },
        ["Sniper Fruit Shop"] = {
            ["Enabled"] = true, -- Auto Buy Fruit in Shop Mirage and Normal
            ["Fruit"] = {"Leopard-Leopard","Kitsune-Kitsune","Dragon-Dragon","Yeti-Yeti","Gas-Gas"},
        },
        ["Lock Fruit"] = {},
        ["Webhook"] = {
            ["Enabled"] = false,
            ["WebhookUrl"] = "",
        }
    }

	local success, result = pcall(function()
		   retunrn loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua"))()
	end)

	if success then
		welcomeLabel.Text = "Script loaded successfully!"
		wait(2)
		screenGui:Destroy() -- Clean up GUI
	else
		welcomeLabel.Text = "Error loading script: " .. tostring(result)
	end
end

-- Sự kiện khi người chơi nhập và nhấn Enter
textBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local inputKey = textBox.Text
		keybnn(inputKey)
		textBox.Text = "" -- Clear input
	end
end)

