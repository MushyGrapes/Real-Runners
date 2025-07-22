local Enemies = workspace.Enemies
local sec = 2

while true do
    task.wait(sec)
    for key, enemy in pairs(Enemies:GetChildren()) do
        if enemy then
            enemy:SetAttribute("Position", enemy.HumanoidRootPart.Position or Vector3.one)
        end
    end
end