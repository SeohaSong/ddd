main() {
    local args=( $@ )
    local arg=${args[0]}
    local nxt_args=${args[@]:1}
    local INTRO='
        file=${BASH_SOURCE:-${(%):-%x}};
        echo $( cd $( dirname $file ) && pwd )/${file##*/}'
    local DDD_PATH=$( dirname $( dirname $( eval $INTRO ) ) )
    local DDD=$( cat $DDD_PATH/env/DDD 2> /dev/null || echo ddd )
    eval "$DDD() { . $DDD_PATH/ddd/cmd.sh \$@; } && export -f $DDD"
    if [[ -z $CHK ]]; then local CHK=$DDD && $DDD ____; fi
    local file=$DDD_PATH/ddd/cmd/$arg/main.sh
    if [ ! -f $file ]; then file=$DDD_PATH/cmd/$arg/main.sh; fi
    if [ ! -f $file ]; then $DDD help; else
        local cmd=". $file $nxt_args"
        if [ -z "$nxt_args" ]; then cmd=". $file ''"; fi
        if [[ ! "$arg" =~ ^__.*__$ ]]; then
            cmd="( $DDD __init__ $nxt_args; $DDD __trap__; $cmd 2>&1 )"
            cmd="$cmd 2> /dev/null"; fi
        eval $cmd; fi
}
main $@
