main() {
    local adpath=$( dirname $( eval "$__apath__" ) )
    local cmd_name=$( cat $adpath/../../../env/cmd.txt )
    echo ${cmd_name:-cmd}
}
main $1
unset -f main
