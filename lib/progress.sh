: ${ProgressCompletedMarker:=#}
: ${ProgressRemainingMarker:= }
: ${ProgressVerbose:=no}
: ${ProgressSilent:=no}
: ${ProgressBarStyle:=\\r \{completed\}  \{bar\}  \{total\}}

ProgressCounter=0
# ProgressMax= ## User must define this variable.

task()
{
        progress $ProgressCounter $ProgressMax

        if test "$ProgressVerbose" = 'yes'; then
                "$@"
        elif test "$ProgressSilent" = 'yes'; then
                "$@" 1>/dev/null 2>/dev/null
        else
                "$@" 1>/dev/null
        fi

        ProgressCounter=$(expr $ProgressCounter + 1)
        progress $ProgressCounter $ProgressMax
}

progress()
{
        local completed=$(expr $1 '*' 100 '/' $2)
        local pending=$(expr 100 - $completed)
        local bar=

        bar="$(printf -- "%${completed}s"   | tr ' ' "$ProgressCompletedMarker")"
        bar="$bar$(printf -- "%${pending}s" | tr ' ' "$ProgressRemainingMarker")"

        printf -- "${ProgressBarStyle}" \
        | sed -e "s:{completed}:$1:g"   \
              -e "s:{total}:$2:g"       \
              -e "s:{bar}:$bar:g"       \
        | tr -d '\n'
}
