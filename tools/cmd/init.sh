main() {
    local args=( $@ )
    local dpath=${args[0]}
    local arg=${args[1]}

    local adpath=$( cd $dpath && pwd )
    export __args__=${args[@]:2}
    export __opts__

    export __APATH__=$adpath/cmd/$arg/main.sh
    export __ADPATH__=$( dirname "$__APATH__" )
    export __CMD_PATH__=$adpath
    if [ ! -d $adpath/core ]
    then export __CMD_PATH__=$( cd $adpath/.. && pwd )
    fi
    if [ ! -f $__CMD_PATH__/env/CMD ]; then echo ddd > $__CMD_PATH__/env/CMD; fi
    local cmd_name=$( cat $__CMD_PATH__/env/CMD 2> /dev/null || : )
    export __CMD_NAME__=$cmd_name
    if [ ! -z "$cmd_name" ]
    then 
        eval "
        $cmd_name() { . $__CMD_PATH__/cmd.sh \$@; }
        export -f $cmd_name
        "
    fi
    export __KEY__=$( cat "$__CMD_PATH__/env/KEY" 2> /dev/null || : )

    local file dir
    for file in cmd.sh .gitignore
    do cp "$__CMD_PATH__/core/$file" "$__CMD_PATH__"
    done
    for dir in data cmd env tools tools/src
    do
        if [ ! -d $__CMD_PATH__/$dir ]
        then mkdir $__CMD_PATH__/$dir
        fi
        if [ ! -f $__CMD_PATH__/$dir/.gitkeep ]
        then touch $__CMD_PATH__/$dir/.gitkeep
        fi
    done
}
main $1