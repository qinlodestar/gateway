#  nginx + lua gateway
背景：微信小程序在审核的过程中，需要上线后端代码到线上环境，但是可能代码（版本没有兼容）会影响现有小程序的使用。那么能否通过网关将不同版本接口分发到不同的服务器，在小程序审核期间分发到灰度服务器，线上版本分发到线上服务器。
