sudo apt update --yes || :
sudo apt upgrade --yes || :
sudo apt autoremove --yes || :
if $( systemctl status snap &> /dev/null )
then
    sudo snap refresh || :
else
    ddd echo 'Snap is not available now.'
fi
