
-- ProjectName :
--
-- Filename : ads.lua
--
-- Creater : Ryo Takahashi
--
-- Date : 2015-06-18
--
-- Comment :
----------------------------------------------------------------------------------
local EventDispatcher = require "libraries.event_dispatcher"
local json = require "json"
local fnetwork = require "libraries.network.network"

local adnetwork  = {}
adnetwork.webview    = require "libraries.ads.webviewAds"
adnetwork.admob      = require "libraries.ads.admob"
adnetwork.freep      = require "libraries.ads.freepAds"
adnetwork.vungle     = require "libraries.ads.vungle"
adnetwork.applovin   = require "libraries.ads.applovin"
adnetwork.unityads   = require "libraries.ads.unityads"
adnetwork.chartboost = setmetatable({}, {__index = EventDispatcher})
adnetwork.adcolony   = setmetatable({}, {__index = EventDispatcher})
adnetwork.fyber      = setmetatable({}, {__index = EventDispatcher})

-- CoronaビルドとXcodeビルドで使い分け
if NativeBuild == true then
	if system.getInfo('platformName') == 'iPhone OS' or system.getInfo('platformName') == 'iOS' then
		adnetwork.chartboost = require "libraries.ads.chartboost-ios"
		adnetwork.fyber = require "libraries.ads.fyber"
	else
		adnetwork.chartboost = require "libraries.ads.chartboost"
	end
else
	adnetwork.chartboost = require "libraries.ads.chartboost"
end

local this = setmetatable({}, {__index = EventDispatcher})


local is_initialized = false
local webview_isHide = false
this.hidden_wall = true
this.showing_ads = {}

this.option = {}
this.option.service = {}

-----------------------------------
-- イニシャライズ
--
-- Chartboostのイニシャライズを行う
--
-- @params table option :
-----------------------------------
local chartboost_isVisible = false
local webView_isVisible = false
local admob_isVisible = false
local freep_isVisible = false
local fyber_isVisible = false
local vungle_isVisible = false
local applovin_isVisible = false
local unityads_isVisible = false
local adcolony_isVisible = false

local function initListener(event)
	local webViewOption = {}
	local admobOption = {}
	local freepOption = {}

	if not event.isError then
		local data = json.decode(event.response)

		for k, v in pairs(data.ads) do
			this.option.service[v.type] = v.service

			-- webViewAds用
			if v.url and v.service == 'freep' then
				freepOption[v.type] = v.url
			elseif v.url then
				webViewOption[v.type] = v.url
			end

			if v.service == 'freep' then
				freep_isVisible = true
			end

			-- chartboost用
			if v.service == 'chartboost' then
				this.option.chartboost_appID          = v.appID
				this.option.chartboost_appSignature   = v.appSignature
				this.option.chartboost_apiKey         = v.apiKey
				this.option.chartboost_appOrientation = v.appOrientation
				this.option.chartboost_testMode       = v.testMode
				chartboost_isVisible = true
			end

			-- fyber用
			if v.service == 'fyber' then
				this.option.fyber_appID = v.appID
				this.option.fyber_token = v.token
				fyber_isVisible = true
			end

			-- vungle用
			if v.service == 'vungle' then
				this.option.vungle_appID = v.appID
				vungle_isVisible = true
			end

			-- applovin用
			if v.service == 'applovin' then
				this.option.applovin_appID = v.appID
				applovin_isVisible = true
			end

			-- unityads用
			if v.service == 'unityads' then
				this.option.unityads_appID = v.appID
				unityads_isVisible = true
			end

			if v.service == 'adcolony' then
				this.option.adcolony_apiKey       = v.apiKey
				this.option.adcolony_debugLogging = v.debugLogging
				this.option.adcolony_testMode     = v.testMode
				adcolony_isVisible = true
			end

			-- admob用
			if v.service == 'admob' then
				this.option.nend_appID = v.appID
				admobOption[v.type] = {appId=v.appID, testMode=v.testMode}
				admob_isVisible = true
			end

			if v == 'webview' then
				webView_isVisible = true
			end
		end
	end

	-- chartboost用initialize
	if chartboost_isVisible == true then
		local chartboost_option = {
			chartboost_appID          = this.option.chartboost_appID,
			chartboost_appSignature   = this.option.chartboost_appSignature,
			chartboost_apiKey         = this.option.chartboost_apiKey,
			chartboost_appOrientation = this.option.chartboost_appOrientation,
			chartboost_testMode       = this.option.chartboost_testMode,
		}
		adnetwork.chartboost.init(chartboost_option)
	end

	-- fyber用initialize
	if fyber_isVisible == true then
		local fyber_option = {
			fyber_appID = this.option.fyber_appID,
			fyber_token = this.option.fyber_token
		}
		adnetwork.fyber.init(fyber_option)
	end

	-- vungle用initialize
	if vungle_isVisible == true then
		local vungle_option = {
			vungle_appID = this.option.vungle_appID,
		}
		adnetwork.vungle.init( vungle_option )
	end

	-- applovin用initialize
	if applovin_isVisible == true then
		local applovin_option = {
			applovin_appID = this.option.applovin_appID,
		}
		adnetwork.applovin.init( applovin_option )
	end

	-- unityads用initialize
	if unityads_isVisible == true then
		local unityads_option = {
			unityads_appID = this.option.unityads_appID,
		}
		adnetwork.unityads.init( unityads_option )
	end

	-- adcolony用initialize
	if adcolony_isVisible == true then
		local adcolony_option = {
			apiKey       = this.option.adcolony_apiKey,
			debugLogging = this.option.adcolony_debugLogging,
			testMode     = this.option.adcolony_testMode,
		}
		adnetwork.adcolony.init( adcolony_option )
	end

	-- admobのinitialize
	if admob_isVisible == true then
		adnetwork.admob.init( this.option.nend_appID, admobOption )
	end

	-- admobのinitialize
	if webView_isVisible == true then
		adnetwork.webview.init(webViewOption)
	end

	-- freepのinitialize
	if freep_isVisible == true then
		adnetwork.freep.init(freepOption)
	end

	is_initialized = true
end

function this.init(option)
	--パラメータ
	local params = {}
	params['platform'] = system.getInfo( "platformName" )
	params['language'] = system.getPreference("locale", "language")

	fnetwork.request(UrlBase .. "ads/init.php", "POST", initListener, params)
end
this.init()

-------------------------
-- prepare
--
-- @params table option :
--
-- optionの中身
-- listener : eventListener
-------------------------
function this.prepare(ads_type, option)
	adnetwork[ads_type].prepare( ads_type, option )
end

-------------------------------------------------------------------
-- show
--
-- @param string ads_type : 広告の枠名（game_footer等）
-- @param function successListener : 広告視聴のレスポンスを受け取るリスナー
-- @paran function failureListener : 視聴失敗時のレスポンスを受け取るリスナー
-------------------------------------------------------------------
local waiting = {}
function this.show(ads_type, successListener, failureListener)
	assert( ads_type , "指定されたads_typeがありません" )

	if is_initialized == false then
		if not waiting[ads_type] then
			waiting[ads_type] = {}
			waiting[ads_type]['count'] = 0
		end

		waiting[ads_type]['count'] = waiting[ads_type]['count'] + 1
		if waiting[ads_type]['count'] < 10 then
			waiting[ads_type]['timer'] = timer.performWithDelay( 100,
				function()
					this.show(ads_type, ads_listener)
				end
			)
		else
			if waiting[ads_type]['timer'] then
				timer.cancel( waiting[ads_type]['timer'] )
			end
		end
	else
		-- 表示待ちの管理
		waiting[ads_type] = nil

		local provider = this.option.service[ads_type]

		local handler
		function handler(event)
			if event.phase == 'reward-failed' or event.phase == 'reward' then
				if event.phase == 'reward-failed'  then
					failureListener()
				elseif event.phase == 'reward' then
					successListener()
				end
				adnetwork[provider]:removeEventListener( 'adnetwork', handler )
			end
		end
		adnetwork[provider]:addEventListener( 'adnetwork', handler )
		adnetwork[provider].show( ads_type )
	end
end


--------------------------
-- remove
--------------------------
function this.remove(ads_type, option)
	if waiting[ads_type] then
		if waiting[ads_type]['timer'] then
			timer.cancel( waiting[ads_type]['timer'] )
		end
	end
	adnetwork[ads_type].show( ads_type, option )

	-- 表示中の広告除去
	this.showing_ads[ads_type] = nil
end

-- 広告を隠す
function this.unreveal( ads_type )
	assert(ads_type, 'ERROR : ads_typeを指定して下さい')

	if this.option.service[ads_type] == 'webview' then
		adnetwork.webview.unreveal(ads_type)

	elseif this.option.service[ads_type] == 'freep' then
		adnetwork.freep.unreveal(ads_type)
	end
end

function this.reveal( ads_type, ads_option )
	assert(ads_type, 'ERROR : ads_typeを指定して下さい')

	if this.option.service[ads_type] == 'webview' then
		adnetwork.webview.reveal( ads_type, ads_option )

	elseif this.option.service[ads_type] == 'freep' then
		adnetwork.freep.reveal(ads_type)
	end
end


----------------------------
-- 非表示（削除ではない）
----------------------------
local is_display = true
local ads_keep = {}
function this.hide(remove_ads)
	for k, v in pairs(ads.showing_ads) do
		if remove_ads ~= k then
			ads_keep[k] = v
			this.unreveal(k)
		end
	end
	is_display = false
	this:dispatchEvent( { name = 'ads-hide' } )
end


----------------------------
-- 再表示
----------------------------
function this.display(remove_ads)
	timer.performWithDelay( 300, function()
		if is_display then return end
		if ads_keep ~= {} then
			for k, v in pairs(ads_keep) do
				-- リワードを非表示解除ということはないのであらかじめ省く
				if k ~= remove_ads and k ~= 'rewardedVideo' then
					this.reveal( k, v )
				end
			end
		end
		this.destroy()
		is_display = true
		this:dispatchEvent( { name = 'ads-display' } )
	end )
end

function this.destroy()
	ads_keep = nil
	ads_keep = {}
end

------------------
-- fadsListener
------------------
function this.fadsListener(event)

	-- アフィリエイト or 自社wall
	if event.phase == 'closed' and event.name ~= 'moyashi' then
		--　閉じた時に非表示にしていた広告を再表示
		this.display(event.name)

		-- 表示中の広告除去
		this.showing_ads[event.name] = nil

	elseif event.phase == 'showed' and event.name ~= 'moyashi' then
		--　その他広告を非表示
		this.hide(event.name)
	end

end
adnetwork.freep:addEventListener( 'freepAds', this.fadsListener )

return this
