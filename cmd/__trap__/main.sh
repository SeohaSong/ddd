main() {
    trap "
        code=\$? num=\$(( \$LINENO - 1 ))
        echo \"[ERR:$( shs __name__ )] \$( eval '$APATH' ):\$num (\$code)\"
        exit \$code
    " ERR
}
main $1
