-- TODO:  rewrite

--// TextMessages Remotes, ReplicatedStorages

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local TextMessagesEvent = ReplicatedStorage:WaitForChild('RemoteEvents'):FindFirstChild('TextMessagesEvent')

--// TextMessages Module

local TextMessages = {}

--// Server Table

TextMessages.PlayersTable = {}

--// Local Table

TextMessages.PlayerFramesTable = {}

--// Server Functions

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

function TextMessages.GetAllPlayersFromPlayersTable()
	local funcTable = {}
	for index, child in pairs(TextMessages.PlayersTable) do
		table.insert(funcTable, child)
	end
	print(funcTable)
	return funcTable
end

--// Local Functions

TextMessages.AddToPlayerFrames = function(player)
	if not player then return end
	
	local FoundPlayer = table.find(TextMessages.PlayerFramesTable, player)
	if FoundPlayer then return end
	
	table.insert(TextMessages.PlayerFramesTable, player)
	
	print(TextMessages.PlayerFramesTable)
end

TextMessages.AddPlayerFrameToScrollingFrame = function(player, players, frame, parent)
	for _, child in pairs(players) do
		--local ChildIsEqualToPlayer = child == player
		--if ChildIsEqualToPlayer then continue end

		--local SearchedPlayer = TextMessages.SearchPlayerFramesTable(child)
		--if SearchedPlayer then continue end

		TextMessages.AddToPlayerFrames(child)

		local Frame = frame:Clone()
		Frame.Name = child.Name
		Frame.Parent = parent

		local Label = Frame['PlayerLabel']
		Label.Text = child.Name
		
		local MessageButton = Frame['MessageButton']
		MessageButton:SetAttribute('Player', child.Name)
		
		
	end
end

TextMessages.SearchPlayerFramesTable = function(player)
	if not player then return end
	
	for _, child in pairs(TextMessages.PlayerFramesTable) do
		if child == player then 
			return true
		else
			return false
		end
	end
end

TextMessages.GetPlayer = function(PlayerName, players)
	for _, child in pairs(players) do
		local PlayerNameIsEqualToPlayer = PlayerName == child.Name
		if PlayerNameIsEqualToPlayer then
			return child
		end
	end
end

-- TODO need to set up this script right quick
TextMessages.MessageContact = function(ContactsFrame, MessageFrame, ContactLabel, Button)
	local PlayerName = Button:GetAttribute('Player')
	ContactsFrame.Visible = false
	MessageFrame.Visible = true
	ContactLabel.Text = PlayerName
end

-- TODO: need to set up this script after ui
TextMessages.SendTextMessage = function(player, message)
	if not player or message then return end

	TextMessagesEvent:FireClient(player, message)
end

TextMessages.ButtonsClicked = function(frame)
	frame.Visible = not frame.Visible
end

--TextMessages.MessageContactButtonsHandler = function(ContactsFrame, MessageFrame, ContactLabel)
--	local DescendantsOfContactsFrame = ContactsFrame:GetDescendants()
	
--	for _, child in pairs(DescendantsOfContactsFrame) do
--		local ChildIsATextButton = child:IsA('TextButton')
		
--		if ChildIsATextButton then
--			child.MouseButton1Down:Connect(function()
--				TextMessages.MessageContact(ContactsFrame, MessageFrame, ContactLabel, child)
--			end)
--		end
--	end	
--end

return TextMessages
