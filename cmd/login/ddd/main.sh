docker stop ddd 2> /dev/null || :
ddd run ddd
path=.
if [[ ! $PWD == $DDD_PATH && $PWD =~ $DDD_PATH ]]
then
    path=${PWD#$DDD_PATH/}
fi
ssh ddd@127.0.0.1 -t -p 2222 "cd DDD/$path && bash"
