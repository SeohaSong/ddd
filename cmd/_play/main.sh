name=${1%%:*}
path=.
if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]; then
    path=${PWD#$DDD_PATH/}; fi
# gpu_opt=
# gpu_opt='--gpus all'
net_opt='--publish 2222:2222 --publish 8888:8888 --publish 4200:4200'
if ! $DDD __is-wsl__; then
    net_opt='--network host'; fi
etc_opt="--tty"
if [[ $name == ddd ]]; then etc_opt="--detach"; fi
$DDD docker run \
    $gpu_opt $net_opt $etc_opt \
    --interactive --rm \
    --name $name \
    --workdir /home/ddd/DDD/$path \
    --volume ${DDD_PATH#/mnt}:/home/ddd/DDD $@
