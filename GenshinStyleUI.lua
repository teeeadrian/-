-- 原神风 UI + 初始化配置
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "GenshinStyleHub"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 420, 0, 520)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UIStroke.Parent = MainFrame
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2

UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

local function createSection(title)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -20, 0, 30)
	frame.BackgroundColor3 = Color3.fromRGB(50, 55, 70)
	frame.Parent = MainFrame
	local corner = Instance.new("UICorner", frame)
	local label = Instance.new("TextLabel")
	label.Parent = frame
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = title
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.GothamSemibold
	label.TextScaled = true
	return frame
end
-- 跑酷 Obby 秒赢
local obbyFrame = createSection("Obby")
local obbyButton = Instance.new("TextButton", obbyFrame)
obbyButton.Size = UDim2.new(0.5, 0, 1, 0)
obbyButton.Position = UDim2.new(0, 0, 0, 0)
obbyButton.Text = "飞行通关"
obbyButton.Font = Enum.Font.Gotham
obbyButton.TextScaled = true
obbyButton.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
obbyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
obbyButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(Vector3.new(0, 1000, 0)) -- 临时传送点
        end
    end
end)

-- 跳绳 Jump Rope 秒赢
local jumpFrame = createSection("Jump Rope")
local jumpButton = Instance.new("TextButton", jumpFrame)
jumpButton.Size = UDim2.new(0.5, 0, 1, 0)
jumpButton.Position = UDim2.new(0, 0, 0, 0)
jumpButton.Text = "飞到绳外"
jumpButton.Font = Enum.Font.Gotham
jumpButton.TextScaled = true
jumpButton.BackgroundColor3 = Color3.fromRGB(80, 255, 140)
jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpButton.MouseButton1Click:Connect(function()
    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 20)
    end
end)
-- 石头剪刀布 RPS 秒赢
local rpsFrame = createSection("石头剪刀布")
local rpsButton = Instance.new("TextButton", rpsFrame)
rpsButton.Size = UDim2.new(0.5, 0, 1, 0)
rpsButton.Position = UDim2.new(0, 0, 0, 0)
rpsButton.Text = "自动获胜"
rpsButton.Font = Enum.Font.Gotham
rpsButton.TextScaled = true
rpsButton.BackgroundColor3 = Color3.fromRGB(255, 140, 100)
rpsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rpsButton.MouseButton1Click:Connect(function()
    local args = {
        [1] = "Rock" -- 或根据服务器逻辑，直接调用正确 RPC
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end)

-- 井字棋 Tic Tac Toe 秒赢
local tttFrame = createSection("井字棋")
local tttButton = Instance.new("TextButton", tttFrame)
tttButton.Size = UDim2.new(0.5, 0, 1, 0)
tttButton.Position = UDim2.new(0, 0, 0, 0)
tttButton.Text = "自动连线"
tttButton.Font = Enum.Font.Gotham
tttButton.TextScaled = true
tttButton.BackgroundColor3 = Color3.fromRGB(255, 200, 50)
tttButton.TextColor3 = Color3.fromRGB(0, 0, 0)
tttButton.MouseButton1Click:Connect(function()
    for i = 1, 3 do
        local cell = game:GetService("Workspace"):FindFirstChild("Cell"..i)
        if cell then
            fireclickdetector(cell:FindFirstChildOfClass("ClickDetector"))
        end
    end
end)
-- Rush Tic Tac Toe 自动胜利
local rushTTTFrame = createSection("Rush 井字棋")
local rushTTTButton = Instance.new("TextButton", rushTTTFrame)
rushTTTButton.Size = UDim2.new(0.5, 0, 1, 0)
rushTTTButton.Position = UDim2.new(0, 0, 0, 0)
rushTTTButton.Text = "智能填格"
rushTTTButton.Font = Enum.Font.Gotham
rushTTTButton.TextScaled = true
rushTTTButton.BackgroundColor3 = Color3.fromRGB(100, 255, 180)
rushTTTButton.TextColor3 = Color3.fromRGB(0, 0, 0)
rushTTTButton.MouseButton1Click:Connect(function()
    for _, cell in pairs(workspace:GetChildren()) do
        if cell:IsA("Part") and cell.Name:match("^Cell%d+$") then
            if not cell:FindFirstChild("Mark") then
                fireclickdetector(cell:FindFirstChildOfClass("ClickDetector"))
                break
            end
        end
    end
end)

-- 关闭 UI 按钮
local closeBtn = Instance.new("ImageButton", mainFrame)
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -36, 0, 4)
closeBtn.BackgroundTransparency = 1
closeBtn.Image = "rbxassetid://3926305904"
closeBtn.ImageRectOffset = Vector2.new(284, 4)
closeBtn.ImageRectSize = Vector2.new(24, 24)
closeBtn.MouseButton1Click:Connect(function()
    main:Destroy()
end)
-- 可拖动 UI
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- 缩放支持
local resizeCorner = Instance.new("Frame", main)
resizeCorner.AnchorPoint = Vector2.new(1, 1)
resizeCorner.Position = UDim2.new(1, 0, 1, 0)
resizeCorner.Size = UDim2.new(0, 16, 0, 16)
resizeCorner.BackgroundColor3 = Color3.new(1, 1, 1)
resizeCorner.BackgroundTransparency = 1
resizeCorner.Name = "ResizeCorner"

local draggingResize = false
resizeCorner.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingResize = true
		dragStart = input.Position
		startSize = mainFrame.Size
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingResize = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if draggingResize and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Size = UDim2.new(startSize.X.Scale, startSize.X.Offset + delta.X, startSize.Y.Scale, startSize.Y.Offset + delta.Y)
	end
end)

-- 模块完结提示
warn("脚本初始化完成，原神风格 UI 成功加载，支持：Obby、Jump Rope、RPS、Tic Tac Toe、Rush Tic Tac Toe")
