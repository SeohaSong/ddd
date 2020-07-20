for val in CMakeFiles *.cmake CMakeCache.txt Makefile
do
    if [[ -f $val || -d $val ]]
    then
        rm -r $val
    fi
done
