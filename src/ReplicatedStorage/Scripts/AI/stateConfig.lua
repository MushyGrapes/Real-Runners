local StateConfig = {}
StateConfig.__index = StateConfig

function StateConfig.new()
    local self = setmetatable({}, StateConfig)
    self.inital_State = nil
    self.next_State = nil
    self.current_State = nil
    self.Touch = false
    self.Target = nil
    return self
end
return StateConfig