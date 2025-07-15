local ReplicatedStorage = game:GetService("ReplicatedStorage")
local consoleCmds = {}


function consoleCmds.spawnItem(text)
    for key, asset in pairs(ReplicatedStorage.Assets:GetChildren()) do
        if string.match(text, asset.Name) then print("Instace this item into workspace.") end
    end

end















return consoleCmds