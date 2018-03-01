setup_watchman()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Watchman.'

        from . import os

        if is_macos; then
                setup_watchman_for_macos "$@"
        fi
)}

setup_watchman_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Watchman.'

        from . import brew

        brew_install watchman
)}
