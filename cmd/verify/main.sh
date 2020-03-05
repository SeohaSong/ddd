local args=$__args__
local CMD=$__CMD__
local CMD_PATH=$__CMD_PATH__
$CMD __trap__
local chk pattern
for ver in 16 18
do
    chk=$( $CMD docker images | grep -E "ubuntu.+$ver" || : )
    if [ -z "$chk" ]; then $CMD docker pull ubuntu:$ver; fi
    $CMD echo $ver.04
    $CMD docker run --tty --interactive --rm \
    --volume ${CMD_PATH#/mnt}:/home/ddd/${CMD_PATH##*/} \
    --workdir /home/ddd/${CMD_PATH##*/} \
    ubuntu:$ver.04 $args
done
