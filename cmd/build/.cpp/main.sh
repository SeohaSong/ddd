build_option=$@
if [[ ! -f dependency.txt ]]
then
    return
fi
for path in lib bin
do
    if [[ -d $path ]]
    then
        rm -r $path
    fi
    mkdir $path
done
cmake $build_option .
make
$DDD clean cmake
