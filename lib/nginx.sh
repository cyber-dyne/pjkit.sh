from . import env
from . import os

if is_macos; then
        from . import brew
        : ${NginxPrefix:=$BrewDir}
else
        : ${NginxPrefix:=}
fi
: ${NginxDir:=$NginxPrefix/etc/nginx}

setup_nginx()
{(
        from . import os

        if is_macos; then
                setup_nginx_for_macos "$@"
        elif is_linux; then
                setup_nginx_for_linux "$@"
        fi
)}

setup_nginx_for_macos()
{(
        from . import brew

        brew_install nginx
        # brew_install homebrew/nginx/nginx-full --with-echo-module
)}

setup_nginx_for_linux()
{(
        from . import utils

        if chkcmd apt-get && ! chkcmd nginx; then
                sudo apt-get install -y nginx
        fi
)}

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
