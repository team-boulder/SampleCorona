local ButtonGroup = require("views.button_group")
local countModel = require("models.count")

-- views
local buttonGroup

--helpers
local function result(event)
    print("max!")
    composer.gotoScene("scenes.result")
end 

-- scene's life cycle
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
    buttonGroup = ButtonGroup.new(sceneGroup)
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
      buttonGroup:addEventListener("tap")
      countModel:addEventListener("max-count",result)
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
      buttonGroup:removeEventListener("tap")
      countModel:removeEventListener("max-count",result)
    end
end

function scene:destroy( event )
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    buttonGroup = nil
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
