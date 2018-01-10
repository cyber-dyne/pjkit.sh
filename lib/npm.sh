from . import env

: ${NpmFlags:=}
: ${NpmLogLevel:=silent}
: ${NpmInstallFlags:=--depth 0 --loglevel=$NpmLogLevel}
: ${NpmPackageFile:=$ProjectDir/package.json}
: ${NpmLockFile:=$ProjectDir/package-lock.json}

npm()
{
        ${NpmBin:-$(which npm)} "$@"
}

npm_install()
{(
        from . import node

        mkdir -p "$NodeLibDir"

        ## We don't want to copy a file on itself.
        if test "$(dirname "$NpmPackageFile")" != "$NodeLibDir"; then
                ## -R follows symbolic links.
                cp -Rf "$NpmPackageFile" "$NodeLibDir/"

                if test -f "$NpmLockFile"; then
                        ## -R follows symbolic links.
                        cp -Rf "$NpmLockFile" "$NodeLibDir/"
                fi
        fi

        cd "$NodeLibDir"

        eval "set -- $NpmFlags install $NpmInstallFlags $*"

        npm "$@"
)}
