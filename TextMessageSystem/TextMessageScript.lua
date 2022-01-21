local TextMessages = require(game:GetService('ReplicatedStorage'):WaitForChild('TextMessagesModule'))

game.Players.PlayerAdded:Connect(function(player)
	TextMessages.AddPlayer(player)
end)

game.Players.PlayerRemoving:Connect(function(player)
	TextMessages.RemovePlayer(player)
end)
