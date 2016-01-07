#!/bin/bash

nginx_config_base=$(cd `dirname $0`; pwd)
nginx_base=$nginx_config_base/..
nginx_worker_base=$nginx_base/nginx
. $nginx_config_base/load_config.sh

echo "启动nginx..."
load_config
sudo $nginx_worker_base/sbin/nginx

echo "载入mount设置"
#. $nginx_config_base/mount.sh