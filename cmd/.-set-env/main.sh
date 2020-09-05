main()
{
    export CLICOLOR=1

    local paths=$( echo "${PATH//':'/$'\n'}" | sort | uniq )
    export PATH=${paths//$'\n'/':'}

    echo $DDD | tee $DDD_PATH/env/DDD > /dev/null

    if [[ ! -f $DDD_PATH/.gitignore ]]
    then
        cp $DDD_PATH/ddd/.gitignore $DDD_PATH
    fi

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

    if [[ ! -z "$( which docker )" ]]
    then
        if [[ -z "$( ps -ax | grep -v grep | grep sshd )" ]]
        then
            sudo ssh-keygen -A
            sudo service ssh restart
            sudo usermod -aG docker $USER
        fi
    fi

    alias gogo="cd $DDD_PATH"
    eval "$DDD() { . $DDD_FILE \$@; } && export -f $DDD"
}

main
