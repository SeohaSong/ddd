local opt=
if [[ -t 1 ]]; then
    opt='--tty --interactive'; fi
$DDD docker exec $opt --workdir /home/ddd/DDD/${PWD#$DDD_PATH} ddd bash
