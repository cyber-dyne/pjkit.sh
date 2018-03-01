set -e ## errexit
set -u ## nounset

: ${ShiftRev:=4b77bf8}
: ${PjkitRev:=a906bb6}
: ${ShiftUrl:=https://github.com/evilcorptech/shift.git}
: ${SandboxDir:=$ProjectDir/sandbox}
: ${SystemDir:=$SandboxDir/system}
: ${SHIFT_DIR:=$SystemDir/shift}
: ${SHIFT_HOME_DIR:=$SystemDir/shift.d}

test -e "$SHIFT_DIR" || git clone --quiet "$ShiftUrl" "$SHIFT_DIR"
git -C "$SHIFT_DIR" checkout --quiet "${ShiftRev}^0"

. "$SHIFT_DIR/lib/shift.sh"

require 'https://github.com/evilcorptech/pjkit.sh.git' -rev $PjkitRev

from pjkit import env

export PATH="$SystemDir/bin:$SystemDir/brew/bin${PATH:+:$PATH}"
