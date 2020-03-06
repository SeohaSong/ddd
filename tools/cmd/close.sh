main() {
    local e_code=$1

    unset __args__
    unset __opts__

    unset __APATH__
    unset __ADPATH__
    unset __CMD_PATH__
    unset __CMD__
    unset __KEY__

    unset main

    return $e_code
}
main $1
