fail()
{
        printf -- '%s' "$1" 1>&2

        return 1
}

chkcmd()
{
        ## -v doesn't mean verbose, instead it looks
        ## for the existence ignoring its exit status.
        command -v "$1" > /dev/null 2>&1
}

chkcmdfail()
{
        chkcmd "$1" || fail "$2"
}
