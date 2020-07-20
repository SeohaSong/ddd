#!/bin/bash
file=$1
[[ -f $file && ! -z $file ]]
name=${file%.*}
mkdir __tmp__
for v in $( ls | grep -v __tmp__ ); do
    cp -r $v __tmp__; done
cd __tmp__
$DDD run pyinstaller --onefile $file
mv dist/$name ../$name
cd ..
rm -r __tmp__
