main()
{
    file=$PWD/ddd/cmd.sh
    if [[ -f $file && $PWD != $DDD_PATH ]]
    then
        . $file
        return
    fi
    $DDD help
}

main
