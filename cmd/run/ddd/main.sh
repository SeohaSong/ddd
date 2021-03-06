vals=( $( docker ps -a | grep ddd || : ) )
if [[ ! -z $vals ]]
then
    latest_idx=$(( ${#vals[@]} - 1 ))
    container_name=${vals[$latest_idx]}
    if [[ "$container_name" == ddd ]]
    then
        ddd echo "There is already running ddd-container"
        return 1
    fi
fi

name=ddd
path=.
net_opt='--publish 2222:2222
         --publish 8000:8000
         --publish 8100:8100
         --publish 8888:8888'
etc_opt=""

if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]
then
    path=${PWD#$DDD_PATH/}
fi

if ! $DDD .is-wsl
then
    net_opt='--network host'
fi

docker run\
    $gpu_opt $net_opt\
    --interactive --rm --tty --detach\
    --gpus all\
    --name $name\
    --workdir /home/ddd/DDD/$path\
    --volume $DDD_PATH:/home/ddd/DDD\
    $name

echo Port 2222\
 | docker exec --interactive --user root ddd tee /etc/ssh/sshd_config
docker exec --user root ddd service ssh start
