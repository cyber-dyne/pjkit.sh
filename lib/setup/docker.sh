setup_docker()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Docker.'

        from . import os

        if is_macos; then
                setup_docker_for_macos "$@"
        fi
)}

setup_docker_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Docker.'

        from . import brew

        brew_install docker
        brew_install docker-machine
        brew_install docker-compose
)}
