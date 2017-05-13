local SHEET = graphics.newImageSheet(SpritesDir .. "slash_effects.png", {
    frames = {
        --FRAME "主人公モック-攻撃エフェクト1a"
        {
            x = 2,
            y = 2,
            width = 244,
            height = 131,
            sourceWidth = 244,
            sourceHeight = 131,
            sourceX = 0,
            sourceY = 0
        },
        --FRAME "主人公モック-攻撃エフェクト2a"
        {
            x = 196,
            y = 137,
            width = 203,
            height = 155,
            sourceWidth = 203,
            sourceHeight = 155,
            sourceX = 0,
            sourceY = 0
        },
        --FRAME "主人公モック-攻撃エフェクト1b"
        {
            x = 3,
            y = 307,
            width = 246,
            height = 106,
            sourceWidth = 246,
            sourceHeight = 106,
            sourceX = 1,
            sourceY = 0
        },
        --FRAME "主人公モック-攻撃エフェクト2b"
        {
            x = 2,
            y = 137,
            width = 190,
            height = 166,
            sourceWidth = 190,
            sourceHeight = 166,
            sourceX = 0,
            sourceY = 0
        },
    },
    sheetContentWidth = 401,
    sheetContentHeight = 414
})
local SHEET_INDEX = {
    ["left"] = 1,
    ["upper_right"] = 2,
    ["right"] = 3,
    ["upper_left"] = 4,
}
local SEQUENCE_INFO = {}

return {
    SHEET = SHEET,
    SHEET_INDEX = SHEET_INDEX,
    SEQUENCE_INFO = SEQUENCE_INFO
}