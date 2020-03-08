file=$ARGS
[ -f $file ] && [ ! -z $file ]
name=${file%.*} ext=${file##*.}
case $ext in
py)
    mkdir __tmp__
    cp $file __tmp__
    cd __tmp__
    import_opt='--hidden-import pkg_resources.py2_warn'
    shs run pyinstaller --onefile $import_opt $file
    mv dist/$name ../$name
    cd ..
    rm -r __tmp__
;;
cpp)
    shs run g++ $( ls *.cpp )
    mv a.out $name
;;
esac
