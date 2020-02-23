main() {
    local adpath=$( dirname $( eval "$APATH" ) )
    local cmd_name=$( cat $adpath/../../../env/cmd.txt )
    echo ${cmd_name:-cmd}
}
main $1
