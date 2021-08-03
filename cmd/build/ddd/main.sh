[[ ! -z $KEY && ! -z $PASSWORD ]]

cd $( dirname $BASH_SOURCE )

if [[ -d .temp ]]
then
    rm -rf .temp
fi
mkdir .temp

echo "$KEY" | tee .temp/id_rsa > /dev/null
echo "$PUB_KEY" | tee .temp/id_rsa.pub > /dev/null
cp $DDD_PATH/ddd/tools/dockerfile/dockerfile .temp

file=.temp/dockerfile
lines=$( cat $file )
echo "$lines" | sed -e "s/<PASSWORD\/>/$PASSWORD/g" | tee $file > /dev/null

net_opt='--network host'
if $DDD .is-wsl
then
    net_opt=
fi

docker build --tag ddd $net_opt .temp

rm -r .temp
