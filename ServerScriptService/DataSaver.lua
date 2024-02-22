local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("PlayerData")


local function saveData(player)

	local tableToSave = {
		
	}

	local success, err = pcall(function()
		dataStore:SetAsync(player.UserId.."Test", tableToSave) -- Save the data with the player UserId, and the table we wanna save
	end)

	if success then -- If the data has been saved
		print("Data has been saved!")
	else -- Else if the save failed
		print("Data hasn't been saved!")
		warn(err)		
	end
end

game.Players.PlayerAdded:Connect(function(player)

	local DataFolder = Instance.new("Folder")
	DataFolder.Parent = player
	DataFolder.Name = "DataFolder"

	local PlayerInGame = Instance.new("BoolValue")
	PlayerInGame.Parent = DataFolder
	PlayerInGame.Name = "PlayerInGame"
	PlayerInGame.Value = false
	
	local PlayerInWait = Instance.new("BoolValue")
	PlayerInWait.Parent = DataFolder
	PlayerInWait.Name = "PlayerInWait"
	PlayerInWait.Value = false

	local data
	local success, err = pcall(function()

		data = dataStore:GetAsync(player.UserId.."Test")

	end)

	if success and data then

		

	else
		print("The player has no data!")
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local success, err  = pcall(function()
		saveData(player)
	end)

	if success then
		print("Data has been saved")
	else
		print("Data has not been saved!")
	end
end)

game:BindToClose(function() -- When the server shuts down
	for _, player in pairs(game.Players:GetPlayers()) do
		local success, err  = pcall(function()
			--saveData(player) -- Save the data
		end)

		if success then
			print("Data has been saved")
		else
			print("Data has not been saved!")
		end
	end
end)

