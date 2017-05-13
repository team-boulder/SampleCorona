-- network.lua
-- Comment : networkをカスタマイズ
-- Date : 2015-1-31
-- Creater : Ryo Takahashi
-----------------------------------------------
local MultipartFormData = require "libraries.network.class_MultipartFormData"

module(..., package.seeall)
function request(url, method, listener, params, errorCode)
	assert(listener, "Error: Not found Listener ")

	local multipart = MultipartFormData.new()
	for k, v in pairs(params) do
		multipart:addField(k ,v)
	end

	local parameters = {}
	parameters.body = multipart:getBody() -- Must call getBody() first!
	local headers = multipart:getHeaders() 
	headers["User-Agent"] = userAgent
	parameters.headers = headers			

	network.request(url, method, listener, parameters)
end
