--!nocheck
local FSM = require(script.Parent.Parent.FSM)
local chasing = FSM:new()
local stateConfig = require(script.Parent.Parent.stateConfig).new()
local connection

chasing.Enter = function()
    connection = stateConfig.Parent.Detection.TouchEnded:Connect(onHit)
    chasing.update()
end

chasing.update = function()
    while stateConfig.Touch do
        if not stateConfig.Target then
            return
        end
        if stateConfig.Target and stateConfig.Target.Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
            stateConfig.Parent.Humanoid:MoveTo(stateConfig.Target.HumanoidRootPart.Position+ workspace[stateConfig:GetAttribute("target")].Humanoid.MoveDirection.Unit * 10)
        else
            stateConfig.Parent.Humanoid:MoveTo(stateConfig.Target.HumanoidRootPart.Position)
        end    
        task.wait(0.1)
    end
end

chasing.Exit = function()
    if connection then
        connection:Disconnect()
    end
end

function onHit(hitPart)
    if hitPart:HasTag("plr") and stateConfig:GetAttribute("timer") then
		stateConfig:SetAttribute("touch",false)
	end
end
return chasing