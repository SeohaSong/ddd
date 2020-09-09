if [[ ! -z "$( which wsl.exe )" ]]
then
    return 0
else
    return 1
fi
