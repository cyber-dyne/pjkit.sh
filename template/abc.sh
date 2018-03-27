if test -e "$ProjectDir/support/env.sh"; then
        . "$ProjectDir/support/env.sh"
fi

. "$ProjectDir/support/shift.sh"

require 'https://github.com/evilcorptech/pjkit.sh.git' -rev 1.0.1

import pjkit/env
import pjkit/os

if is_macos; then
        import pjkit/brew
fi
