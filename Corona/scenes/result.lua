--local ButtonGroup = require("views.button_group")

-- views
--local buttonGroup

--helpers
local function result(event)
    print("max!")
end 

-- scene's life cycle
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
    -- buttonGroup = ButtonGroup.new(sceneGroup)
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
    end
end

function scene:destroy( event )
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    --buttonGroup = nil
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
