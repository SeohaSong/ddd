main() {
    local args=( $@ )
    local core=${args[0]}
    local arg=${args[1]}
    local dpath=$( dirname ${BASH_SOURCE:-${(%):-%x}})/../../..
    local adpath=$( cd "$dpath" && pwd )

    local path=cmd/$arg/main.sh
    if [ "$core" == "." ]; then path=core/cmd/$arg/main.sh; fi
    export APATH=$adpath/$path
    export ADPATH=$( dirname "$APATH" )
    
    local cmd=bash
    if [[ "$arg" =~ ^__.*__$ ]]; then cmd=.; fi
    export CMD=$cmd

    local file
    for file in cmd.sh .gitignore
    do cp "$adpath/core/$file" "$adpath"
    done
    local dir 
    for dir in data cmd env tools tools/src
    do
        if [ -f "$adpath/$dir/.gitkeep" ]; then continue; fi
        mkdir "$adpath/$dir" && touch "$adpath/$dir/.gitkeep"
    done
    local name=$( cat "$adpath"/env/name.txt 2> /dev/null || : )
    if [ "$name" != "" ]
    then eval "$name() { . $adpath/cmd.sh \$@; } && export -f $name"
    fi
}
main $1
