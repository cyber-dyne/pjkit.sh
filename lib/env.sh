from . import path

: ${ProjectDir:=${PJKIT_PROJECT_DIR:-$(cd "$ZeroDir/.." && pwd)}}
: ${SandboxDir:=${PJKIT_SANDBOX_DIR:-$ProjectDir/sandbox}}
: ${BuildDir:=${PJKIT_BUILD_DIR:-$SandboxDir/build}}
: ${SystemDir:=${PJKIT_SYSTEM_DIR:-$SandboxDir/system}}
: ${SystemBinDir:=$SystemDir/bin}

path_add "$SystemBinDir"
path_add "$ZeroDir"
