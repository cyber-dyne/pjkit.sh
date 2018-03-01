setup_yarn()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Yarn.'

        from . import os

        if is_macos; then
                setup_yarn_for_macos "$@"
        fi
)}

setup_yarn_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Yarn.'

        from . import brew

        brew_install yarn
)}
