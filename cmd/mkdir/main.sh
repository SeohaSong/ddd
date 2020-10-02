path=$1
if [[ ! -d $path ]]
then
    ddd mkdir $( dirname $path )
    mkdir $path
fi
