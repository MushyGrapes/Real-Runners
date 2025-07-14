local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Spawn = {}


function Spawn.AddItem(Item)
    local Clone = nil or ReplicatedStorage.Assets[Item]
    if not Clone then
        return
    end

    Clone.Parent = workspace
end















return Spawn