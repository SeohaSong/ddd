local afile=$HOME/.bashrc
local str=". $DDD_PATH/ddd/cmd.sh profile"
local txt=$( cat $afile | grep -v "$str" )
echo "\
$txt
$str" > $afile
