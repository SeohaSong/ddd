local chk ver
for ver in 16.04 18.04
do
    chk=$( $DDD docker images | grep -E "ubuntu.+${ver%.04}" || : )
    if [ -z "$chk" ]; then $DDD docker pull ubuntu:$ver; fi
    $DDD echo $ver
    $DDD docker run --tty --interactive --rm \
    --volume ${DDD_PATH#/mnt}:/home/ddd/${DDD_PATH##*/} \
    --workdir /home/ddd/${DDD_PATH##*/} \
    ubuntu:$ver $ARGS
done
