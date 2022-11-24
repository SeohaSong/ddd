msg="There is no available ddd-container"
vals=( $( docker ps -a | grep ddd || : ) )
if [[ -z $vals ]]
then
    ddd echo $msg
    return 1
fi
latest_idx=$(( ${#vals[@]} - 1 ))
container_name=${vals[$latest_idx]}
if [[ ! "$container_name" == ddd ]]
then
    ddd echo $msg
    return 1
fi
path=.
if [[ ! $PWD == $DDD_PATH && $PWD =~ $DDD_PATH ]]
then
    path=${PWD#$DDD_PATH/}
fi
ssh -R 1883:localhost:1883 -R 1884:localhost:1884\
    ddd@127.0.0.1 -t -p 2222 "cd DDD/$path && bash"
