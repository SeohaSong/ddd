if ! $DDD .is-ddd
then
    $DDD need ddd env
    return 1
fi

cp -r ~/APP .
