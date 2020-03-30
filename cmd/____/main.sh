export CLICOLOR=1

local lines
lines=$( echo "${PATH//':'/$'\n'}" | sort | uniq )
PATH=${lines//$'\n'/':'}

local afile str txt
afile=$HOME/.bashrc
str=". \$HOME/${DDD_PATH##*/}/ddd/cmd.sh __profile__"
txt=$( cat $afile | grep -v "$str" )
echo "\
$txt
$str" > $afile

cp $DDD_PATH/ddd/.gitignore $DDD_PATH

local path 
for path in data cmd env tools; do
    path=$DDD_PATH/$path
    if [ ! -d $path ]; then mkdir $path; fi
    if [ ! -f $path/.gitkeep ]; then touch $path/.gitkeep; fi
done
if [ ! -f $DDD_PATH/cmd/__profile__/main.sh ]; then
    mkdir $DDD_PATH/cmd/__profile__
    touch $DDD_PATH/cmd/__profile__/main.sh
fi
if [ ! -f $DDD_PATH/env/DDD ]; then echo ddd > $DDD_PATH/env/DDD; fi
echo $PATH > $DDD_PATH/env/PATH
