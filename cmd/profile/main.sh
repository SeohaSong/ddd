local afile=$HOME/.bashrc
local str_="ddd/cmd.sh profile"
local str=". $DDD_PATH/$str"
local txt=$( cat $afile | grep -v "$str" )
echo "\
$txt
$str" > $afile
