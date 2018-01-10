setup_webfont()
{(
        from . import os
        from . import npm

        if is_macos; then
                setup_webfont_for_macos "$@"
        fi

        npm_install -g grunt grunt-cli grunt-webfont
)}

setup_webfont_for_macos()
{(
        from . import brew

        brew_install fontforge --with-python
        brew_install ttfautohint
)}
