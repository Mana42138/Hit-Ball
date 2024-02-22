
--[[ AUTO EXECUTE MODULES ]] --
for i,v in pairs(script:GetChildren()) do
	if string.find(v.Name, "FUNC_") then
		require(v)()
	end
end


local Instances = require(script.Instances)

print(Instances)
