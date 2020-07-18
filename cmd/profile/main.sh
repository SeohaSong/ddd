file=$HOME/.bashrc
cmd=". $DDD_PATH/ddd/cmd.sh profile"
txt=$( cat $file | grep -v "$cmd" )
rm $file
echo "$txt" | tee -a $file > /dev/null
echo "$cmd" | tee -a $file > /dev/null
