#  nginx + lua gateway
背景：微信小程序在审核的过程中，需要上线后端代码到线上环境，但是可能代码（版本没有兼容）会影响现有小程序的使用。那么能否通过网关将不同版本接口分发到不同的服务器，在小程序审核期间分发到灰度服务器，线上版本分发到线上服务器。

文件说明：
====
lua/conf/config.lua 作为配置文件，通过软连接在区分不同环境的服务器

ngx_conf/domain 作为nginx的server的配置文件，通过软连接在区分不同环境的域名

upstream作为nginx proxy 分发的服务器配置

dispatch.lua 作为入口文件，通过子域名的前缀作为分发。比如test1.3cheng.cn，那么通过test1.lua作为具体的分发处理文件
