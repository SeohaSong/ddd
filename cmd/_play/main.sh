name=${1%%:*}
path=. gpu_opt= name_opt="--name $name" etc_opt="--tty"
net_opt='--publish 2222:2222 --publish 8888:8888 --publish 4200:4200'
if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]; then
    path=${PWD#$DDD_PATH/}; fi
if ! $DDD __is-wsl__; then gpu_opt='--gpus all' net_opt='--network host'; fi
if [[ $name == ddd ]]; then etc_opt="--detach"; fi
$DDD docker run \
    $gpu_opt $net_opt $name_opt $etc_opt \
    --interactive --rm \
    --workdir /home/ddd/AGENT/$path \
    --volume ${DDD_PATH#/mnt}:/home/ddd/AGENT $@
