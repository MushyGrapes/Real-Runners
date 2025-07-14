local Spawn = require(script.Parent.Spawn)


local Commands = {
    Config = {
        KEY = "!",
        Command = ""
    },

    ["spawn"] = Spawn.AddItem()
    
    
    
    
}

function Commands.Command(text) 
    if Commands[text] then
        Commands[text]()
    end
end
    
return Commands