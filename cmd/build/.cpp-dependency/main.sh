[[ -f dependency.txt ]] || return 0
for name in $( cat dependency.txt )
do
    (
        cd ../$name
        ddd build .cpp-dependency
    )
    echo $name
done
