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

    local file=$DDD_PATH/cmd/$arg/main.sh
    if [ ! -f $file ]
    then
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi
    if [ ! -f $file ]
    then
        arg=.throw
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi

    local set=":"
    local init=":"
    if [[ -z $CHK ]]
    then
        set="$set && $DDD .-set-env_ && $DDD .-set-env"
        init="$init && $DDD .-trap && $DDD .-init_ $args && $DDD .-init $args"
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
