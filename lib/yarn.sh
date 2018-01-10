from . import env

: ${YarnFlags:=--silent --no-progress} ## --prefer-offline --non-interactive
: ${YarnPackageFile:=$ProjectDir/package.json}
: ${YarnLockFile:=$ProjectDir/yarn.lock}

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

yarn_install()
{(
        from . import node

        mkdir -p "$NodeLibDir"

        ## We don't want to copy a file on itself.
        if test "$(dirname "$YarnPackageFile")" != "$NodeLibDir"; then
                ## -R follows symbolic links.
                cp -Rf "$YarnPackageFile" "$NodeLibDir/"

                if test -f "$YarnLockFile"; then
                        ## -R follows symbolic links.
                        cp -Rf "$YarnLockFile" "$NodeLibDir/"
                fi
        fi

        cd "$NodeLibDir"

        eval "set -- $YarnFlags $*"

        ${YarnBin:-$(which yarn)} install "$@"
)}
