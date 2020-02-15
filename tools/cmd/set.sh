main() {
    export __apath__='
        local path=${BASH_SOURCE:-${(%):-%x}}
        echo $( cd $( dirname $path ) && pwd )/${path##*/}
    '
}
main $1
