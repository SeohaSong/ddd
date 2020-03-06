main() {
    echo "[$__CMD__]"
    local cmd
    for cmd in $( ls "$__CMD_PATH__/cmd" | grep -v ^__.*__$ )
    do echo "  $cmd"
    done
    echo "[ddd]"
    for cmd in $( ls "$__CMD_PATH__/core/cmd" | grep -v ^__.*__$ )
    do echo "  $cmd"
    done
}
main $1
