local SHEET = graphics.newImageSheet(SpritesDir .. "normal_enemy_mock.png", {
    frames = {

        --FRAME "雑魚兵1-飛び散る4"
        {
            x = 274,
            y = 164,
            width = 50,
            height = 52,
            sourceWidth = 50,
            sourceHeight = 52,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-ダメージ3"
        {
            x = 2,
            y = 2,
            width = 119,
            height = 144,
            sourceWidth = 119,
            sourceHeight = 144,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る5"
        {
            x = 315,
            y = 110,
            width = 57,
            height = 50,
            sourceWidth = 57,
            sourceHeight = 50,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る6"
        {
            x = 328,
            y = 164,
            width = 46,
            height = 51,
            sourceWidth = 46,
            sourceHeight = 51,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る7"
        {
            x = 328,
            y = 218,
            width = 44,
            height = 51,
            sourceWidth = 44,
            sourceHeight = 51,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-歩き1"
        {
            x = 109,
            y = 150,
            width = 79,
            height = 208,
            sourceWidth = 79,
            sourceHeight = 208,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-ダメージ1"
        {
            x = 125,
            y = 2,
            width = 101,
            height = 138,
            sourceWidth = 101,
            sourceHeight = 138,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-ベース"
        {
            x = 192,
            y = 144,
            width = 79,
            height = 208,
            sourceWidth = 79,
            sourceHeight = 208,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る1"
        {
            x = 192,
            y = 356,
            width = 182,
            height = 20,
            sourceWidth = 182,
            sourceHeight = 20,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-歩き2"
        {
            x = 2,
            y = 150,
            width = 79,
            height = 208,
            sourceWidth = 79,
            sourceHeight = 208,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る2"
        {
            x = 229,
            y = 110,
            width = 82,
            height = 20,
            sourceWidth = 82,
            sourceHeight = 20,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-ダメージ2"
        {
            x = 229,
            y = 2,
            width = 105,
            height = 104,
            sourceWidth = 105,
            sourceHeight = 104,
            sourceX = 0,
            sourceY = 0
        },


        --FRAME "雑魚兵1-飛び散る3"
        {
            x = 2,
            y = 362,
            width = 103,
            height = 5,
            sourceWidth = 103,
            sourceHeight = 5,
            sourceX = 0,
            sourceY = 0
        },

    },
    sheetContentWidth = 375,
    sheetContentHeight = 377
})
local SHEET_INDEX = {
    ["飛び散る4"] = 1,
    ["ダメージ3"] = 2,
    ["飛び散る5"] = 3,
    ["飛び散る6"] = 4,
    ["飛び散る7"] = 5,
    ["歩き1"] = 6,
    ["ダメージ1"] = 7,
    ["ベース"] = 8,
    ["飛び散る1"] = 9,
    ["歩き2"] = 10,
    ["飛び散る2"] = 11,
    ["ダメージ2"] = 12,
    ["飛び散る3"] = 13,
}
local SEQUENCE_INFO = {
    {
        name = "walking",
        frames = {SHEET_INDEX["歩き1"], SHEET_INDEX["歩き2"]},
        time = 1000,
        loopCount = 0,
    },
    {
        name = "damage_back",
        frames = {SHEET_INDEX["ダメージ2"]},
        time = 0,
        loopCount = 1,
    },
    {
        name = "damage_horizontal",
        frames = {SHEET_INDEX["ダメージ3"]},
        time = 0,
        loopCount = 1,
    },
    {
        name = "damage_upper",
        frames = {SHEET_INDEX["ダメージ1"]},
        time = 0,
        loopCount = 1,
    },
}

return {
    SHEET = SHEET,
    SEQUENCE_INFO = SEQUENCE_INFO,
}