(
from pjkit import env

: ${GitBin:=$(which git)}
: ${GitHooksDir:=$ProjectDir/.githooks}

if test -e "$ProjectDir/.git"; then
        $GitBin config core.hooksPath "$GitHooksDir"
fi
)
