from . import env

: ${BowerFile:=$ProjectDir/bower.json}
: ${BowerFlags:=}
: ${BowerInstallFlags:=} ## --silent
: ${BowerLibDir:=$SystemDir}
: ${BowerRcFile:=$ProjectDir/bowerrc.json}

setup_bower()
{(
        # from . import os
        from . import npm

        # if is_macos; then
        #         setup_bower_for_macos "$@"
        # fi

        npm_install -g bower
)}

setup_bower_for_macos()
{(
        echo '[DEPRECATED] Use NPM/Yarn to install Bower.'

        from . import brew

        brew_install bower
)}

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

        eval "set -- $BowerFlags install $BowerInstallFlags"

        ${BowerBin:-$(which bower)} "$@"
)}
