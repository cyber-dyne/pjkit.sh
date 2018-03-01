from . import env

: ${NodeLibDir:=$SystemDir}

export_node_env()
{
        local modules_dir="$NodeLibDir/node_modules"

        if ! printf -- '%s' "${NODE_PATH:-}" | grep -Eq "(^|:)$modules_dir(:|$)"; then
                NODE_PATH="$modules_dir${NODE_PATH:+:$NODE_PATH}"
        fi

        export NODE_PATH
}
