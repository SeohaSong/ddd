local CMD_PATH=$__CMD_PATH__
local CMD=$__CMD__
$CMD __trap__
[[ "$PWD" =~ "$CMD_PATH" ]]
local net_opt='--network host'
if $( $CMD __is-wsl__ )
then net_opt='--publish 22:22 --publish 4200:4200 --publish 8888:8888'
fi
$CMD docker run --detach --interactive --rm \
--volume ${CMD_PATH#/mnt}:/home/ddd/${CMD_PATH##*/} \
--name ddd \
$net_opt \
ddd
$CMD docker exec --user root ddd service ssh start
