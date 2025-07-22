local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local onHost = ReplicatedStorage:WaitForChild("Remotes").Host
local Host = ReplicatedStorage.Scripts.Client.Host

onHost.OnClientEvent:Connect(function(id)
	if not id then error("ID nil.",1) return end
    
    local plr = Players:GetPlayerByUserId(id)
    Host:Clone().Parent = plr.CharacterAdded:Wait()
end)