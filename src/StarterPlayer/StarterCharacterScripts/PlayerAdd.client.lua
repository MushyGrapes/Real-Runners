local player = game:GetService("Players").LocalPlayer
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Detection = ReplicatedFirst.assets.Detection:Clone()
local pullers = ReplicatedFirst.assets.pullers:clone()
local char = player.Character or player.CharacterAdded:Wait()

local function onPlayerAdded()
	Detection.Parent = char
	Detection.ManualWeld.Part1 = char.HumanoidRootPart
	pullers.Parent = char
	pullers.Weld.Part1 = char.HumanoidRootPart
end
onPlayerAdded()