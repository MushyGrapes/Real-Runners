--!nocheck
script.Enabled = true -- TODO: uncheck this when done testing.
local FSM = require(script.Parent.FSM)
local rs = game:GetService("RunService")
local Signal = require(game:GetService("ReplicatedStorage").Signal)
local StateConfig 
local humanoid
local enemies = require(script.Parent.Zombies)
local enemy = 1
local max = enemies.config.max


local states = {
	idle = require(script.Parent.States.idle),
	Running = require(script.Parent.States.Running),
}


local FSMmanager = FSM:new()
local inital_state = nil -- When the state is first initated.
local current_state = nil -- the concurrent state running.
local next_state = nil -- the next state if certain conditions are met for the state.
local changeState = Signal.new()


changeState:Connect(function(state) -- !! EVERY STATE SHOULD BE BE THE STATES NOT STRNGS NO MORE!!!
	if state == "running" then
		states.Running.Enter()
	end
	if state == "idle" then
		states.idle.Enter()
	end
end)




rs.PreAnimation:Connect(function()
	if enemy >= max then
		enemy = 0
	end
	
	enemy += 1
	humanoid = enemies.config.enemies[enemy].Humanoid
	StateConfig = enemies.config.enemies[enemy].StateConfig
	CheckState()
end)


function CheckState()
    if not inital_state then
        inital_state = states.idle
		current_state = inital_state
    end

    if humanoid.Parent.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 0 then
		if current_state ~= states.Running then
			  current_state.Exit()
		end
        next_state = states.Running
		changeState:Fire("running")  -- Corrected method call
	end
    if 0.1 > humanoid.Parent.HumanoidRootPart.AssemblyLinearVelocity.Magnitude then
		if current_state ~= states.idle then
			  current_state.Exit()
		end
		next_state = states.idle
		changeState:Fire("idle")
	end

	if next_state then
		current_state.Exit()
		current_state = next_state
		StateConfig:SetAttribute("CurrentState",current_state.name)
		StateConfig:SetAttribute("inital_state", inital_state.name)
		StateConfig:SetAttribute("next_state", next_state.name)
	end
end


return FSMmanager