-- [[ THIS IS A MODULESCRIPT!!! ]] --

return function()
	local Instances = require(script.Parent.Instances)
	local TweenService = game:GetService("TweenService")
	
	local function CheckGame()
		if game.PlaceId == 16454130219 then
			Instances.Standard.Warning.Visible = true
			Instances.Standard.Background.Visible = true
		end
	end
	
	local function TweenModes(mode, bool, args)
		if bool == true then
			CheckGame()
			TweenService:Create(
				Instances[mode],
				TweenInfo.new(.5, Enum.EasingStyle.Quad),
				{Position = args.POS}
			):Play()
			TweenService:Create(
				Instances[mode],
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0}
			):Play()
			
			TweenService:Create(
				Instances[mode].Title,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{TextTransparency = 0}
			):Play()
			
			TweenService:Create(
				Instances[mode].Title.UIStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Transparency = 0}
			):Play()
			
			TweenService:Create(
				Instances[mode].UIStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Transparency = 0}
			):Play()
			TweenService:Create(
				Instances.TopBar,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Position = UDim2.new(0, 0, -0.065, 0)}
			):Play()
			TweenService:Create(
				Instances.Modes.Background,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 0.68}
			):Play()
		else
			TweenService:Create(
				Instances[mode],
				TweenInfo.new(.5, Enum.EasingStyle.Quad),
				{Position = args.POS}
			):Play()
			TweenService:Create(
				Instances[mode],
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			):Play()
			
			TweenService:Create(
				Instances[mode].Title,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{TextTransparency = 1}
			):Play()
			
			TweenService:Create(
				Instances[mode].Title.UIStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Transparency = 1}
			):Play()
			
			TweenService:Create(
				Instances[mode].UIStroke,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Transparency = 1}
			):Play()
			
			TweenService:Create(
				Instances.TopBar,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{Position = UDim2.new(0, 0, -0.3, 0)}
			):Play()
			
			TweenService:Create(
				Instances.Modes.Background,
				TweenInfo.new(.3, Enum.EasingStyle.Quad),
				{BackgroundTransparency = 1}
			):Play()
			
			Instances[mode].Warning.Visible = false
			Instances[mode].Background.Visible = false
		end
	end
	
	Instances.Play.MouseButton1Click:Connect(function()
		spawn(function()
			TweenModes("Standard", true, {
				POS = UDim2.new(0.402, 0, 0.663, 0)
			})
			task.wait(.1)
			TweenModes("Pro", true, {
				POS = UDim2.new(0.614, 0, 0.663, 0)
			})
		end)
	end)
	
	Instances.TBack.MouseButton1Click:Connect(function()
		spawn(function()
			TweenModes("Standard", false, {
				POS = UDim2.new(0.402, 0, 0.843, 0)
			})
			task.wait(.1)
			TweenModes("Pro", false, {
				POS = UDim2.new(0.614, 0, 0.843, 0)
			})
			task.wait(.6)
		end)
	end)
	
end

