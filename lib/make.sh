from . import env

: ${MakeFile:=$ProjectDir/Makefile}
: ${MakeArgs:=--no-print-directory --no-builtin-rules PROJECT_DIR=\"$ProjectDir\" BUILD_DIR=\"$BuildDir\" SANDBOX_DIR=\"$SandboxDir\" SYSTEM_DIR=\"$SystemDir\"}

make()
{
        eval "set -- $MakeArgs $*"

        ${MakeBin:-$(which make)} -C "$ProjectDir" -f "$MakeFile" "$@" | sed -e "s:$ProjectDir:.:g"
}
