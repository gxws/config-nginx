#!/bin/bash

nginx_config_base=$(cd `dirname $0`; pwd)
nginx_base=$nginx_config_base/..
nginx_worker_base=$nginx_base/nginx

echo "关闭nginx..."
sudo $nginx_worker_base/sbin/nginx -s quit