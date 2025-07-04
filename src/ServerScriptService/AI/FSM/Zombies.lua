local Zombies = {}
Zombies.config = {}
Zombies.config.max = 5
Zombies.config.enemies = {}
local zombie = game:GetService("ServerStorage").assets.normal_zombie

function zomb()
    for zomb = 1, Zombies.config.max,1 do
	    local z = zombie:Clone()
	    z.Parent = workspace
	    table.insert(Zombies.config.enemies,z)
    end
end
zomb()











return Zombies