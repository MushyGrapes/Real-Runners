--!nocheck
local FSM = require(script.Parent.FSM.FSM)
local Signal = require(game:GetService("ReplicatedStorage"):WaitForChild("Signal"))
local char = script.Parent.Parent
local StateConfig = char.StateConfig
local humanoid = char.Humanoid


local states = { -- TODO: USE THE STATES MODULE SCRIPT TO INSTANCE INSTEAD
	searching = require(script.Parent.States.searching),
	chasing = require(script.Parent.States.chasing),
}
	

local FSMmanager = FSM:new()
local changeState = Signal.new()

local config = {
	current_state = nil,
	next_state = nil,
	inital_state = states.searching,
}
local timer = {
	Tick = 0.5,
	Maxlimit = 60,
	Minlimit = 1,
	currentTick = 1,
	enabled = false,
	ending = false,
}


changeState:Connect(function() -- !! EVERY STATE SHOULD BE BE THE STATES NOT STRNGS NO MORE!!!
	config.current_state.Enter()
end)


local function StateCheck()
	if config.inital_state then
		config.current_state = config.inital_state
	end

	if not StateConfig:GetAttribute("touch") and not timer.enabled then
		if config.current_state ~= states.searching then
			config.current_state.Exit()
		end
		timer.enabled = false
		StateConfig:SetAttribute("touch",false)	
		config.next_state = states.searching
	end
	
	if StateConfig:GetAttribute("touch") and not timer.enabled then
		if config.current_state ~= states.chasing then
			config.current_state.Exit()
		end
		timer.enabled = true
 		StateConfig:SetAttribute("touch",true)
		config.next_state = states.chasing
	end

	if config.next_state then
		config.current_state = config.next_state
		StateConfig:SetAttribute("CurrentState", config.current_state.name) -- tools for debugging
		StateConfig:SetAttribute("inital_state", config.inital_state.name)
		StateConfig:SetAttribute("next_state", config.next_state.name)
		StateConfig:SetAttribute("current_tick", timer.currentTick)
		StateConfig:SetAttribute("timer", timer.enabled)
		StateConfig:SetAttribute("ending", timer.ending)
		changeState:Fire()
	end

	if timer.enabled or timer.currentTick ~= timer.Minlimit then
		if timer.currentTick >= timer.Maxlimit then
			timer.currentTick = 1
			timer.ending = true
			return
		end
		if not timer.ending then
			timer.currentTick += timer.Tick
		end
	end
	if timer.enabled and timer.ending then
		timer.enabled = false
		timer.ending = false
	end
end


while char do
	task.wait(0.1)
	StateCheck()
end


local function init()
	humanoid.WalkSpeed = math.random(19,29)
	humanoid.Parent.HumanoidRootPart.Anchored = false
end

return FSMmanager