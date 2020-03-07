net_opt='--publish 2222:2222 --publish 8888:8888 --publish 4200:4200'
if ! shs __is-wsl__; then net_opt='--network host'; fi
$DDD docker run --detach --interactive --rm \
$net_opt \
--name ddd \
--volume ${DDD_PATH#/mnt}:/home/ddd/${DDD_PATH##*/} ddd
echo Port 2222 | $DDD docker exec --interactive --user root \
ddd tee /etc/ssh/sshd_config
$DDD docker exec --user root ddd service ssh start
