from . import env

: ${BowerFile:=$ProjectDir/bower.json}
: ${BowerArgs:=}
: ${BowerInstallArgs:=--quiet} ## --silent
: ${BowerLibDir:=$SystemDir}
: ${BowerRcFile:=$ProjectDir/bowerrc.json}

bower_install()
{(
        mkdir -p "$BowerLibDir"

        ## We don't want to copy a file on itself.
        if test "$(dirname "$BowerFile")" != "$BowerLibDir"; then
                ## -R follows symbolic links.
                cp -Rf "$BowerFile" "$BowerLibDir/"

                if test -f "$BowerRcFile"; then
                        ## -R follows symbolic links.
                        cp -Rf "$BowerRcFile" "$BowerLibDir/.bowerrc"
                        ## We need to specify the right destination file name
                        ## because user could use a different one for its file.
                fi
        fi

        cd "$BowerLibDir"

        eval "set -- $BowerArgs install $BowerInstallArgs"

        ${BowerBin:-$(which bower)} "$@"
)}
