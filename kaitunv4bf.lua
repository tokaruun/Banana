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
titleLabel.Text = " Kaitun V4 Blox Fruit  "
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
	getgenv().NewUI = true

	local success, result = pcall(function()
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-KaitunV4"))()
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

