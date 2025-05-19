
-- Double Down 秒赢外挂主脚本 - 原神UI风格集成
-- 包含所有已完成小游戏模块 + UI + 防检测系统

-- 防检测系统加载（伪装身份、屏蔽常见检测）
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" then
            return
        end
        return old(self, ...)
    end)
end)

-- UI 初始化
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "GenshinStyleHub"

-- 主面板
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- 标题
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Double Down 秒赢外挂 Hub - 原神风"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.BackgroundTransparency = 1

-- 按钮模板函数
local function createButton(name, parent, posY, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 20
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Obby 模块
local function winObby()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name:lower():find("end") then
            game.Players.LocalPlayer.Character:MoveTo(v.Position + Vector3.new(0, 3, 0))
        end
    end
end

-- Jump Rope 模块
local function winJumpRope()
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(0, 1000, 0))
end

-- RPS 模块
local function winRPS()
    local rps = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("RPSChoice")
    if rps then rps:FireServer("Rock") end
end

-- TicTacToe 模块
local function winTTT()
    local rep = game:GetService("ReplicatedStorage")
    local board = rep:FindFirstChild("TTTMove")
    if board then
        for i = 1, 9 do
            board:FireServer(i)
        end
    end
end

-- Rush TicTacToe 模块
local function winRushTTT()
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
    local rush = remotes and remotes:FindFirstChild("RushTTT")
    if rush then
        for i = 1, 9 do
            rush:FireServer(i)
        end
    end
end

-- 添加按钮
createButton("秒赢 Obby", MainFrame, 60, winObby)
createButton("秒赢 Jump Rope", MainFrame, 110, winJumpRope)
createButton("秒赢 RPS", MainFrame, 160, winRPS)
createButton("秒赢 Tic Tac Toe", MainFrame, 210, winTTT)
createButton("秒赢 Rush TTT", MainFrame, 260, winRushTTT)
