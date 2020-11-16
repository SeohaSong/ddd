vals=
for val in $@
do
    pat="\s$val\s"
    if [[ $vals =~ $pat ]]
    then
        continue
    fi
    echo $val
    vals="$vals $val "
done
