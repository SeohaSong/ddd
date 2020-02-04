(
    cd $( dirname $BASH_SOURCE )/../../../
    for file in cmd.sh .gitignore
    do cp "CORE/$file" .
    done
    dirs="data env cmd tools tools/src"
    for dir in $dirs
    do
        if [ -f "$dir/.gitkeep" ]; then continue; fi
        mkdir "$dir" && touch "$dir/.gitkeep"
    done
)
. $( dirname $BASH_SOURCE )/../../../cmd.sh > /dev/null
