from . import env

: ${BrowserSyncFile:=$ProjectDir/browsersync.js}

browsersync_start()
{
        ${BrowserSyncBin:-$(which browser-sync)} start --config "$BrowserSyncFile" "$@"
}
