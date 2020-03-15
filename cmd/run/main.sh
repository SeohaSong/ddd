[[ "$PWD" =~ "$DDD_PATH" ]]
if $DDD __is-ddd__; then $@; else
    $DDD docker exec --tty --interactive \
    --workdir /home/ddd/${DDD_PATH##*/}/${PWD#$DDD_PATH} ddd $@; fi
