--// TextMessages Remotes, ReplicatedStorages

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TextMessagesEvent = ReplicatedStorage:WaitForChild('RemoteEvents'):FindFirstChild('TextMessagesEvent')

--// TextMessages Module

local TextMessages = {}

TextMessages.PlayersTable = {}

function TextMessages.AddPlayer(player)
	if not player then return end
	if table.find(TextMessages.PlayersTable, player) then return end
	
	table.insert(TextMessages.PlayersTable, player)
	
	print(TextMessages.PlayersTable)
end

function TextMessages.FindPlayer(player)
	if not player then return end
	
	for index, child in pairs(TextMessages.PlayersTable) do
		if child == player then
			return index
		end
	end
end

function TextMessages.RemovePlayer(player)
	if not player then return end
	if table.find(TextMessages.PlayersTable, player) == nil then return end
	
	local PlayerIndex = TextMessages.FindPlayer(player)
	
	table.remove(TextMessages.PlayersTable, PlayerIndex)
	
	print(TextMessages.PlayersTable)
end

function TextMessages.SendTextMessage(player, message)
	if not player or message then return end
	
	TextMessagesEvent:FireClient(player, message)
end

return TextMessages
