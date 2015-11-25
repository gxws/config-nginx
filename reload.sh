#!/bin/bash

nginx_config_base=$(cd `dirname $0`; pwd)
nginx_base=$nginx_config_base/..
nginx_worker_base=$nginx_base/nginx
. $nginx_config_base/load_config.sh

echo "重新载入nginx配置..."
load_config

sudo $nginx_worker_base/sbin/nginx -s reload
