--!nocheck
local Signal = require(game:GetService("ReplicatedStorage").Signal)
local searching = require(script.Parent.searching)
local StateConfig = script.Parent.Parent.Parent.Parent.StateConfig
local FSM = require(script.Parent.Parent.FSM)
local chasing = FSM:new()
local chasing_updater = Signal.new()
local connection

chasing.name = "chasing"


chasing.Enter = function()
    connection = StateConfig.Parent.Detection.TouchEnded:Connect(onHit)
    chasing_updater:Fire()
end


chasing.update = function()
    while StateConfig:GetAttribute("touch") do
        task.wait(0.1)
        if not workspace[StateConfig:GetAttribute("target")] then
            return
        end
        if workspace[StateConfig:GetAttribute("target")] and workspace[StateConfig:GetAttribute("target")].Humanoid.MoveDirection ~= Vector3.new(0,0,0) then
                StateConfig.Parent.Humanoid:MoveTo(workspace[StateConfig:GetAttribute("target")].HumanoidRootPart.Position+ workspace[StateConfig:GetAttribute("target")].Humanoid.MoveDirection.Unit * 10)
            else
                StateConfig.Parent.Humanoid:MoveTo(workspace[StateConfig:GetAttribute("target")].HumanoidRootPart.Position)
        end    
       
    end
end


chasing.Exit = function()
    if connection then
        connection:Disconnect()
    end
end


chasing_updater:Connect(function()
    chasing.update()
end)


function onHit(hitPart)
    if hitPart:HasTag("plr") and StateConfig:GetAttribute("timer") then
		StateConfig:SetAttribute("touch",false)
	end
end


return chasing