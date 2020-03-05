trap "
    local code=\$? num=\$(( \$LINENO - 1 ))
    local error_path=\${BASH_SOURCE:-\${(%):-%x}}
    local error_adpath=\$( cd \$( dirname \$error_path ) && pwd )
    local error_apath=\$error_adpath/\${error_path##*/}
    echo \"[ERR:\$__CMD__] \$error_apath:\$num (\$code)\"
    return \$code
" ERR
