config-nginx
============

nginx集群配置

一、说明
---
### 1、文档
[nginx文档地址](http://nginx.org/)

### 2、服务器结构
由3台服务器组成的集群，每台服务器运行1个nginx实例。<br />
nginx实例使用服务器上默认http(80)服务端口和默认https(443)服务端口。

### 3、目录结构
集群根目录在/home/nginx，需要创建www用户，以该用户运行nginx worker。<br />
需要提供http服务的文件放置在/home/www目录下，并设置owner为www用户。

### 4、集群模式
nginx集群使用负载均衡方式部署。每个nginx实例负责处理一部分http请求。

### 5、访问
1、使用DNS配置域名。<br />
2、dns（三层）负载均衡。相同的域名指向nginx集群当中的所有ip。<br />
3、lvs（四层）负载均衡。域名指向nginx集群的vip。
4、配置nginx，根据不同的域名进行http反向代理。
	
二、部署教程
---
### 1、创建nginx工作目录
	useradd www
	mkdir /home/nginx
### 2、从git下载配置
	cd /home/nginx
	git clone https://仓库地址
	cd /home/nginx/config-nginx
	git checkout origin/相应的分支
### 3、运行初始化配置
	chmod a+x *
	./init.sh
### 4、启动nginx
	./startup.sh

	