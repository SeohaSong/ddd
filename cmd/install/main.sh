local ADPATH=$__ADPATH__
local KEY=$__KEY__
shs __trap__
[ ! -z "$KEY" ]
cd $ADPATH
local name=dockerfile
[ -f "ddd/$name" ]
if [ -d seohasong ]; then rm -rf seohasong; fi
mkdir seohasong
cat "ddd/$name" | sed -e "s/<KEY\/>/$KEY/g" | tee "seohasong/$name"
docker.exe build -t seohasong seohasong
rm -r seohasong
