--!nocheck
local FSM = require(script.Parent.FSM)
local Signal = require(game:GetService("ReplicatedStorage"):WaitForChild("Signal"))
local states = require(script.Parent.States.States)
local Timer = require(script.Parent.Timer).new()
local config = require(script.Parent.stateConfig).new()
local FSMmanager = FSM:new()
local changeState = Signal.new()

local char = script.Parent.Parent
local humanoid = char.Humanoid

local function initalize()
	config.inital_State = states.searching
	humanoid.WalkSpeed = math.random(19,29)
	humanoid.Parent.HumanoidRootPart.Anchored = false
end
initalize()

changeState:Connect(function() -- !! EVERY STATE SHOULD BE BE THE STATES NOT STRNGS NO MORE!!!
	config.current_State.Enter(config)
end)

local function StateCheck()
	if config.inital_State then
		config.current_State = config.inital_State
	end

	if config.Touch and not Timer.Enabled then
		if config.current_State ~= states.chasing then
			config.current_State.Exit(config)
		end
		Timer.Enabled = true
 		config.Touch = true
		config.next_State = states.chasing
	end
	
	if not config.Touch and not Timer.Enabled then
		if config.current_State ~= states.searching then
			config.current_State.Exit(config)
		end
		Timer.Enabled = false
		config.Touch = false	
		config.next_State = states.searching
	end

	if config.next_State then
		config.current_State = config.next_State -- minizie the size of the attributes here
		changeState:Fire()
	end

	if Timer.Enabled or Timer.currentTick ~= Timer.minLimit then
		if Timer.currentTick >= Timer.maxLimit then
			Timer.currentTick = 1
			Timer.Ending = true
			return
		end
		if not Timer.Ending then
			Timer.currentTick += Timer.Tick
		end
	end
	if Timer.Enabled and Timer.Ending then
		Timer.Enabled = false
		Timer.Ending = false
	end
	print(Timer.Enabled)
end


while char do
	task.wait(0.1)
	StateCheck()
end
return FSMmanager