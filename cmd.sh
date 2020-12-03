#!/bin/bash
main() {
    local args=( $@ )
    local arg=${args[0]:-"__"}
    args=${args[@]:1}
    args=${args:-"''"}

    local ARG=$ARG
    local DDD_PATH=$( dirname $( cd $( dirname $BASH_SOURCE ) && pwd ) )
    local DDD_FILE="$DDD_PATH/ddd/cmd.sh"
    local DDD=$( cat $DDD_PATH/env/DDD 2> /dev/null )
    DDD=${DDD:-"ddd"}

    local set=":"
    local init="$DDD -trap"
    if [[ -z $ARG ]]
    then
        ARG=$arg
        set=". $DDD_FILE .-set-env_ && . $DDD_FILE .-set-env"
        init="$init && $DDD .-init_ $args && $DDD .-init $args"
    fi

    local file=$DDD_PATH/cmd/$arg/main.sh
    if [ ! -f $file ]
    then
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi
    if [ ! -f $file ]
    then
        args=( $args )
        local arg_=${args[0]:-"__"}
        args=${args[@]:1}
        args=${args:-"''"}
        file=$DDD_PATH/cmd/$arg/$arg_/main.sh
    fi
    if [ ! -f $file ]
    then
        file=$DDD_PATH/ddd/cmd/$arg/$arg_/main.sh
    fi
    if [ ! -f $file ]
    then
        arg=.throw
        args="''"
        file=$DDD_PATH/ddd/cmd/$arg/main.sh
    fi

    local cmd=". $file $args"
    if [[ ! "${arg#\.}" =~ ^- ]]
    then
        cmd="( $init && $cmd 2>&1 ) 2> /dev/null"
    fi
    cmd="$set && $cmd"
    eval "$DDD() { . $DDD_FILE \$@; } && export -f $DDD && $cmd"
}
main $@
