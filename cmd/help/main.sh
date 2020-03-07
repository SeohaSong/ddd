local path
local cmd='echo "  $path"'
echo "[$DDD]"
for path in $( ls "$DDD_PATH/cmd" | grep -v ^__.*__$ ); do eval $cmd; done
echo "[ddd]"
for path in $( ls "$DDD_PATH/ddd/cmd" | grep -v ^__.*__$ ); do eval $cmd; done
return 1
