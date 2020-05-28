local afile=$HOME/.bashrc
local str="ddd/cmd.sh profile"
local txt=$( cat $afile | grep -v "$str" )
echo "\
$txt
. $DDD_PATH/$str" > $afile