main() {
    local args=( $@ )
    local arg=${args[0]}
    local adpath=$( dirname "${BASH_SOURCE:-${(%):-%x}}" )
    local core=.
    if [ -d "$adpath/core" ]; then core=core; fi
    local nxt_args="$core ${args[@]}"
    . "$adpath/$core/tools/cmd/init.sh" "$nxt_args"
    nxt_args="${args[@]:1}"
    if [ -f "$APATH" ]
    then $CMD "$APATH" "$nxt_args"
    elif [ -f "$adpath/core/cmd/$arg/main.sh" ]
    then . "$adpath/core/cmd.sh" ${args[@]}
    else . "$adpath/$core/tools/cmd/help.sh" "$adpath"
    fi
}
main $@
unset -f main
