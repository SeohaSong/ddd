if [[ ! -f dependency.txt ]]
then
    return
fi
$DDD build .cpp-dependency
cmake .
make
$DDD clean cmake
