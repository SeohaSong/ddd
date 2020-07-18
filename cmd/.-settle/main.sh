main()
{
    file=$PWD/ddd/cmd.sh
    echo $DDD_PATH
    if [[ -f $file && $PWD != $DDD_PATH ]]
    then
        echo 1
        unset DDD
        . $file
    else
        echo 2
        $DDD help
    fi
}

main
