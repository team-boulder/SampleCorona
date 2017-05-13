local LoadSave = require "libraries.loadsave"
local EventDispatcher = require "libraries.event_dispatcher"
local UserData = setmetatable({}, {__index = EventDispatcher})

local function initData()
    local data = {}
    data.score = 0

    return data
end

function UserData.getAll()
    local rawDatas = LoadSave.loadTable("save.json", system.DocumentsDirectory)
    if rawDatas == nil then rawDatas = initData() end

    return rawDatas
end

function UserData.new(rawData)
    local userData = setmetatable(rawData, {__index = userData})
    userData.listeners = {}

    return userData
end

return UserData
