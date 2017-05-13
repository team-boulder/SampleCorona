local SHEET = graphics.newImageSheet(SpritesDir .. 'fighter_motions.png', {
    frames = {

        --FRAME "20170323主人公動き-a2-2"
        {
            x = 0,
            y = 1040,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-a1"
        {
            x = 410,
            y = 1040,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-b1"
        {
            x = 0,
            y = 520,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-a2-1"
        {
            x = 410,
            y = 780,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-b3-1"
        {
            x = 410,
            y = 0,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-b2-2"
        {
            x = 0,
            y = 260,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-b3-2"
        {
            x = 0,
            y = 0,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-a3-2"
        {
            x = 410,
            y = 520,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-a3-1"
        {
            x = 0,
            y = 780,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "20170323主人公動き-b2-1"
        {
            x = 410,
            y = 260,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },

    },
    sheetContentWidth = 820,
    sheetContentHeight = 1300

})
local SHEET_INDEX = {
    ["20170323主人公動き-a2-2"] = 1,
    ["20170323主人公動き-a1"] = 2,
    ["20170323主人公動き-b1"] = 3,
    ["20170323主人公動き-a2-1"] = 4,
    ["20170323主人公動き-b3-1"] = 5,
    ["20170323主人公動き-b2-2"] = 6,
    ["20170323主人公動き-b3-2"] = 7,
    ["20170323主人公動き-a3-2"] = 8,
    ["20170323主人公動き-a3-1"] = 9,
    ["20170323主人公動き-b2-1"] = 10,
}
local motionTime = 200
local SEQUENCE_INFO = {
    {
        name = "upper_left",
        frames = {
            SHEET_INDEX["20170323主人公動き-a1"],
            SHEET_INDEX["20170323主人公動き-a2-1"],
            SHEET_INDEX["20170323主人公動き-a2-2"],
            SHEET_INDEX["20170323主人公動き-a1"],
        },
        time = motionTime,
        loopCount = 1,
    },
    {
        name = "left",
        frames = {
            SHEET_INDEX["20170323主人公動き-a1"],
            SHEET_INDEX["20170323主人公動き-a3-1"],
            SHEET_INDEX["20170323主人公動き-a3-2"],
            SHEET_INDEX["20170323主人公動き-a1"],
        },
        time = motionTime,
        loopCount = 1,
    },
    {
        name = "upper_right",
        frames = {
            SHEET_INDEX["20170323主人公動き-b1"],
            SHEET_INDEX["20170323主人公動き-b2-1"],
            SHEET_INDEX["20170323主人公動き-b2-2"],
            SHEET_INDEX["20170323主人公動き-b1"],
        },
        time = motionTime,
        loopCount = 1,
    },
    {
        name = "right",
        frames = {
            SHEET_INDEX["20170323主人公動き-b1"],
            SHEET_INDEX["20170323主人公動き-b3-1"],
            SHEET_INDEX["20170323主人公動き-b3-2"],
            SHEET_INDEX["20170323主人公動き-b1"],
        },
        time = motionTime,
        loopCount = 1,
    },
}

return {
    SHEET = SHEET,
    SHEET_INDEX = SHEET_INDEX,
    SEQUENCE_INFO = SEQUENCE_INFO,
}
