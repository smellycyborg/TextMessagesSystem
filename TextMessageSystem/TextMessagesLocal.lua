--// TextMessages Local Script

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TextMessages = require(ReplicatedStorage:WaitForChild('Modules'):FindFirstChild('TextMessagesModule'))

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local TextMessagesGui = Player.PlayerGui:WaitForChild('TextMessages')
local ScrollingFrame = TextMessagesGui:FindFirstChild('Holder'):FindFirstChild('ScrollingFrame')
local PlayerFrame = ReplicatedStorage:WaitForChild('Gui'):FindFirstChild('PlayerFrame')

local AddPlayerFrameEvent = ReplicatedStorage:WaitForChild('RemoteEvents'):FindFirstChild('AddPlayerFrameEvent')

function AddPlayerFrames()
	local CurrentPlayers = Players:GetChildren()
	
	TextMessages.AddPlayerFrameToScrollingFrame(Player, CurrentPlayers, PlayerFrame, ScrollingFrame)
end

while true do
	AddPlayerFrames() 
	wait(6)
end