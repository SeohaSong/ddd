main() {
    local args=( $@ )
    local adpath=${args[0]}
    local arg=${args[1]}
    export __args__=${args[@]:2}
    export __CMD_PATH__=$adpath
    export __APATH__=$adpath/cmd/$arg/main.sh
    export __ADPATH__=$( dirname "$__APATH__" )

    if [ ${adpath##*/} == core ]; then adpath=$adpath/..; fi
    local file
    for file in cmd.sh .gitignore; do cp "$adpath/core/$file" "$adpath"; done
    local dir 
    for dir in data cmd env tools tools/src
    do
        if [ ! -d $adpath/$dir ]; then mkdir $adpath/$dir; fi
        if [ ! -f $adpath/$dir/.gitkeep ]; then touch $adpath/$dir/.gitkeep; fi
    done

    if [ ! -f $adpath/env/cmd ]; then echo cmd > $adpath/env/cmd; fi
    local name=$( cat $adpath/env/CMD 2> /dev/null || : )
    local cmd="$name() { . $adpath/cmd.sh \$@; } && export -f $name"
    if [ ! -z "$name" ]; then eval "$cmd"; fi
}
main $1
