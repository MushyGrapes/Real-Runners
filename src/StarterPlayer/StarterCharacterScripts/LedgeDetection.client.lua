local player = game:GetService("Players").LocalPlayer
local char = player.Character
local hitbox = game:GetService("ReplicatedFirst").Hitbox:Clone()

hitbox.Parent = char
hitbox.ManualWeld.Part1 = char.HumanoidRootPart