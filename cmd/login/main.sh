path=. name=${DDD_PATH##*/}
if [[ $PWD != $DDD_PATH && $PWD =~ $DDD_PATH ]]; then path=${PWD#$DDD_PATH/}; fi
ssh ddd@localhost -t -p 2222 "
. .profile
. $name/ddd/cmd.sh __profile__
cd $name/$path
bash"
# key toss
