--[[
-- グローバルな設定とライブラリのインポートを行うファイル
 ]]
_H = display.contentHeight
_W = display.contentWidth
ResouceDir = "res/"
ImagesDir = ResouceDir .. "images/"
SpritesDir = ResouceDir .. "sprites/"
ParticlesDir = ResouceDir .. "particles/"
AudiosDir = ResouceDir .. "audios/"
JsonDir = ResouceDir .. "json/"
DisplayGrid = system.getInfo "environment" == "simulator"
PrintMemoryUsage = false
ReservedAudioChannels = 1
BgmChannel = 1
SkipRewardVideo = true
NativeBuild = false
UrlBase = 'http://app.talkspace-web.com/side/sangokushi/'
composer = require "composer"
require "libraries.display"
