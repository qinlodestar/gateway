local redis = require "redis_client"
local conf = require "conf.config"
local _M = {}
    function _M.run()
        --local headers = ngx.req.get_headers()
        --local requestId=headers['requestId']
        --ngx.say("into test1")
        local request_method = ngx.var.request_method
        if "GET" == request_method then
            args = ngx.req.get_uri_args()
        elseif "POST" == request_method then
            --ngx.req.read_body()
            args = ngx.req.get_post_args()
        end
        version = args["version"]
        key = "test1_"..version
        redis_conf = conf.redisconf()
        conn = redis.connection(redis_conf)
        is_gray = conn:get(key)
        if is_gray == "1"  then
            return ngx.exec("@test1_gray_servers")
        else 
        --    return ngx.exec("@test1_online_servers")
        end
    end

return _M 
