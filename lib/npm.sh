from . import env

: ${NpmArgs:=}
: ${NpmLogLevel:=error}
: ${NpmInstallArgs:=--depth 0 --loglevel=$NpmLogLevel --no-progress}
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

        eval "set -- $NpmArgs install $NpmInstallArgs $*"

        npm "$@"
)}
