main()
{
    file=$PWD/ddd/cmd.sh
    if [[ -f $file && $PWD != $DDD_PATH ]]
    then
        unset DDD
        . $file
    else
        $DDD help
    fi
}

main
