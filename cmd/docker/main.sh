cmd="sudo docker"
if $DDD .is-wsl; then docker=docker.exe; fi
$cmd $@
