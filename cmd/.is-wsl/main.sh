if [[ -z "$( ls /usr/bin | grep "^wsl" )" ]]
then
    return 1
else
    return 0
fi
