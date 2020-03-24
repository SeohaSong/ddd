[ ! -z "$KEY" ]
apath=$( dirname $( eval $INTRO ) )
cd $apath
if [ -d __tmp__ ]; then rm -rf __tmp__; fi
mkdir __tmp__
cat dockerfile | sed -e "s/<KEY\/>/$KEY/g" | tee "__tmp__/dockerfile"
cat __tmp__/dockerfile | \
sed -e "s/<DDD_PATH\/>/${DDD_PATH##*/}/g" | \
tee "__tmp__/dockerfile"
net_opt='--network host'
if $DDD __is-wsl__; then net_opt=; fi
$DDD docker build --tag ddd $net_opt __tmp__
rm -r __tmp__
