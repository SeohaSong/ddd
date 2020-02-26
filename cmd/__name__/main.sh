main() {
    local ADPATH=$__ADPATH__
    local cmd_name=$( cat $ADPATH/../../../env/cmd )
    echo ${cmd_name:-cmd}
}
main
