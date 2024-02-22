return function()
	local WorkSpace = game:GetService("Workspace")
	local Replicated = game:GetService("ReplicatedStorage")
	local Events = Replicated.Events
	local Boolwait = false

	Events.JoinWait.OnClientEvent:Connect(function(playerjoinbool)
		if Boolwait == false then
			Events.JoinWait:FireServer(playerjoinbool)
			print("Event sent")
			Boolwait = true
		end
		task.wait(1)
		Boolwait = false
	end)
end
