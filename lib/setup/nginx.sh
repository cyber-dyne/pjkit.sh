setup_nginx()
{(
        from . import os

        if is_macos; then
                setup_nginx_for_macos "$@"
        fi
)}

setup_nginx_for_macos()
{(
        from . import brew

        brew_install nginx
        # brew_install homebrew/nginx/nginx-full --with-echo-module
)}
