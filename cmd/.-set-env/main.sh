main()
{
    export CLICOLOR=1

    local paths=$( echo "${PATH//':'/$'\n'}" | sort | uniq )
    export PATH=${paths//$'\n'/':'}

    cp $DDD_PATH/ddd/.gitignore $DDD_PATH

    echo $DDD | tee $DDD_PATH/env/DDD > /dev/null

    local path

    for path in data cmd env tools
    do
        path=$DDD_PATH/$path
        if [ ! -d $path ]
        then
            mkdir $path
            touch $path/.gitkeep
        fi
    done
    
    for path in .-set-env_ .-init_
    do
        path=$DDD_PATH/cmd/$path
        if [ ! -d $path ]
        then
            mkdir $path
            touch $path/main.sh
        fi
    done
}

main
