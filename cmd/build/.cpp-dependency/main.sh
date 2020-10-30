run()
{
    for name in $( cat dependency.txt )
    do
        (
            cd ../$name
            run 
        )
        echo $name
    done
}
run . | tee dependency-lock.txt
unset -f run
