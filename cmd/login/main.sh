path=. name=${DDD_PATH##*/}
if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]; then
    path=${PWD#$DDD_PATH/}; fi
ssh ddd@localhost -t -p 2222 "cd $name/$path && bash"
