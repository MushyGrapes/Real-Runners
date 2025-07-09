local players = game:GetService("Players")
local ss = game:GetService("ServerStorage")
local Detection = ss.assets.Detection
local pullers = ss.assets.pullers:clone()







local function onPlayerAdded(plr)
	plr.CharacterAdded:Connect(function(char)
		local clone = Detection:Clone()
		clone.Parent = char
		clone.ManualWeld.Part1 = char.HumanoidRootPart
		pullers.Parent = char
		pullers.Weld.Part1 = char.HumanoidRootPart
	end)
end









players.PlayerAdded:Connect(onPlayerAdded)