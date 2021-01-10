tgt_path=$DDD_PATH/src/cxx/gtest
if [[ -d $tgt_path ]]
then
    rm -rf $tgt_path
fi
mkdir $tgt_path
cd $DDD_PATH/data
git clone https://github.com/google/googletest.git
cd googletest
line="add_compile_options(-std=c++14)"
txt="\
$line
$( cat CMakeLists.txt )"
echo "$txt" > CMakeLists.txt
cmake .
make
cp -r googletest/include $tgt_path
cp -r lib $tgt_path
cd ..
rm -rf googletest
