local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local GuiService = game:GetService("GuiService")

local ScreamerGui = Instance.new("ScreenGui")
local LoadingFrame = Instance.new("Frame")
local ProgressBar = Instance.new("Frame")
local ProgressText = Instance.new("TextLabel")
local Sound = Instance.new("Sound")

ScreamerGui.Name = "ScreamerGui"
ScreamerGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreamerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreamerGui.ResetOnSpawn = false
ScreamerGui.IgnoreGuiInset = true
LoadingFrame.Parent = ScreamerGui
LoadingFrame.Size = UDim2.new(0.5, 0, 0.2, 0)
LoadingFrame.Position = UDim2.new(0.25, 0, 0.4, 0)
LoadingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
LoadingFrame.BorderSizePixel = 0

ProgressBar.Parent = LoadingFrame
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.new(1, 1, 1)
ProgressBar.BorderSizePixel = 0

ProgressText.Parent = LoadingFrame
ProgressText.Size = UDim2.new(1, 0, 1, 0)
ProgressText.Position = UDim2.new(0, 0, 0, 0)
ProgressText.BackgroundTransparency = 1
ProgressText.TextColor3 = Color3.new(1, 1, 1)
ProgressText.TextSize = 28
ProgressText.Font = Enum.Font.GothamBlack
ProgressText.TextStrokeTransparency = 0
ProgressText.Text = "กำลังโหลด script... 0%"

Sound.Parent = ScreamerGui
Sound.SoundId = "rbxassetid://8308107333"
Sound.Volume = 100
Sound.Looped = true

local function ShowLoading()
    for i = 0, 100 do
        ProgressBar.Size = UDim2.new(i / 100, 0, 1, 0)
        ProgressText.Text = "กำลังโหลด script... " .. i .. "%"
        wait(0.05)
    end
end

local function FlashEffect()
    local FlashFrame = Instance.new("Frame")
    FlashFrame.Parent = ScreamerGui
    FlashFrame.Size = UDim2.new(1, 0, 1, 0)  
    FlashFrame.Position = UDim2.new(0, 0, 0, 0)  
    FlashFrame.AnchorPoint = Vector2.new(0, 0)  
    FlashFrame.BackgroundColor3 = Color3.new(1, 1, 1)  
    FlashFrame.BorderSizePixel = 0
    FlashFrame.ZIndex = 999  
    
    print("FlashFrame Size:", FlashFrame.AbsoluteSize)
    print("FlashFrame Position:", FlashFrame.AbsolutePosition)

    Sound:Play()

    for i = 1, 20 do
        FlashFrame.BackgroundColor3 = Color3.new(0, 0, 0)
        wait(0.05)
        FlashFrame.BackgroundColor3 = Color3.new(1, 1, 1)
        wait(0.05)
    end

    LocalPlayer:Kick("You Are Banned\nReason Cheating/Exploit")
end

spawn(ShowLoading)
wait(8)
spawn(FlashEffect)
