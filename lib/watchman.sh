: ${WatchmanMakeCmd:=$ZeroDir/build}
: ${WatchmanMakeArgs:=--settle 0.2}
: ${WatchmanMakePatterns:=\'**/*\'}

setup_watchman()
{(
        from . import os

        if is_macos; then
                setup_watchman_for_macos "$@"
        fi
)}

setup_watchman_for_macos()
{(
        from . import brew

        brew_install watchman
)}

watchmanmake()
{(
        from . import env

        echo "Starting continuous build..."
        echo "Hit CTRL-c to exit."

        cd "$ProjectDir"

        $WatchmanMakeCmd "$@"

        set -f ## noglob

        eval "set -- -p $WatchmanMakePatterns $WatchmanMakeArgs --run \"$WatchmanMakeCmd $*\""

        ${WatchmanMakeBin:-$(which watchman-make)} "$@"
)}
