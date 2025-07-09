--!nocheck
local Signal = require(game:GetService("ReplicatedStorage").Signal)
local FSM = require(script.Parent.Parent.FSM)
local StateConfig = script.Parent.Parent.Parent.Parent.StateConfig
local searching = FSM:new()
local searching_updater = Signal.new()
local connection 

searching.name = "searching"


searching.Enter = function()
    local field = StateConfig.Parent.Detection
    field.Size = Vector3.new(50,50,50)
    connection = StateConfig.Parent.Detection.Touched:Connect(searching.update)
end


searching.update = function(hitPart)
	if not hitPart:HasTag("plr") then
		return
	end
    StateConfig:SetAttribute("target", hitPart.Parent.name)
    StateConfig:SetAttribute("touch",true)
end



searching.Exit = function()
    local field = StateConfig.Parent.Detection
    field.Size = Vector3.new(30,30,30)
end


searching_updater:Connect(function()
	
end)



return searching