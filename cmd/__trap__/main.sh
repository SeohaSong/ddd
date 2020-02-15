main() {
    trap "
        code=\$? num=\$(( \$LINENO - 1 ))
        echo \"[ERR:$( shs __name__ )] \$( eval '$__apath__' ):\$num (\$code)\"
        exit \$code
    " ERR
}
main $1
