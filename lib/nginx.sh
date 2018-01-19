: ${NginxPrefix:=}
: ${NginxEtcDir:=$NginxPrefix/etc/nginx}

nginx_start()
{
        ## Let's check if the NGINX configuration is valid and in case
        ## we start the process.
        ${NginxBin:-$(which nginx)} -t
        ${NginxBin:-$(which nginx)}
}

nginx_stop()
{
        ${NginxBin:-$(which nginx)} -s stop
}

nginx_restart()
{
        nginx_stop || true
        nginx_start
}

nginx_reload()
{
        ## Let's check if the NGINX configuration is valid and in case
        ## let's inform NGINX that it is time to reload configuration files.
        ${NginxBin:-$(which nginx)} -t
        ${NginxBin:-$(which nginx)} -s reload
}
