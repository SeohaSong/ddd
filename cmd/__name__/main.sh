main() {
    local ADPATH=$__ADPATH__
    local cmd_name=$( cat $ADPATH/../../../env/name.txt )
    echo ${cmd_name:-cmd}
}
main
