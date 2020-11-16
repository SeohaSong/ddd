if [[ ! -f dependency.txt ]]
then
    return
fi
libs=
for lib in $( cat dependency.txt )
do
    libs_=$(
        cd ../$lib
        $DDD build .cpp-dependency
    )
    echo $lib
    libs="$libs $libs_ $lib"
done
$DDD uniq $libs | tee dependency-lock.txt > /dev/null
