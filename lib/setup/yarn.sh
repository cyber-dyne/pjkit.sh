setup_yarn()
{(
        from . import os

        if is_macos; then
                setup_yarn_for_macos "$@"
        fi
)}

setup_yarn_for_macos()
{(
        from . import brew

        brew_install yarn
)}
