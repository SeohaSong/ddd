main()
{
    trap '\
local e_code=$?
local e_line=$(( $LINENO - 2 ))
local e_apath=$( cd $( dirname $BASH_SOURCE ) && pwd )
local e_afile=$e_apath/${BASH_SOURCE##*/}
echo "[ERR: $DDD] $e_afile:$e_line ($e_code)" >&2
return $e_code' ERR
}

main
