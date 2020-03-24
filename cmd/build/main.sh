file=$1
[[ -f $file && ! -z $file ]]
name=${file%.*} ext=${file##*.}
case $ext in
py)
    mkdir __tmp__
    for v in $( ls | grep -v __tmp__ ); do cp -r $v __tmp__; done
    cd __tmp__
    shs run pyinstaller --onefile $file
    mv dist/$name ../$name
    cd ..
    rm -r __tmp__
;;
cpp)
    shs run g++ $( ls *.cpp )
    mv a.out $name
;;
esac
