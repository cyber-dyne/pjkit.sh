from . import env
from . import path
from . import gem

: ${BundlerDir:=$SystemDir/bundler}
: ${BundlerFlags:=}
: ${BundlerInstallFlags:=}

path_add "$BundlerDir/bin"

setup_bundler()
{(
        from . import gem

        gem_install "$@" bundler
)}

bundler()
{
        eval "set -- $BundlerFlags $*"

        BUNDLE_GEMFILE="$GemFile" \
        BUNDLE_PATH="$BundlerDir" \
        ${BundlerBin:-$(which bundler)} "$@"
}

bundler_install()
{
        eval "set -- $BundlerInstallFlags $*"

        bundler install "$@"

        rm -rf "$(dirname "$GemFile")/.bundle"
}

export_bundler_env()
{
        export BUNDLE_PATH="$BundlerDir"
        export BUNDLE_GEMFILE="$GemFile"
}
