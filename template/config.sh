. "$(dirname "$0")/.shift.sh"

require 'https://github.com/cyber-dyne/pjkit.sh.git'

from pjkit import env

export PATH="$SystemDir/brew/bin${PATH:+:$PATH}"
export NODE_PATH="$ProjectDir/node_modules:$SystemDir/node_modules${NODE_PATH:+:$NODE_PATH}"
