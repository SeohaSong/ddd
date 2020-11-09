build_option=$@
$DDD build .cpp-dependency | tee dependency-lock.txt
cmake $build_option .
make
$DDD clean cmake
