local path lines afile

lines=$( echo "${PATH//':'/$'\n'}" | sort | uniq )
PATH=${lines//$'\n'/':'}
afile=$DDD_PATH/env/PATH
echo $PATH > $afile

export PYTHONPATH
for path in $DDD_PATH/tools/python $DDD_PATH/ddd/tools/python; do
    if [[ -z $PYTHONPATH ]]; then PYTHONPATH=$path; fi
    PYTHONPATH=$path:$PYTHONPATH
done
lines=$( echo "${PYTHONPATH//':'/$'\n'}" | sort | uniq )
PYTHONPATH=${lines//$'\n'/':'}

export CLICOLOR=1

cp $DDD_PATH/ddd/.gitignore $DDD_PATH
for path in data cmd env tools; do
    path=$DDD_PATH/$path
    if [ ! -d $path ]; then mkdir $path; fi
    if [ ! -f $path/.gitkeep ]; then touch $path/.gitkeep; fi
done

if [ ! -f $DDD_PATH/env/DDD ]; then echo ddd > $DDD_PATH/env/DDD; fi
