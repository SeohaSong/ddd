$DDD _play ddd
echo Port 2222 | \
$DDD docker exec --interactive --user root ddd tee /etc/ssh/sshd_config
$DDD docker exec --user root ddd service ssh start
