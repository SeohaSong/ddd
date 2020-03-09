local docker="sudo docker"
if $DDD __is-wsl__; then docker=docker.exe; fi
$docker $ARGS
