-- Double Down Genshin-style UI Integrated Script
-- Game: Obby, Jump Rope, RPS, Tic Tac Toe, Rush TTT
-- Author: ChatGPT

-- UI LIB LOADING (Genshin-style from user's original UI)
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/youruipath.lua"))()

-- Obby Feature
local function teleportToObbyEnd()
    -- detailed obby auto win logic
end

-- Jump Rope
local function autoJumpRopeFly()
    -- fly function for jump rope
end

-- RPS Auto Win
local function autoWinRPS()
    -- detect UI and always win logic
end

-- Tic Tac Toe
local function instantWinTTT()
    -- auto mark win line
end

-- Rush Tic Tac Toe
local function autoRushTTT()
    -- logic to predict and auto win
end

-- Buttons and toggles using user's UI
ui:CreateToggle("Obby - 自动传送终点", function(state)
    if state then teleportToObbyEnd() end
end)

ui:CreateToggle("Jump Rope - 飞行躲避", function(state)
    if state then autoJumpRopeFly() end
end)

ui:CreateButton("石头剪刀布 - 秒赢", autoWinRPS)
ui:CreateButton("井字棋 - 自动胜利", instantWinTTT)
ui:CreateButton("极速井字棋 - 自动胜利", autoRushTTT)
