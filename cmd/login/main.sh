ssh ddd@localhost -t -p 2222 "
    . .profile
    cd ${DDD_PATH##*/}/${PWD#$DDD_PATH}
    bash
"
