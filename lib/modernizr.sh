from . import env

: ${ModernizrFile:=$ProjectDir/modernizr.json}
: ${ModernizrFlags:=}
: ${ModernizrJsFile:=$SystemDir/modernizr.js}

modernizr()
{
        eval "set -- $ModernizrFlags $*"

        ${ModernizrBin:-$(which modernizr)} --config "$ModernizrFile" --dest "$ModernizrJsFile" "$@"
}
