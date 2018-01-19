setup_watchman()
{(
        from . import os

        if is_macos; then
                setup_watchman_for_macos "$@"
        fi
)}

setup_watchman_for_macos()
{(
        from . import brew

        brew_install watchman
)}
