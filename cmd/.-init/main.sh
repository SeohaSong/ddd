main()
{
    $DDD .-trap
    
    OPTS=
    KEY=$( cat $HOME/.ssh/id_rsa || : )
    PUB_KEY=$( cat $HOME/.ssh/id_rsa.pub || : )
    PASSWORD=$( cat $DDD_PATH/env/PASSWORD 2> /dev/null || echo ddd )
}

main
