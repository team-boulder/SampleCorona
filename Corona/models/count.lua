local EventDispatcher = require "libraries.event_dispatcher"
local Count = setmetatable({}, {__index = EventDispatcher})

Count.score = 0

function Count:push()
    --composer.userData.score = composer.userData.score + 1
    --print(composer.userData.score)
    --if composer.userData.score >= 10 then
    Count.score = Count.score + 1
    print(Count.score)
    if Count.score >= 10 then
    self:dispatchEvent({
            name = "max-count",
            item = self
        })
    end
end

return Count