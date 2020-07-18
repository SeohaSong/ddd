#!/bin/bash

main() {
    local args=( $@ )
    local arg=${args[0]}
    args=${args[@]:1}
    args=${args:-"''"}

    local CHK=$DDD
    local DDD_PATH=$( dirname $( cd $( dirname $BASH_SOURCE ) && pwd ) )
    local DDD=$( cat $DDD_PATH/env/DDD 2> /dev/null )
    DDD=${DDD:-"ddd"}
    eval "$DDD() { . $DDD_PATH/ddd/cmd.sh \$@; } && export -f $DDD"

    local file=$DDD_PATH/cmd/$arg/main.sh
    if [ ! -f $file ]
    then
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi
    if [ ! -f $file ]
    then
        echo "$arg $args"
        arg=help
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi

    local set=":"
    local init="$DDD .-trap"
    if [[ -z $CHK ]]
    then
        set="$DDD .-set-env && $DDD .-set-env_"
        init="$init && $DDD .-init $args && $DDD .-init_ $args"
    fi

    local cmd=". $file $args"
    if [[ ! "${arg#\.}" =~ ^- ]]
    then
        cmd="( $init && $cmd 2>&1 ) 2> /dev/null"
    fi
    cmd="$set && $cmd"
    eval "$cmd"
}

main $@
