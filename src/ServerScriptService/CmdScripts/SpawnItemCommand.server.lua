local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local SpawnItemCommand = TextChatService.Commands.SpawnItemCommand

SpawnItemCommand.Triggered:Connect(function(textSource, messsage)
    local Player = Players:GetPlayerByUserId(textSource.UserId)
    local Character = Player.Character or nil
    local item 

    for key, asset in pairs(ReplicatedStorage.Assets:GetChildren()) do 
        if string.match(messsage, asset.Name) then
            item = asset:Clone(); break 
        end
    end

    item.Parent = workspace
    item:PivotTo(Character.PrimaryPart.CFrame * CFrame.new(0,1,-5))
    
end)