path_add()
{
        if printf -- "${PATH:-}" | grep -Eq "(^|:)$1(:|$)"; then
                return
        fi

        PATH="$1${PATH:+:$PATH}"
}
