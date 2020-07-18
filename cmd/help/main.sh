echo "[$DDD]"
for path in $( ls "$DDD_PATH/cmd" )
do
    echo $'\t'$path
done
echo "[ddd]"
for path in $( ls "$DDD_PATH/ddd/cmd" )
do
    echo $'\t'$path
done
