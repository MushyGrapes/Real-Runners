local Signal = require(game:GetService("ReplicatedStorage").Signal)
local FSM = require(script.Parent.Parent.FSM)
local Running = FSM:new()
local Running_updater = Signal.new()
local rs = game:GetService("RunService")
local connection = nil
local connections = {}
local name = "running"


Running.name = "running"


Running.Enter = function()
    Running_updater:Fire()
end


Running.update = function()
    if connection then
        return
    end
    
    connection = rs.Heartbeat:Connect(function()
        -- REPLACE SOMETHING HERE IF NEEDED, IF NOT THEN THE UPDATE METHOD IS NOT NEEDED FOR THIS STATE
    end)
end


Running.Exit = function()
    if connection then       
		connection:Disconnect()
		connection = nil
    end
end


Running_updater:Connect(function()
    Running.update()
end)


return Running