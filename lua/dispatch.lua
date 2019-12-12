local redis = require "resty.redis"
local util = require("util")

local server_name = ngx.var.server_name
ngx.log(ngx.DEBUG, server_name);
arr = util.split(server_name, ".");
local dis = require(arr[1])
--根据域名分发不同的服务器
dis.run()
