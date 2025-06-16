loadstring(game:HttpGet("https://github.com/AnTayScripts/Luxon/releases/download/Luxon/main.lua"))()

if not Luxon then
    warn("Download Luxon not found!")
    return
end

local window = Luxon:CreateWindow({
    Title = "Luxon Test UI",
    Icon = 99248017671800
})

local mainTab = Instance.new("TextButton")
mainTab.Size = UDim2.new(1, 0, 0, 40)
mainTab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainTab.Text = "Main Tab"
mainTab.Font = Enum.Font.Gotham
mainTab.TextSize = 16
mainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTab.Parent = window.TabBar

local uiList = Instance.new("UIListLayout")
uiList.Padding = UDim.new(0, 6)
uiList.SortOrder = Enum.SortOrder.LayoutOrder

local content = Instance.new("Frame")
content.Size = UDim2.new(1, 0, 1, 0)
content.BackgroundTransparency = 1
content.Parent = window.Content
uiList.Parent = content

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 30)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.Text = "Click Me"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.Gotham
button.TextSize = 14
button.LayoutOrder = 1
button.Parent = content
button.MouseButton1Click:Connect(function()
    print("Button clicked!")
end)

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0, 200, 0, 30)
toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.Gotham
toggle.TextSize = 14
toggle.Text = "Toggle: OFF"
toggle.LayoutOrder = 2
toggle.Parent = content

local toggleState = false
toggle.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    toggle.Text = "Toggle: " .. (toggleState and "ON" or "OFF")
end)

local slider = Instance.new("TextButton")
slider.Size = UDim2.new(0, 200, 0, 30)
slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
slider.TextColor3 = Color3.new(1, 1, 1)
slider.Font = Enum.Font.Gotham
slider.TextSize = 14
slider.Text = "Slider: 50"
slider.LayoutOrder = 3
slider.Parent = content

local sliderValue = 50
slider.MouseButton1Click:Connect(function()
    sliderValue = (sliderValue + 10) % 110
    slider.Text = "Slider: " .. tostring(sliderValue)
end)

local dropdown = Instance.new("TextButton")
dropdown.Size = UDim2.new(0, 200, 0, 30)
dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dropdown.Text = "Dropdown: Option1"
dropdown.TextColor3 = Color3.new(1, 1, 1)
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 14
dropdown.LayoutOrder = 4
dropdown.Parent = content

local options = {"Option1", "Option2", "Option3"}
local current = 1
dropdown.MouseButton1Click:Connect(function()
    current += 1
    if current > #options then current = 1 end
    dropdown.Text = "Dropdown: " .. options[current]
end)

local textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(0, 200, 0, 30)
textbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textbox.PlaceholderText = "Enter text..."
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 14
textbox.LayoutOrder = 5
textbox.Parent = content
textbox.FocusLost:Connect(function()
    print("TextBox input:", textbox.Text)
end)

local keybindBtn = Instance.new("TextButton")
keybindBtn.Size = UDim2.new(0, 200, 0, 30)
keybindBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
keybindBtn.Text = "Keybind: None"
keybindBtn.TextColor3 = Color3.new(1, 1, 1)
keybindBtn.Font = Enum.Font.Gotham
keybindBtn.TextSize = 14
keybindBtn.LayoutOrder = 6
keybindBtn.Parent = content

local UserInputService = game:GetService("UserInputService")
local binding = false
local boundKey = nil

keybindBtn.MouseButton1Click:Connect(function()
    binding = true
    keybindBtn.Text = "Press any key..."
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if binding and not gp and input.UserInputType == Enum.UserInputType.Keyboard then
        boundKey = input.KeyCode
        keybindBtn.Text = "Keybind: " .. tostring(boundKey.Name)
        binding = false
    elseif not binding and input.KeyCode == boundKey then
        print("Keybind triggered: ", boundKey.Name)
    end
end)

local colorBtn = Instance.new("TextButton")
colorBtn.Size = UDim2.new(0, 200, 0, 30)
colorBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
colorBtn.Text = "Color: Red"
colorBtn.TextColor3 = Color3.new(1, 1, 1)
colorBtn.Font = Enum.Font.Gotham
colorBtn.TextSize = 14
colorBtn.LayoutOrder = 7
colorBtn.Parent = content

local colors = {
    {Color3.fromRGB(255, 0, 0), "Red"},
    {Color3.fromRGB(0, 255, 0), "Green"},
    {Color3.fromRGB(0, 0, 255), "Blue"},
}
local colorIndex = 1
colorBtn.MouseButton1Click:Connect(function()
    colorIndex += 1
    if colorIndex > #colors then colorIndex = 1 end
    local col, name = unpack(colors[colorIndex])
    colorBtn.BackgroundColor3 = col
    colorBtn.Text = "Color: " .. name
end)
