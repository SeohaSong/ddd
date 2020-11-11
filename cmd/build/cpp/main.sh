build_option=$@
[[ -f dependency.txt ]] || return 0
build_cmd="ddd build .cpp $build_option"
for lib in $( cat dependency.txt )
do
    (
        cd ../$lib
        ddd build cpp $build_option
    )
done
ddd clean cmake
if [[ -d lib ]]
then
    rm -r lib
fi
mkdir lib
ddd build .cpp $build_option
