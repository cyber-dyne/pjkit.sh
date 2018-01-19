${NodeVersion:-9} ## 6 | 8 | 9

setup_node()
{(
        from . import os

        if is_macos; then
                setup_node_for_macos "$@"
        fi
)}

setup_node_for_macos()
{(
        from . import brew

        brew_install node@$NodeVersion
)}
