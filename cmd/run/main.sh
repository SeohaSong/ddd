[[ "$PWD" =~ "$DDD_PATH" ]]
$DDD docker exec --tty --interactive \
--workdir /home/ddd/${DDD_PATH##*/}/${PWD#$DDD_PATH} ddd $ARGS
