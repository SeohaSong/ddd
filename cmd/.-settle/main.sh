main()
{
    file=$PWD/ddd/cmd.sh
    if [[ -f $file ]]
    then
        . $file help
        return
    fi
    $DDD help
}

main
