local docker="sudo docker"
if shs __is-wsl__; then docker=docker.exe; fi
$docker $ARGS
