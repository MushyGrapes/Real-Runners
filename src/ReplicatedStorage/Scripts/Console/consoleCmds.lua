local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InstanceRemote = ReplicatedStorage.Remotes.Instance
local consoleCmds = {}


function consoleCmds.spawnItem(text, person)
    for key, asset in pairs(ReplicatedStorage.Assets:GetChildren()) do
        if string.match(text, asset.Name) then InstanceRemote:FireServer(asset); break end
    end

end















return consoleCmds