local Signal = require(game:GetService("ReplicatedStorage").Signal)
local FSM = require(script.Parent.Parent.FSM)
local idle = FSM:new()
local idle_updater = Signal.new()
local rs = game:GetService("RunService")
local connection = nil


idle.name = "idle"


idle.Enter = function()
    idle_updater:Fire()
end


idle.update = function()
    if connection then
        return
    end
    
    connection = rs.Heartbeat:Connect(function()
		-- REPLACE SOMETHING HERE IF NEEDED, IF NOT THEN THE UPDATE METHOD IS NOT NEEDED FOR THIS STATE
    end)
end


idle.Exit = function()
    if connection then
		connection:Disconnect()
		connection = nil
    end
end


idle_updater:Connect(function()
    idle.update()
end)


return idle