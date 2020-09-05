file=./ddd/cmd.sh
if [[ -f $file ]]
then
    unset DDD
    . $file help
fi
