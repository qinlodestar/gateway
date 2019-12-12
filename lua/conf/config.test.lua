local _M = {}
    function _M.redisconf()
        local redis_conf = {["ip"] = "127.0.0.1",["port"] = "6379",["passwd"] = "123456"}
        return redis_conf
    end
return _M
