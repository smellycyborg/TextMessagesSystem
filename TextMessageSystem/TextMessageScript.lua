--// TextMessages Server Script

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TextMessages = require(ReplicatedStorage:WaitForChild('Modules'):FindFirstChild('TextMessagesModule'))
local TextMessagesFunction = ReplicatedStorage:WaitForChild('RemoteFunctions'):FindFirstChild('TextMessagesFunction')

--// TextMessages Remote Function

TextMessagesFunction.OnServerInvoke = function(NotUsing, player, message)
	TextMessages.SendTextMessage(player, message)
end

--// TextMessages PlayersTable Handler

game.Players.PlayerAdded:Connect(function(player)
	TextMessages.AddPlayer(player)
end)

game.Players.PlayerRemoving:Connect(function(player)
	TextMessages.RemovePlayer(player)
end)
