main() {
    local CMD_PATH=$__CMD_PATH__
    local cmd_name=$( cat $CMD_PATH/env/CMD 2> /dev/null )
    cmd_name=${cmd_name:-cmd}
    echo "[$cmd_name]"
    local cmd
    for cmd in $( ls "$CMD_PATH/cmd" | grep -v ^__ )
    do echo "  $cmd"
    done
}
main $1
