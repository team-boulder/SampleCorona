local countModel = require("models.count")
local ButtonGroup = {}

function ButtonGroup.new(group)
    local buttonGroup = display.newContainer(group, _W, _H)
    buttonGroup.x = _W / 2
    buttonGroup.y = _H / 2

    local backgroundView = display.newImageRect(buttonGroup, ImagesDir .. "btn.png", _W, 300)
    backgroundView.anchorY = 0
    backgroundView:scale(0.5,0.5)
    backgroundView.y = 200

    function buttonGroup:tap(event)
      countModel:push()
    end

    return buttonGroup
end

return ButtonGroup
