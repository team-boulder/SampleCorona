local SHEET = graphics.newImageSheet(SpritesDir .. 'fighter_parts.png', {
    frames = {

        --FRAME "主人公基本パーツ1-1"
        {
            x = 588,
            y = 689,
            width = 60,
            height = 53,
            sourceWidth = 60,
            sourceHeight = 53,
            sourceX = 174,
            sourceY = 161
        },


        --FRAME "主人公基本パーツ2-1"
        {
            x = 174,
            y = 422,
            width = 60,
            height = 55,
            sourceWidth = 60,
            sourceHeight = 55,
            sourceX = 174,
            sourceY = 158
        },


        --FRAME "主人公基本パーツ1-2"
        {
            x = 191,
            y = 675,
            width = 94,
            height = 104,
            sourceWidth = 94,
            sourceHeight = 104,
            sourceX = 191,
            sourceY = 147
        },


        --FRAME "主人公基本パーツ2-2"
        {
            x = 533,
            y = 142,
            width = 96,
            height = 103,
            sourceWidth = 96,
            sourceHeight = 103,
            sourceX = 119,
            sourceY = 142
        },


        --FRAME "主人公基本パーツ1-3"
        {
            x = 414,
            y = 264,
            width = 410,
            height = 260,
            sourceWidth = 410,
            sourceHeight = 260,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "主人公基本パーツ2-3"
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

    },
    sheetContentWidth = 826,
    sheetContentHeight = 781
})
local SHEET_INDEX = {
    ["主人公基本パーツ1-頭"] = 1,
    ["主人公基本パーツ2-頭"] = 2,
    ["主人公基本パーツ1-尻尾"] = 3,
    ["主人公基本パーツ2-尻尾"] = 4,
    ["主人公基本パーツ1-体"] = 5,
    ["主人公基本パーツ2-体"] = 6,
}
local SEQUENCE_INFO = {}

return {
    SHEET = SHEET,
    SHEET_INDEX = SHEET_INDEX,
    SEQUENCE_INFO = SEQUENCE_INFO,
}
