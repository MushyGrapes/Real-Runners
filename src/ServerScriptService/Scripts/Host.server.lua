local Players = game:GetService("Players")
local Host = game:GetService("ReplicatedStorage").Remotes.Host

Players.PlayerAdded:Connect(function(plr)
    if #Players:GetPlayers() == 1 then
        Host:FireClient(plr, plr.UserId)
    end
    
end) 