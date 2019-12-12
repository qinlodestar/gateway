local redis = require "resty.redis"
local _M = {}

    function _M.connection(config)
        local red = redis:new()
        red:set_timeout(5000)

        local ok, err = red:connect(config['ip'],config['port'])
        if not ok then
            ngx.log(ngx.ERR, 'failed to connection redis',err)
            return nil 
        end

        local ok, err = red:auth(config['passwd'])
        if not ok then
            red:close()
            ngx.log(ngx.ERR, 'Auth not pass')
            return nil 
        end
        return red
    end

    function _M.close()
    end

return _M 
