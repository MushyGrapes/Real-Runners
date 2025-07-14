local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Commands = require(ReplicatedStorage.Scripts.Console.Commands)
local TextService =  game:GetService("TextChatService")

function MessageSent(message)
    print(message.Text)
    Commands.Command(message.Text)
end



TextService.MessageReceived:Connect(MessageSent)