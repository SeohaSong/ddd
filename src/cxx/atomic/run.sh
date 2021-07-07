(
    g++ -std=c++14 -pthread -g -O0 main.cpp

    ./a.out
    echo "========================="

    idx=0
    while [[ $idx -lt 100 ]]
    do
        idx=$(( $idx + 1 ))
        ret=( $( ./a.out ) )
        val=${ret[1]}
        [[ $val == 40000 ]] || break
    done
    echo "$val, ($idx)"

    rm a.out
)
