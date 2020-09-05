cd tools/cxx/googletest

lines=(
    "add_compile_options(-std=c++14)"
)
txt=$( cat CMakeLists.txt )
rm CMakeLists.txt
for line in ${lines[@]}
do
    echo $line | tee -a CMakeLists.txt > /dev/null
done
echo "$txt" | tee -a CMakeLists.txt > /dev/null

cmake .
make
$DDD clean cmake

echo "$txt" | tee CMakeLists.txt > /dev/null

if [[ -d env ]]
then
    rm -r env
fi
mv lib env

cd googletest
$DDD clean cmake

cp -r include ..
