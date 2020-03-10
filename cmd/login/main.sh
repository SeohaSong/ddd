[[ $PWD =~ $DDD_PATH ]]
path=${PWD#$DDD_PATH}
path=${DDD_PATH##*/}/${path#/}
path=${path%/}
ddd_file=${DDD_PATH##*/}/ddd/cmd.sh
ssh ddd@localhost -t -p 2222 "\
. .profile
. $ddd_file __profile__
cd $path
bash"

# key toss
