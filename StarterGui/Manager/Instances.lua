local Table = {}

local TweenService = game:GetService("TweenService")

local Player = game.Players.LocalPlayer

local function Animate(object)
	object.MouseEnter:Connect(function()
		TweenService:Create(
			object.UIScale,
			TweenInfo.new(.3, Enum.EasingStyle.Quad),
			{Scale = 1.05}
		):Play()
	end)

	object.MouseLeave:Connect(function()
		TweenService:Create(
			object.UIScale,
			TweenInfo.new(.3, Enum.EasingStyle.Quad),
			{Scale = 1}
		):Play()
	end)
	
	object.MouseButton1Click:Connect(function()
		TweenService:Create(
			object.UIScale,
			TweenInfo.new(.3, Enum.EasingStyle.Quad),
			{Scale = 0.88}
		):Play()
		task.wait(.1)
		TweenService:Create(
			object.UIScale,
			TweenInfo.new(.3, Enum.EasingStyle.Quad),
			{Scale = 1}
		):Play()
	end)
end

for i,v in pairs(Player.PlayerGui:GetDescendants()) do
	Table[v.Name] = v
	if v:IsA("TextButton") then
		if not v:FindFirstChildOfClass("UIScale") then
			-- Animate All buttons!
			local ui_scale = Instance.new("UIScale")
			ui_scale.Parent = v
			ui_scale.Scale = 1
			Animate(v)
		end
	end
end

return Table
