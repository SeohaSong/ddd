main() {
    local adpath=$1
    if [ "${adpath##*/}" == core ]; then adpath="$adpath/.."; fi
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
    local cmd=$( cat "$adpath"/env/cmd.txt 2> /dev/null || : )
    if [ "$cmd" != "" ]; then eval "$cmd() { . $adpath/cmd.sh \$@; } && export -f $cmd"; fi
}
main $1
unset -f main
