--!nocheck
local normal_zombie = game:GetService("ServerStorage").assets.normal_zombie
local zombies = {}


for i = 1,5 do
    table.insert(zombies,normal_zombie:Clone())
    zombies[i].Parent = workspace
end

while wait(0.1) do
    for num in pairs(zombies) do
       zombies[num].Humanoid.MoveTo(zombies[num].Humanoid, Vector3.new(5,5,5))
    end
end