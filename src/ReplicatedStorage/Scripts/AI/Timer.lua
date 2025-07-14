local Timer = {}
Timer.__index = {Timer}



function Timer.new()
    local self = setmetatable({}, Timer)
    self.Tick = 0.5
    self.maxLimit = 60
    self.minLimit = 1
    self.currentTick = 1
    self.Enabled = false
    self.Ending = false
    self.seconds = 1
    return self
end

function Timer.Run(self)
    self.Enabled = true
    while self.minLimit ~= self.maxLimit and self.Enabled do
        self.minLimit += self.Tick
        task.wait(self.seconds)
    end
    self.timerFinished()
end

function Timer.timerFinished(self)
    self.Reset()
end

function Timer.Cancel(self)
    self.Reset()
end

function Timer.Reset(self)
    self.Enabled = false
    self.Ending = false
    self.minLimit = 1
end
return Timer