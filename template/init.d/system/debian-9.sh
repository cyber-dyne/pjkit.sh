if test "$(whoami)" != 'root'; then
        : ${Become:=sudo}
fi
: ${Become:=}
