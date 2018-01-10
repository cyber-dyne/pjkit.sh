from . import env

: ${BrewDir:=$SystemDir/brew}
: ${BrewFlags:=}
: ${BrewRev:=master}
: ${BrewUrl:=https://github.com/Homebrew/brew/tarball/$BrewRev}
: ${BrewInstallFlags:=}

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

brew_install()
{
        local brew_bin=${BrewBin:-$(which brew)}

        if $brew_bin ls | grep -Eq "^$1\$"; then
                return
        fi

        eval "set -- $BrewFlags install $BrewInstallFlags $*"

        $brew_bin "$@"
}
