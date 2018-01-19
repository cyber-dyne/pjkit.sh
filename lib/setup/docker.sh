setup_docker()
{(
        from . import os

        if is_macos; then
                setup_docker_for_macos "$@"
        fi
)}

setup_docker_for_macos()
{(
        from . import brew

        brew_install docker
        brew_install docker-machine
        brew_install docker-compose
)}
