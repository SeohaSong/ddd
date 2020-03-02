main() {
    local args=( $@ )
    local dpath=${args[0]}
    local arg=${args[1]}

    export __args__=${args[@]:2}

    export __CMD_PATH__=$( cd $dpath && pwd )
    export __APATH__=$__CMD_PATH__/cmd/$arg/main.sh
    export __ADPATH__=$( dirname "$__APATH__" )
    export __MAIN_PATH__=$__CMD_PATH__
    if [ ! -d $__CMD_PATH__/core ]
    then export __MAIN_PATH__=$( cd $__CMD_PATH__/.. && pwd )
    fi

    local file dir
    for file in cmd.sh .gitignore
    do cp "$__MAIN_PATH__/core/$file" "$__MAIN_PATH__"
    done
    for dir in data cmd env tools tools/src
    do
        if [ ! -d $__MAIN_PATH__/$dir ]
        then mkdir $__MAIN_PATH__/$dir
        fi
        if [ ! -f $__MAIN_PATH__/$dir/.gitkeep ]
        then touch $__MAIN_PATH__/$dir/.gitkeep
        fi
    done
    
    if [ ! -f $__MAIN_PATH__/env/CMD ]
    then echo cmd > $__MAIN_PATH__/env/CMD
    fi
    local name=$( cat $__MAIN_PATH__/env/CMD 2> /dev/null || : )
    local cmd="$name() { . $__CMD_PATH__/cmd.sh \$@; } && export -f $name"
    if [ ! -z "$name" ]; then eval "$cmd"; fi
}
main $1