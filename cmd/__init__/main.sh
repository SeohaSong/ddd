ARGS=$1
OPTS='null'
KEY=$( cat $DDD_PATH/env/KEY 2> /dev/null || echo ddd )
cp $DDD_PATH/ddd/.gitignore $DDD_PATH
local path
for path in data cmd env tools
do
    path=$DDD_PATH/$path
    if [ ! -d $path ]; then mkdir $path; fi
    if [ ! -f $path/.gitkeep ]; then touch $path/.gitkeep; fi
done
if [ ! -f $DDD_PATH/env/DDD ]; then echo ddd > $DDD_PATH/env/DDD; fi
trap "$( cat $DDD_PATH/ddd/tools/common/trap.sh )" ERR
