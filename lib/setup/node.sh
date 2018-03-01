${NodeVersion:-9} ## 6 | 8 | 9

setup_node()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Node.'

        from . import os

        if is_macos; then
                setup_node_for_macos "$@"
        fi
)}

setup_node_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Node.'

        from . import brew

        brew_install node@$NodeVersion
)}
