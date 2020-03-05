local args=$__args__
local CMD=$__CMD__
$CMD __trap__
local docker="sudo docker"
if $( $CMD __is-wsl__ ); then docker=docker.exe; fi
$docker $args
