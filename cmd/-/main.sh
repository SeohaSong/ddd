local file=./ddd/cmd.sh
if [[ -f $file ]]
then
    unset ARG
    . $file help
    shopt -s extdebug
    declare -F ddd
    shopt -u extdebug
else
    return 1
fi
