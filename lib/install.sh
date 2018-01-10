from . import env

install_bin()
{
        local bin="$1"
        local bin_name="${2:-$(basename "$bin")}"

        mkdir -p "$SystemBinDir"

        ln -sf "$bin" "$SystemBinDir/$bin_name"
}

install_bins()
{
        find "$1" -type l -o -type f -maxdepth 1 | while IFS= read -r bin; do
                install_bin "$bin"
        done
}
