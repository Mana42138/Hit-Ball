local WorkSpace = game:GetService("Workspace")
local Replicated = game:GetService("ReplicatedStorage")
local Events = Replicated.Events

local TotalPlayerCount = 0
local MinPlayerCount = 1
local CountDownTime = 20


local CanStartCountdown = false

Events.JoinWait.OnServerEvent:Connect(function(player, joinbool)
	player.DataFolder.PlayerInWait.Value = joinbool
	if joinbool then
		TotalPlayerCount += 1
	else
		TotalPlayerCount -= 1
	end
	
	if TotalPlayerCount >= MinPlayerCount then
		if CanStartCountdown == false then
		print("Starting countdown!")
		CanStartCountdown = true
			for i = CountDownTime,0,-1 do
				if CanStartCountdown == false then break end
				for i1,v1 in pairs(game:GetService("Players"):GetPlayers()) do
					if i == 0 then
						v1.PlayerGui.Billboards.GameTimer.GameFrame.GameStartTimer.Text = "Starting Game..."
						if v1.DataFolder.PlayerInWait.Value == true then
							wait(1)
							v1.Character.HumanoidRootPart.CFrame = CFrame.new(25.5401611, 0.5, -7.53894043, 1, 0, 0, 0, 1, 0, 0, 0, 1)
							v1.PlayerGui.Billboards.GameTimer.GameFrame.GameStartTimer.Text = "Wating for players"
						end
					else
						v1.PlayerGui.Billboards.GameTimer.GameFrame.GameStartTimer.Text = i
					end
				end
				wait(1)
			end
		end
	else
		CanStartCountdown = false
	end
	wait(.5)
end)
