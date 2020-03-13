main() {
    local args=( $@ )
    local arg=${args[0]}
    local nxt_args=${args[@]:1}
    local INTRO='echo ${BASH_SOURCE:-${(%):-%x}}'
    local DDD_PATH=$( cd $( dirname $( eval $INTRO ) )/.. && pwd )
    local DDD=$( cat $DDD_PATH/env/DDD 2> /dev/null || echo ddd )
    eval "$DDD() { . $DDD_PATH/ddd/cmd.sh \$@; } && export -f $DDD"
    local file=$DDD_PATH/ddd/cmd/$arg/main.sh
    if [ ! -f $file ]; then file=$DDD_PATH/cmd/$arg/main.sh; fi
    if [ ! -f $file ]; then $DDD help; else
        local cmd=". $file '$nxt_args'"
        if [[ ! "$arg" =~ ^__.*__$ ]]; then
            cmd="( $DDD __init__ $nxt_args; $cmd 2>&1 ) 2> /dev/null"
            cmd="$cmd; $DDD __close__ \$?"; fi
        eval $cmd; fi
}
main $@
