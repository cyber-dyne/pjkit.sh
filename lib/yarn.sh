from . import env

: ${YarnArgs:=--silent --no-progress} ## --prefer-offline --non-interactive
: ${YarnPackageFile:=$ProjectDir/package.json}
: ${YarnLockFile:=$ProjectDir/yarn.lock}

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

        eval "set -- $YarnArgs $*"

        ${YarnBin:-$(which yarn)} install "$@"
)}
