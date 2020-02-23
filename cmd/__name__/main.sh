main() {
    local adpath=$ADPATH
    local cmd_name=$( cat $adpath/../../../env/name.txt )
    echo ${cmd_name:-cmd}
}
main $1
