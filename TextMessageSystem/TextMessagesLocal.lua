--// TextMessages Local Script

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TextMessages = require(ReplicatedStorage:WaitForChild('Modules'):FindFirstChild('TextMessagesModule'))

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local TextMessagesGui = Player.PlayerGui:WaitForChild('TextMessages')
local ScrollingFrame = TextMessagesGui:FindFirstChild('Holder'):FindFirstChild('ScrollingFrame')
local PlayerFrame = ReplicatedStorage:WaitForChild('Gui'):FindFirstChild('PlayerFrame')

local AddPlayerFrameEvent = ReplicatedStorage:WaitForChild('RemoteEvents'):FindFirstChild('AddPlayerFrameEvent')

function AddPlayerFrames(frame, parent)
	local CurrentPlayers = Players:GetChildren()
	
	for _, child in pairs(CurrentPlayers) do
		
		local SearchedPlayer = TextMessages.SearchPlayerFramesTable(child)
		if SearchedPlayer then continue end
		
		TextMessages.AddToPlayerFrames(child)
		
		local Frame = frame:Clone()
		Frame.Name = child.Name
		Frame.Parent = parent

		local Label = Frame['PlayerLabel']
		Label.Text = child.Name
	end
end

while true do
	AddPlayerFrames(PlayerFrame, ScrollingFrame) 
	wait(6)
end