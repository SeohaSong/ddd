trap '
    local e_code=$? e_line=$(( $LINENO - 1 ))
    local e_file=${BASH_SOURCE:-${(%):-%x}}
    local e_apath=$( cd $( dirname $e_file ) && pwd )
    local e_afile=$e_apath/${e_file##*/}
    echo "[ERR:'$__CMD__'] $e_afile:$e_line ($e_code)"
    return $e_code
' ERR
