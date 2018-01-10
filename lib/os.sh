is_unix()
{
        is_linux || is_darwin
}

is_linux()
{
        test "$(uname -s)" = "Linux"
}

is_darwin()
{
        test "$(uname -s)" = "Darwin"
}

is_macos()
{
        is_darwin
}
