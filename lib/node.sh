from . import env
# from . import path

: ${NodeLibDir:=$SystemDir}

# path_add "$NodeLibDir/node_modules/.bin"

export_node_env()
{
        local modules_dir="$NodeLibDir/node_modules"

        if ! printf -- '%s' "${NODE_PATH:-}" | grep -Eq "(^|:)$modules_dir(:|$)"; then
                NODE_PATH="$modules_dir${NODE_PATH:+:$NODE_PATH}"
        fi

        export NODE_PATH
}
