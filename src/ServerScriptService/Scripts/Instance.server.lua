local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InstanceRemote = ReplicatedStorage.Remotes.Instance


function onFire(plr, item)
    if table.find(ReplicatedStorage.Assets:GetChildren(), item) then
        item = item:Clone()
        item.Parent = workspace
        item:PivotTo(plr.Character:GetPivot() * CFrame.new(0,5,-5), CFrame.new(0,0,0))
    end
    print(item)
end
InstanceRemote.OnServerEvent:Connect(onFire)