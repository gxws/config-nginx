
echo "启动挂载目录"
#生产
mount -t nfs 192.168.200.29:/home/tomcat-cluster/tomcat-upload /home/www/real/up
mount -t nfs 192.168.200.30:/home/tomcat-cluster/tomcat-upload/weixin /home/www/real/up/weixin
mount -t nfs 192.168.200.30:/home/tomcat-cluster/tomcat-upload/alipay /home/www/real/up/alipay
mount -t nfs 192.168.200.28:/home/tomcat-cluster/tomcat-upload/web-weather-media /home/www/real/up/web-weather-media
mount -t nfs 192.168.200.28:/home/tomcat-cluster/tomcat-upload/web-lvye /home/www/real/up/web-lvye
mount -t nfs 192.168.200.28:/home/tomcat-cluster/tomcat-upload/web-tdsp /home/www/real/up/web-tdsp

#测试
mount -t nfs 192.168.200.18:/home/tomcat-cluster/tomcat-upload /home/www/test/up
mount -t nfs 192.168.200.22:/home/tomcat-cluster/tomcat-upload/weixin /home/www/test/up/weixin
mount -t nfs 192.168.200.22:/home/tomcat-cluster/tomcat-upload/alipay /home/www/test/up/alipay
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/web-weather-media /home/www/test/up/web-weather-media
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/web-qimeng /home/www/test/up/web-qimeng
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/web-lvye /home/www/test/up/web-lvye
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/web-tdsp /home/www/test/up/web-tdsp
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/manage-lezcashier /home/www/test/up/manage-lezcashier 
mount -t nfs 192.168.200.17:/home/tomcat-cluster/tomcat-upload/web-weather-new-media /home/www/test/up/web-weather-new-media