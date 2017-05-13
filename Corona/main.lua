require("config.config")
if system.getInfo("environment") ~= "simulator" then
    system.activate("multitouch")
end

local userDataModel = require("models.userData")
composer.userData = userDataModel.getAll()
composer.gotoScene("scenes.first")


--system manage
local function onSystemEvent(event)
    local currentTimestamp = os.time()
    if event.type == "applicationExit" or event.type == "applicationSuspend" then
    elseif event.type == "applicationStart" or event.type == "applicationResume" then
    end
end
Runtime:addEventListener("system", onSystemEvent)

if PrintMemoryUsage then
    local function printMemUsage()
        local memUsed = (collectgarbage("count")) / 1024
        local texUsed = system.getInfo( "textureMemoryUsed" ) / (1024 * 1024)
        print("\n---------MEMORY USAGE INFORMATION---------")
        print("System Memory Used:", string.format("%.03f", memUsed), "MB")
        print("Texture Memory Used:", string.format("%.03f", texUsed), "MB")
        print("------------------------------------------\n")

        return true
    end
    timer.performWithDelay(5000, printMemUsage, 0)
end
