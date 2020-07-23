$DDD .is-ddd

path=$DDD_PATH/app/web

if [[ -d $path ]]
then
    $DDD echo the web-app is already exist
else
    cp -r ~/APP $path
fi
