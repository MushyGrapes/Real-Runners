local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local AI = ReplicatedStorage.Scripts.AI


function newEnemy(child)
    for key, enemy in pairs(Workspace._Map:GetChildren()) do 
        if enemy:IsA("Model") then
            AI:Clone().Parent = enemy;
            if key >= #Workspace._Map:GetChildren() then
                break
            end
        end    
    end

end
Workspace._Map.ChildAdded:Connect(newEnemy)