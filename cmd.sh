main() {
    local args=( $@ )
    local arg=${args[0]}
    local nxt_args=${args[@]:1}
    local DDD_PATH=$( dirname $( cd $( dirname $BASH_SOURCE ) && pwd ) )
    local DDD=$( cat $DDD_PATH/env/DDD 2> /dev/null )
    DDD=${DDD:-"ddd"}
    eval "$DDD() { . $DDD_PATH/ddd/cmd.sh \$@; } && export -f $DDD"

    if [[ -z $CHK ]]
    then
        local CHK=$DDD
        $DDD ____
        $DDD _____
    fi

    local file=$DDD_PATH/cmd/$arg/main.sh
    if [ ! -f $file ]
    then
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi
    if [ ! -f $file ]
    then
        $DDD help
        return $?
    fi

    local cmd=". $file $nxt_args"
    if [ -z "$nxt_args" ]
    then
        cmd=". $file ''"
    fi
    if [[ ! "$arg" =~ ^__.*__$ ]]
    then
        cmd="$DDD __trap__; $cmd 2>&1"
        cmd="( $DDD __init__ $nxt_args; $DDD __init___ $nxt_args; $cmd )"
        cmd="$cmd 2> /dev/null"
    fi
    eval $cmd
    return $?
}
main $@
