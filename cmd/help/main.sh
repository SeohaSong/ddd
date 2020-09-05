main()
{
    local path=$1
    for val in $( ls $path )
    do
        echo $'  '$val
        path_=$path/$val
        if ! [[ -f $path_/main.sh ]]
        then
            for val in $( ls $path_ )
            do
                echo $'    '$val
            done
        fi
    done
}

echo "[$DDD]"
main $DDD_PATH/cmd
echo "[ddd]"
main $DDD_PATH/ddd/cmd
