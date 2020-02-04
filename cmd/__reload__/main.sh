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
    if [ -f env/cmd.txt ]; then exit; fi
    mkdir env && echo cmd > env/cmd.txt
)
. $( dirname $BASH_SOURCE )/../../../cmd.sh > /dev/null
