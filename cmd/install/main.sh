local ADPATH=$__ADPATH__
local KEY=$__KEY__
shs __trap__
[ ! -z "$KEY" ]
cd $ADPATH
if [ -d ddd ]; then rm -rf ddd; fi
mkdir ddd
cat dockerfile | sed -e "s/<KEY\/>/$KEY/g" | tee "ddd/dockerfile"
docker.exe build -t ddd ddd
rm -r ddd
