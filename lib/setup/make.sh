setup_make()
{(
        from . import os

        if is_macos; then
                setup_make_for_macos "$@"
        fi
)}

setup_make_for_macos()
{(
        from . import brew

        brew_install make --with-default-names
        ## --with-default-names avoids using the 'g' prefix for make (gmake).
)}
