name=ddd
path=.
net_opt='--publish 2222:2222 --publish 8888:8888 --publish 4200:4200'
etc_opt="--tty --detach"
# gpu_opt='--gpus all'

if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]
then
    path=${PWD#$DDD_PATH/}
fi

if ! $DDD .is-wsl
then
    net_opt='--network host'
fi

$DDD docker run $gpu_opt $net_opt $etc_opt \
                --interactive --rm \
                --name $name \
                --workdir /home/ddd/DDD/$path \
                --volume ${DDD_PATH#"/mnt"}:/home/ddd/DDD \
                $name

echo Port 2222 | \
    $DDD docker exec --interactive --user root ddd tee /etc/ssh/sshd_config
$DDD docker exec --user root ddd service ssh start
