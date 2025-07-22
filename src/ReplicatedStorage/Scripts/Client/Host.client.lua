local GameSingleton = require(game:GetService("ReplicatedStorage").GameSingleton)
local plr = game:GetService("Players").LocalPlayer
local Send = game:GetService("ReplicatedStorage").Remotes.Send
local Positions = {}
local NewEnemies = {}
local amount = 0

workspace.Enemies.ChildAdded:Connect(function(child)
    if not child:HasTag("Enemy") and not child:HasTag("Local") then
        return
    end

    if #NewEnemies >= GameSingleton.MaxEnemies then
        table.clear(NewEnemies) amount = 0 return
    end

    table.insert(Positions, child:GetAttribute("Position"))
    table.insert(NewEnemies, child.Name..amount)
    Send:FireServer({NewEnemies, Positions, child:GetAttribute("Id")})
    amount +=1
end)

