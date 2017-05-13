--[[
@
@ Project  :
@
@ Filename : unityads.lua
@
@ Author   : Task Nagashige
@
@ Date     : 2016-03-28
@
@ Comment  :
@
]]--
local unityads = require( "plugin.unityads" )
local EventDispatcher = require("libraries.event_dispatcher")

local this = setmetatable({listeners = {}}, {__index = EventDispatcher})

this.initialized = false
this.unityads_appID = '3c1a918b-5378-4648-9468-a5a11e78ebfb'
this.unityads_appSignature = ''

this.placement_ID = true
this.replace_listener = function() end
this.loaded_listener = nil

local is_show = false

------------------------------
-- イベントのリスナー
------------------------------
local function adListener( event )

	print( event )
	if event.phase == 'init' then  -- Successful initialization
		print( event.isError )
		-- Load an unityads ad
		-- unityads.load( placement_ID )

	elseif event.phase == 'loaded' then  -- The ad was successfully loaded
		print( event.type )
		-- Show the ad
		if is_show then
			unityads.show( this.placement_ID )
		end

		if this.loaded_listener then
			this.loaded_listener()
		end

	elseif event.phase == 'failed' then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
		this.replace_listener()
		hideModal()
		local alert = native.showAlert( '視聴失敗', '見ることができる動画がありません。しばらく経ったあとで試してください。', { 'OK' } )
		event.response = 'reward-failed'

	elseif event.phase == 'displayed' then  -- The ad was displayed/played
		is_show = false
		print( event.type )

	elseif event.phase == 'completed' then  -- The ad was closed/hidden
		is_show = false
		print( event.type )
		if not event.isError then
			event.response = 'reward'
		end
	elseif event.phase == 'clicked' then  -- The ad was clicked/tapped
		print( event.type )
	end

	this:dispatchEvent( {name='adnetwork', phase = event.response } )
end

-------------------------
-- initialize
-------------------------
function this.init( option )
	local option = option or {}
	local appID = option.unityads_appID or this.unityads_appID
	assert(appID, 'ERROR : unityads_appIDのIDを設定してください')

	print( option )
	unityads.init( adListener, { gameId = appID } )
	this.initialized = true
end

-------------------------
-- prepare
-------------------------
function this.prepare( ads_type, listener )
	assert( this.initialized == true, 'ERROR : ads.init() をして下さい' )
	assert( ads_type, 'ERROR : ads_typeが指定されていません' )
	assert( ads_type == 'rewardedVideo', 'ERROR : 存在しないads_typeです' )

	-- prepare
	if ads_type == 'rewardedVideo' then
		this.placement_ID = true
	else
		this.placement_ID = false
	end
	if listener then
		this.loaded_listener = function()
			listener()
		end
	end
	-- unityads.load( this.placement_ID )
end


-------------------------
-- show
-------------------------
function this.show( ads_type )
	assert( this.initialized == true, 'ERROR : ads.init() をして下さい' )
	assert( ads_type, 'ERROR : ads_typeが指定されていません' )
	assert( ads_type == 'rewardedVideo', 'ERROR : 存在しないads_typeです' )

	is_show = true
	this.placement_ID = 'rewardedVideo'

	if SkipRewardVideo == true then 
		adListener( { response = 'reward' } )
	else
		local is_loaded = unityads.isLoaded( this.placement_ID )
		if is_loaded then
			unityads.show( this.placement_ID )
		else
			timer.performWithDelay( 1000, function()
				this.prepare( ads_type, function() this.show( this.placement_ID ) end )
			end )
		end
	end
end


--------------------------
-- remove
--------------------------
function this.remove()
	is_show = false
end

return this