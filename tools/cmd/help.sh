main() {
    local CMD_PATH=$__CMD_PATH__
    local CMD=$__CMD__
    echo "[$CMD]"
    local cmd
    for cmd in $( ls "$CMD_PATH/cmd" | grep -v ^__.*__$ )
    do echo "  $cmd"
    done
}
main $1
