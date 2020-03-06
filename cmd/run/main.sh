local args=$__args__
local CMD=$__CMD__
local CMD_PATH=$__CMD_PATH__
$CMD __trap__
[[ "$PWD" =~ "$CMD_PATH" ]]
local apath=/home/ddd/${CMD_PATH##*/}/${PWD#$CMD_PATH}
$CMD docker exec --tty --interactive --workdir $apath ddd $args
