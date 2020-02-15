main() {
    local adpath=$1
    local cmd_name=$( cat $adpath/env/cmd.txt 2> /dev/null )
    cmd_name=${cmd_name:-cmd}
    echo "[$cmd_name]"
    local cmd
    for cmd in $( ls "$adpath/cmd" | grep -v ^__ )
    do echo "  $cmd"
    done
}
main $1
