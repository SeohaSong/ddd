main() {
    export __CMD_PATH__=$adpath
    export __APATH__=$__CMD_PATH__/$path
    export __ADPATH__=$( dirname "$__APATH__" )
    unset __CMD_PATH__
    unset __APATH__
    unset __ADPATH__
}
main $1
