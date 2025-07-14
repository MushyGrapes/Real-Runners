--!nocheck
local FSM = require(script.Parent.Parent.FSM)
local searching = FSM:new()
local connection = nil 
local field = script.Parent.Parent.Parent.Detection

searching.Enter = function(stateConfig)
    field.Size = Vector3.new(50,50,50)
    connection = field.Touched:Connect(searching.update, stateConfig)
end


searching.update = function(hitPart, stateConfig)
	if not hitPart:HasTag("plr") then
		return
	end
    stateConfig.Target = hitPart.Parent
    stateConfig.Touch = true
end



searching.Exit = function(stateConfig)
    field.Size = Vector3.new(30,30,30)
end
return searching