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
trap 'local e_code=$? e_line=$LINENO
local e_file=${BASH_SOURCE:-${(%):-%x}}
local e_apath=$( cd $( dirname $e_file ) && pwd )
local e_afile=$e_apath/${e_file##*/}
echo "[ERR: ${DDD:-ddd}] $e_afile:$e_line ($e_code)" >&2
return $e_code' ERR
