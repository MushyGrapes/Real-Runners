local consoleCmds = require(game:GetService("ReplicatedStorage").Scripts.Console.consoleCmds)
local Commands = require(game:GetService("ReplicatedStorage").Scripts.Console.Commands)
local TextService =  game:GetService("TextChatService")


function MessageSent(message)
    for str= 1, #Commands do
        if string.match(message.Text, Commands[str]) then consoleCmds.spawnItem(message.Text); break end
    end

end
TextService.MessageReceived:Connect(MessageSent)