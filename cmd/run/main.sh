#!/bin/bash
[[ "$PWD" =~ "$DDD_PATH" ]]

if $DDD .is-ddd; then
    $@
else
    opt='--tty --interactive'
    docker exec $opt --workdir /home/ddd/DDD/${PWD#$DDD_PATH} ddd $@
fi
