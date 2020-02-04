main() {
    export CMD=shs
    local args=( $@ )
    local nxt_args=${args[@]:1}
    local dir_path=$( cd $( dirname "$BASH_SOURCE" ) && pwd )
    local file=$dir_path/cmd/$args/main.sh
    if [ "${dir_path##*/}" == "CORE" ]
    then . "$dir_path/cmd/__reload__/main.sh" ""
    else eval "$CMD() { . $dir_path/cmd.sh \$@; } && export -f $CMD"
    fi
    if [ -f "$file" ]
    then
        if [[ "$args" =~ ^__ ]]
        then . "$file" "$nxt_args"
        else bash "$file" "$nxt_args"
        fi
    else
        if [ -f "$dir_path/CORE/cmd/$args/main.sh" ]
        then . "$dir_path/CORE/cmd.sh" ${args[@]}
        else echo "$( ls "$dir_path/cmd" | grep -v ^__ )"
        fi
    fi
}
main $@
unset -f main
