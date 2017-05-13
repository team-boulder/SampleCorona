local SHEET = graphics.newImageSheet(SpritesDir .. "dusts.png", {
    -- array of tables representing each frame (required)
    frames = {

        --FRAME "土煙-1"
        {
            x = 2,
            y = 47,
            width = 71,
            height = 16,
            sourceWidth = 71,
            sourceHeight = 16,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "土煙-3"
        {
            x = 2,
            y = 26,
            width = 99,
            height = 17,
            sourceWidth = 99,
            sourceHeight = 17,
            sourceX = 0,
            sourceY = 1
        },


        --FRAME "土煙-2"
        {
            x = 2,
            y = 2,
            width = 113,
            height = 20,
            sourceWidth = 113,
            sourceHeight = 20,
            sourceX = 0,
            sourceY = 0
        },

    },
    sheetContentWidth = 116,
    sheetContentHeight = 64
})
local SHEET_INDEX = {
    ["土煙-1"] = 1,
    ["土煙-3"] = 2,
    ["土煙-2"] = 3,
}
local SEQUENCE_INFO = {
    {
        name = "dust1",
        frames = {SHEET_INDEX["土煙-1"]},
        time = 1,
        loopCount = 1,
    },
    {
        name = "dust2",
        frames = {SHEET_INDEX["土煙-2"]},
        time = 1,
        loopCount = 1,
    },
    {
        name = "dust3",
        frames = {SHEET_INDEX["土煙-3"]},
        time = 1,
        loopCount = 1,
    },
}
return {
    SHEET = SHEET,
    SHEET_INDEX = SHEET_INDEX,
    SEQUENCE_INFO = SEQUENCE_INFO,
}
