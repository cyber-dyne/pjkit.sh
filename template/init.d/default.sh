if ! test "$(whoami)" = 'root'; then
        : ${Become:=sudo}
fi
: ${Become:=}

(
import pjkit/os

if is_macos; then
        . "$0.d/macos.sh"
else
        : ## TODO
fi
)
