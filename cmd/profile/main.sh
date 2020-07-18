file=$HOME/.bashrc
cmd=". $DDD_PATH/ddd/cmd.sh profile"
txt=$( cat $file | grep -v "$cmd" )
echo "$txt" | tee $file > /dev/null
echo "$str" | tee $file > /dev/null
