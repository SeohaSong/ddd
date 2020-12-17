if ! ( docker ps -a > /dev/null )
then
    sudo addgroup docker
    sudo adduser $USER docker
    sudo snap restart docker
    ddd echo you need to reboot this machine.
fi
