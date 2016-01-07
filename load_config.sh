
load_config(){
    echo "载入vhost proxy ssl配置..."
    copy_dest=$nginx_worker_base/conf/
    cp -rf $nginx_config_base/vhost ${copy_dest}
    cp -rf $nginx_config_base/proxy ${copy_dest}
    cp -rf $nginx_config_base/ssl ${copy_dest}
    
    #chown -R ${nginx_cluster_user}:${nginx_cluster_group} ${copy_dest}
}