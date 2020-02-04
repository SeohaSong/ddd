trap '
    code=$? num=$(( $LINENO - 1 ))
    fpath=$BASH_SOURCE
    if [ -z $fpath ]; then fpath=$0; fi
    afpath=$( cd $( dirname $fpath ) && pwd )/${fpath##*/}
    echo "[ERROR-$CMD] $afpath:$num ($code)"
    exit $code
' ERR;
