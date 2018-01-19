from . import env
# from . import path

: ${NodeLibDir:=$SystemDir}
: ${NodeVersion:=9}                     ## 6 | 8 | 9

# path_add "$NodeLibDir/node_modules/.bin"

setup_node()
{(
        from . import os

        if is_macos; then
                setup_node_for_macos "$@"
        fi
)}

setup_node_for_macos()
{(
        from . import brew

        brew_install node@$NodeVersion
)}

export_node_env()
{
        local modules_dir="$NodeLibDir/node_modules"

        if ! printf -- '%s' "${NODE_PATH:-}" | grep -Eq "(^|:)$modules_dir(:|$)"; then
                NODE_PATH="$modules_dir${NODE_PATH:+:$NODE_PATH}"
        fi

        export NODE_PATH
}
