--!nocheck
local zombies = require(script.Parent.FSM.Zombies)

task.wait(10)
while wait(0.1) do

    for num = 1,zombies.config.max, 1 do
		zombies.config.enemies[num].Humanoid.MoveTo(zombies.config.enemies[num].Humanoid, workspace.Boxstrangler.HumanoidRootPart.Position)
    end

    
end