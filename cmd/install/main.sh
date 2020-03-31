[ ! -z "$KEY" ]
[ ! -z "$PASSWORD" ]
apath=$( dirname $( eval $INTRO ) )
cd $apath
if [ -d __tmp__ ]; then rm -rf __tmp__; fi
mkdir __tmp__
file=__tmp__/dockerfile
txt=$( cat dockerfile )
echo "$txt" | sed -e "s~<KEY\/>~$KEY~g" | tee $file
txt=$( cat $file )
echo "$txt" | sed -e "s/<PASSWORD\/>/$PASSWORD/g" | tee $file
txt=$( cat $file )
net_opt='--network host'
if $DDD __is-wsl__; then net_opt=; fi
$DDD docker build --tag ddd $net_opt __tmp__
rm -r __tmp__
