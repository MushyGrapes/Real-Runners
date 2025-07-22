local GameSingleton = require(game:GetService("ReplicatedStorage").GameSingleton)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Send = ReplicatedStorage.Remotes.Send
local Enemies = ReplicatedStorage.Assets.Enemies
local ConCurrentEnemies = {}

Send.OnServerEvent:Connect(function(plr, ...)
    local arg = ...
    local EnemyNum = arg[1]
    local Positions = arg[2]
    local Id = arg[3]
    local Enemy

    for key, enemy in pairs(Enemies:GetChildren()) do
        task.wait(0.5)
        if enemy:GetAttribute("Id") == Id then
            Enemy = enemy:Clone() break
        end
    end
    
    Enemy:RemoveTag("Local")
    Enemy.Parent = workspace.Enemies
    Enemy.HumanoidRootPart:SetNetworkOwner(plr)
end)