from . import env

: ${ModernizrFile:=$ProjectDir/modernizr.json}
: ${ModernizrArgs:=}
: ${ModernizrJsFile:=$SystemDir/modernizr.js}

modernizr()
{
        eval "set -- $ModernizrArgs $*"

        ${ModernizrBin:-$(which modernizr)} --config "$ModernizrFile" --dest "$ModernizrJsFile" "$@"
}
