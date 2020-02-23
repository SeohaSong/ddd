main() {
    local args=( $@ )
    local arg=${args[0]}
    local nxt_args=${args[@]:1}
    local path=${BASH_SOURCE:-${(%):-%x}}
    local adpath=$( cd "$( dirname $path )" && pwd )
    local apath=$adpath/cmd/$arg/main.sh
    local core cmd
    if [[ "$arg" =~ ^__ ]]; then cmd=.; else cmd=bash; fi
    if [ -d "$adpath/core" ]; then core=core; else core=.; fi
    . "$adpath/$core/tools/cmd/init.sh" "$adpath"
    if [ -f "$apath" ]
    then $cmd "$apath" "$nxt_args"
    elif [ -f "$adpath/core/cmd/$arg/main.sh" ]
    then . "$adpath/core/cmd.sh" ${args[@]}
    else . "$adpath/$core/tools/cmd/help.sh" "$adpath"
    fi
}
main $@
unset -f main
