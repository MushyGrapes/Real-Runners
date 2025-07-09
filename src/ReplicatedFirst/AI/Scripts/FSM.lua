local FSM = {}
FSM.__index = FSM


function FSM:new()
	local fsm = setmetatable({}, FSM)
	
	fsm.Enter = function()
		
	end
	
	fsm.update = function()
		
	end
	
	fsm.Exit = function()
		
	end
	
	
	return fsm
end

return FSM