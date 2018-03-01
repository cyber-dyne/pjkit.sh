from . import env
from . import path

: ${Woff2Dir:=$SystemDir/woff2}
: ${Woff2Rev:=v1.0.2}

path_add "$Woff2Dir"

setup_fontcustom()
{(
        from . import os
        from . import gem

        if is_macos; then
                setup_fontcustom_for_macos "$@"
        fi

        gem_install fontcustom

        test -e "$Woff2Dir/.git" || git clone --recursive https://github.com/google/woff2.git "$Woff2Dir"

        if test ! -x "$Woff2Dir/woff2_info"; then
                cd "$Woff2Dir"
                git checkout "$Woff2Rev"
                make --silent clean all
                cd -
        fi
)}

setup_fontcustom_for_macos()
{(
        from . import brew

        brew_install fontforge --with-python
        brew_install eot-utils
)}
