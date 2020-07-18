cmd="sudo docker"
if $DDD .is-wsl
then
    cmd=docker.exe
fi
cmd="$cmd $@"
eval "$cmd"
