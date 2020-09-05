file=./ddd/cmd.sh
if [[ -f $file ]]
then
    unset ARG
    . $file help
else
    return 1
fi
