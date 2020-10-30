for lib in $( cat dependency.txt )
do
    echo $lib
    (
        cd ../$lib
        ddd build .cpp
    )
done
ddd build .cpp
