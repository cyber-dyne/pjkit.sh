from . import env
from . import path

: ${GemDir:=$SystemDir/gem}
: ${GemFile:=$ProjectDir/Gemfile}
: ${GemArgs:=}
: ${GemInstallArgs:=--install-dir \"$GemDir\" --verbose}

path_add "$GemDir/bin"

gem_install()
{
        local gem_bin="${GemBin:-$(which gem)}"

        for gem; do
                if ! $gem_bin list --no-details --no-versions | grep -Eq "^$gem\$"; then
                        eval "set -- $GemArgs install $GemInstallArgs $gem"

                        GEM_PATH="$GemDir${GEM_PATH:+:$GEM_PATH}" \
                        $gem_bin "$@"
                fi
        done
}

export_gem_env()
{
        if ! printf -- '%s' "${GEM_PATH:-}" | grep -Eq "(^|:)$GemDir(:|$)"; then
                GEM_PATH="$GemDir${GEM_PATH:+:$GEM_PATH}"
        fi

        export GEM_PATH
}
