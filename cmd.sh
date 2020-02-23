main() {
    local args=( $@ )
    local arg=${args[0]}
    local nxt_args=${args[@]:1}
    local path=${BASH_SOURCE:-${(%):-%x}}
    local adpath=$( cd "$( dirname $path )" && pwd )
    local file="$adpath/cmd/$arg/main.sh"
    local core cmd
    if [ -d "$adpath/core" ]; then core=core; else core=.; fi
    . "$adpath/$core/tools/cmd/reload.sh" "$adpath"
    . "$adpath/$core/tools/cmd/set.sh" "$nxt_args"
    if [[ "$arg" =~ ^__ ]]; then cmd=.; else cmd=bash; fi
    if [ -f "$file" ]
    then $cmd "$file" "$nxt_args"
    elif [ -f "$adpath/core/cmd/$arg/main.sh" ]
    then . "$adpath/core/cmd.sh" ${args[@]}
    else . "$adpath/$core/tools/cmd/help.sh" "$adpath"
    fi
}
main $@
unset -f main
