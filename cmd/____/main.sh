export CLICOLOR=1

local lines
lines=$( echo "${PATH//':'/$'\n'}" | sort | uniq )
PATH=${lines//$'\n'/':'}

cp $DDD_PATH/ddd/.gitignore $DDD_PATH

local path 
for path in data cmd env tools; do
    path=$DDD_PATH/$path
    if [ ! -d $path ]; then mkdir $path; fi
    if [ ! -f $path/.gitkeep ]; then touch $path/.gitkeep; fi
done

local file
for path in _____ __init___; do
    path=$DDD_PATH/cmd/$path
    if [ ! -d $path ]; then mkdir $path && touch $path/main.sh; fi
done

if [ ! -f $DDD_PATH/env/DDD ]; then echo ddd > $DDD_PATH/env/DDD; fi
