[ ! -z "$KEY" ]
[ ! -z "$PASSWORD" ]

cd $( dirname $BASH_SOURCE )

if [ -d __tmp__ ]
then
    rm -rf __tmp__
fi
mkdir __tmp__

echo $KEY | tee __tmp__/KEY > /dev/null

file=__tmp__/dockerfile
cp dockerfile $file
txt=$( cat $file )
echo "$txt" | sed -e "s/<PASSWORD\/>/$PASSWORD/g" | tee $file

net_opt=
if ! $DDD .is-wsl
then
    net_opt='--network host'
fi

docker build --tag ddd $net_opt __tmp__

rm -r __tmp__
