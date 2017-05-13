local EventDispatcher = {}

-- listener に無名関数を渡してはいけません。removeListener で除去することができないからです。
function EventDispatcher:addEventListener(eventName, listener)
    if type(listener) ~= "function" then
        print("WARNING: listnerはfunctionでなくてはなりません")
        return
    end

    if self.listeners == nil then
       self.listeners = {}
       self.listeners[eventName] = {listener}
    else
        for _, v in pairs(self.listeners[eventName]) do
            if v == listener then
                return
            end
        end
        table.insert(self.listeners[eventName], listener)
    end
end

function EventDispatcher:dispatchEvent(event)
    if not self.listeners[event.name] then
        return
    end

    for _, listener in pairs(self.listeners[event.name]) do
        listener(event)
    end
end

function EventDispatcher:removeEventListener(eventName, listener)
    for i, v in ipairs(self.listeners[eventName]) do
        if v == listener then
            table.remove(self.listeners[eventName], i)
        end
    end
end

return EventDispatcher
