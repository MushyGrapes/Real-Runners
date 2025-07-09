local enemies = workspace:WaitForChild("_Map").enemies
local folder = game:GetService("ReplicatedFirst").AI

task.wait(5)
for key, enemy in enemies:GetChildren() do
    local f = folder:Clone()
    f.Parent = enemy
    f.FSMmanager.Enabled = true
end