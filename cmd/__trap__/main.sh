main() {
    trap "
        local code=\$? num=\$(( \$LINENO - 1 ))
        echo \"[ERR:$( shs __name__ )] \$APATH:\$num (\$code)\"
        return \$code
    " ERR
}
main $1
