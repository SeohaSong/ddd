file=./ddd/cmd.sh
if [[ -f $file ]]
then
    unset DDD
    . $file help
else
    return 1
fi
