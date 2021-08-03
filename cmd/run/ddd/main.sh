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

path=.
if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]
then
    path=${PWD#$DDD_PATH/}
fi

net_opt='--network host'
if $DDD .is-wsl
then
    net_opt='--publish 2222:2222
             --publish 8000:8000
             --publish 8100:8100
             --publish 8888:8888'
fi

name=ddd
docker run\
 --interactive --rm --tty --detach --privileged\
 $net_opt\
 --gpus all\
 --name $name\
 --workdir /home/ddd/DDD/$path\
 --volume $DDD_PATH:/home/ddd/DDD\
 $name

echo Port 2222\
| docker exec --interactive --user root ddd tee /etc/ssh/sshd_config
docker exec --user root ddd service ssh start
