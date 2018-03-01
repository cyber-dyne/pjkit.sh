setup_make()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Make.'

        from . import os

        if is_macos; then
                setup_make_for_macos "$@"
        fi
)}

setup_make_for_macos()
{(
        echo '[DEPRECATED] Use Brew Bundle to install Make.'

        from . import brew

        brew_install make --with-default-names
        ## --with-default-names avoids using the 'g' prefix for make (gmake).
)}
