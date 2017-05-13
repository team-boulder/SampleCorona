local SHEET = graphics.newImageSheet(SpritesDir .. "boss_mock.png", {
    frames = {

        --FRAME "中ボス1-ダメージ2"
        {
            x = 258,
            y = 2,
            width = 229,
            height = 214,
            sourceWidth = 229,
            sourceHeight = 214,
            sourceX = 11,
            sourceY = 7
        },


        --FRAME "中ボス1-歩きd1(髪なし"
        {
            x = 217,
            y = 427,
            width = 210,
            height = 206,
            sourceWidth = 210,
            sourceHeight = 206,
            sourceX = 23,
            sourceY = 18
        },


        --FRAME "中ボス1-歩きd2(髪パーツ"
        {
            x = 235,
            y = 221,
            width = 149,
            height = 173,
            sourceWidth = 149,
            sourceHeight = 173,
            sourceX = 79,
            sourceY = 1
        },


        --FRAME "中ボス1-ダメージ3"
        {
            x = 2,
            y = 209,
            width = 228,
            height = 214,
            sourceWidth = 228,
            sourceHeight = 214,
            sourceX = 11,
            sourceY = 7
        },


        --FRAME "中ボス1-歩きd2(髪なし"
        {
            x = 2,
            y = 427,
            width = 210,
            height = 209,
            sourceWidth = 210,
            sourceHeight = 209,
            sourceX = 22,
            sourceY = 13
        },


        --FRAME "中ボス1-ダメージ1"
        {
            x = 2,
            y = 2,
            width = 251,
            height = 203,
            sourceWidth = 251,
            sourceHeight = 203,
            sourceX = 10,
            sourceY = 12
        },

    },
    sheetContentWidth = 487,
    sheetContentHeight = 637

})
local SHEET_INDEX = {
    ["中ボス1-ダメージ2"] = 1,
    ["中ボス1-歩きd1(髪なし"] = 2,
    ["中ボス1-歩きd2(髪パーツ"] = 3,
    ["中ボス1-ダメージ3"] = 4,
    ["中ボス1-歩きd2(髪なし"] = 5,
    ["中ボス1-ダメージ1"] = 6,
}

local SEQUENCE_INFO = {
    {
        name = "standing",
        frames = {SHEET_INDEX["中ボス1-歩きd1(髪なし"], SHEET_INDEX["中ボス1-歩きd2(髪なし"]},
        time = 500,
        loopCount = 0,
    },
    {
        name = "damaged",
        frames = {SHEET_INDEX["中ボス1-ダメージ3"]},
        time = 200,
        loopCount = 1,
    },
    {
        name = "defeated",
        frames = {SHEET_INDEX["中ボス1-ダメージ1"]},
        time = 200,
        loopCount = 1,
    }
}

return {
    SHEET = SHEET,
    SHEET_INDEX = SHEET_INDEX,
    SEQUENCE_INFO = SEQUENCE_INFO
}
