: ${TrapExitHandler:=kill_bgjobs}

trap_exit()
{
        trap $TrapExitHandler EXIT
}

kill_bgjobs()
{
        kill -- "-$$" 2> /dev/null || true
}
