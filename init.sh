#!/bin/bash

nginx_config_base=$(cd `dirname $0`; pwd)
nginx_base=$nginx_config_base/..
nginx_worker_base=$nginx_base/nginx
. $nginx_config_base/nginx-cluster.conf
. $nginx_config_base/load_config.sh

echo "下载nginx"
wget -P $nginx_base http://software.gxwsxx.com/software/nginx.tar.gz
mkdir $nginx_base/tmp
tar -zxf $nginx_base/nginx.tar.gz -C $nginx_base/tmp
rm -r $nginx_base/nginx.tar.gz
if [ -e $nginx_base/source ]; then
    rm -fr $nginx_base/source
fi
for temp in $nginx_base/tmp/*;
do
	mv -f $temp $nginx_base/source
done
rm -fr $nginx_base/tmp

echo "编译nginx"
sudo yum install pcre pcre-devel openssl openssl-devel gcc -y
cd $nginx_base/source
./configure --prefix=$nginx_worker_base/ --pid-path=$nginx_worker_base/logs/nginx.pid --with-http_ssl_module --with-mail --with-mail_ssl_module --with-http_stub_status_module
make && make install
cd -

echo "修改nginx.conf配置"
nginx_conf_file=$nginx_worker_base/conf/nginx.conf

cp -f ${nginx_conf_file}.default $nginx_conf_file

sed -i -e '/user.*nobody;/a user '"${nginx_worker_user}"';' $nginx_conf_file
sed -i -e 's/worker_processes.*/worker_processes '"${nginx_worker_processes}"';/g' $nginx_conf_file
sed -i -e 's/worker_connections.*1024;/worker_connections '"${nginx_worker_connections}"';/g' $nginx_conf_file
sed -i -e '/events.*{/a use epoll;' ${nginx_conf_file}
#sed -i -e '/http.*{/a log_format\t compression '"\'"'$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" "$gzip_ratio" "$http_x_forwarded_for"'"\'"';' ${nginx_conf_file}
sed -i -e '/http.*{/a include\t proxy/proxy.conf;' $nginx_conf_file
sed -i -e '/http.*{/a include\t vhost/*.conf;' $nginx_conf_file
for file in ${nginx_config_base}/vhost/*;do
    if [ -d ${file} ]; then
        sed -i -e '/http.*{/a include\t vhost/'"${file##*/}"'/*.conf;' $nginx_conf_file
    fi
done
sed -i -e '/^\ *server_name.*localhost;/a location /status {stub_status on;}' $nginx_conf_file

load_config

echo "验证worker用户"
worker_user=`cat /etc/passwd | grep $nginx_worker_user`
if [ -z $worker_user ];
then
	sudo useradd $nginx_worker_user
fi

#chown -R $nginx_cluster_user:$nginx_cluster_group $nginx_cluster_base
#echo "修改linux内核配置"
#cp -f ${nginx_cluster_base}/conf/sysctl-nginx.conf /etc/sysctl.d/
#sysctl -p /etc/sysctl.d/sysctl-nginx.conf

