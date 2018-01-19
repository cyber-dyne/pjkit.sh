from . import env

: ${BrewDir:=$SystemDir/brew}
: ${BrewRev:=master}
: ${BrewUrl:=https://github.com/Homebrew/brew/tarball/$BrewRev}
: ${BrewFile:=$ProjectDir/Brewfile.rb}
: ${BrewArgs:=}
: ${BrewInstallArgs:=}
: ${BrewBundleInstallArgs:=\"--file=$BrewFile\" --no-upgrade}

path_add "$BrewDir/bin"

setup_brew()
{
        if test -x "$BrewDir/bin/brew"; then
                return
        fi

        mkdir -p "$BrewDir"

        curl -LsS "$BrewUrl" \
        | tar --extract --directory "$BrewDir" --strip-components 1

        ## Asserts that the installation went fine, otherwise we must stop.
        test -x "$BrewDir/bin/brew" || fail 'Homebrew installation encountered a problem.\n'
}

brew()
{
        eval "set -- $BrewArgs $*"

        ${BrewBin:-$(which brew)} "$@"
}

brew_install()
{
        if brew ls --versions "$1" >/dev/null 2>&1; then
                return
        fi

        eval "set -- $BrewInstallArgs $*"

        brew install "$@"
}

brew_bundle_install()
{
        eval "set -- $BrewBundleInstallArgs $*"

        brew bundle install "$@"
}
