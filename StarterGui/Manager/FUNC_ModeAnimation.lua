

return function()
	local TweenService = game:GetService("TweenService")
	local Instances = require(script.Parent.Instances)
	
	local Grad = Instances.Standard.UIGradient
	local frames = 50
	local speed = 0.01

	local function colour_change(color, keypoint)
		local originalColour = Grad.Color.Keypoints[keypoint + 1].Value
		local sequence
		for i = frames, 0, -1 do
			task.wait(speed)

			local x = math.sqrt((i - frames) ^ 2) / frames

			if keypoint == 0 then
				sequence = ColorSequence.new {
					ColorSequenceKeypoint.new(0, originalColour:Lerp(color, x)),
					ColorSequenceKeypoint.new(1, Grad.Color.Keypoints[2].Value)
				}
			else
				sequence = ColorSequence.new {
					ColorSequenceKeypoint.new(0, Grad.Color.Keypoints[1].Value),
					ColorSequenceKeypoint.new(1, originalColour:Lerp(color, x))
				}
			end

			Grad.Color = sequence
		end
	end

	spawn(function()
		while true do
			colour_change(Color3.fromRGB(255, math.random(70, 200), 33), 0)
			colour_change(Color3.fromRGB(255, math.random(70, 200), 15), 1)
			task.wait(math.random(.3, .5))
		end
	end)
	
	local Grad = Instances.Pro.UIGradient
	local frames = 50
	local speed = 0.01

	local function colour_change2(color, keypoint)
		local originalColour = Grad.Color.Keypoints[keypoint + 1].Value
		local sequence
		for i = frames, 0, -1 do
			task.wait(speed)

			local x = math.sqrt((i - frames) ^ 2) / frames

			if keypoint == 0 then
				sequence = ColorSequence.new {
					ColorSequenceKeypoint.new(0, originalColour:Lerp(color, x)),
					ColorSequenceKeypoint.new(1, Grad.Color.Keypoints[2].Value)
				}
			else
				sequence = ColorSequence.new {
					ColorSequenceKeypoint.new(0, Grad.Color.Keypoints[1].Value),
					ColorSequenceKeypoint.new(1, originalColour:Lerp(color, x))
				}
			end

			Grad.Color = sequence
		end
	end
	
	spawn(function()
		while true do
			colour_change2(Color3.fromRGB(73, math.random(116, 150), math.random(195, 255)), 0)
			colour_change2(Color3.fromRGB(73, math.random(116, 150), math.random(195, 255)), 1)
			task.wait(math.random(.3, .5))
		end
	end)

	
end
