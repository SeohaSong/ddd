(
    cd $( dirname $BASH_SOURCE )/../../../
    for file in cmd.sh .gitignore
    do cp "CORE/$file" .
    done
    dirs="data cmd tools tools/src"
    for dir in $dirs
    do
        if [ -f "$dir/.gitkeep" ]; then continue; fi
        mkdir "$dir" && touch "$dir/.gitkeep"
    done
    mkdir env
    if ! [ -f env/cmd.txt ]; then echo cmd > env/cmd.txt; fi
)
. $( dirname $BASH_SOURCE )/../../../cmd.sh > /dev/null
