local ADPATH=$__ADPATH__
local KEY=$__KEY__
local CMD=$__CMD__
$CMD __trap__
[ ! -z "$KEY" ]
cd $ADPATH
if [ -d ddd ]; then rm -rf ddd; fi
mkdir ddd
cat dockerfile | sed -e "s/<KEY\/>/$KEY/g" | tee "ddd/dockerfile"
$CMD docker build -t ddd ddd
rm -r ddd
