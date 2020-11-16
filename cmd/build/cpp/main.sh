build_option=$@
if [[ ! -f dependency.txt ]]
then
    return
fi
$DDD build .cpp-dependency > /dev/null
$DDD echo "dependency-lock.txt"
cat dependency-lock.txt
$DDD echo "/dependency-lock.txt"
for lib in $( cat dependency-lock.txt )
do (
    cd ../$lib
    ddd build .cpp $build_option
) done
ddd build .cpp $build_option
