: ${WatchmanMakeCmd:=$ZeroDir/build}
: ${WatchmanMakeArgs:=--settle 0.2}
: ${WatchmanMakePatterns:=**/*}

watchmanmake()
{(
        from . import env

        echo "Starting continuous build..."
        echo "Hit CTRL-c to exit."

        cd "$ProjectDir"

        $WatchmanMakeCmd "$@"

        set -f ## noglob

        eval "set -- $WatchmanMakeArgs --pattern \"$WatchmanMakePatterns\" --run \"$WatchmanMakeCmd $*\""

        ${WatchmanMakeBin:-$(which watchman-make)} "$@"
)}
