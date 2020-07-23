[[ $PWD == $DDD_PATH ]]

cp ddd/tools/cmake/CMakeLists.txt .

cmake .
make
$DDD clean cmake

rm CMakeLists.txt

mv exe app/gtest
