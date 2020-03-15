[ ! -z "$@" ]
for ver in 16.04 18.04; do
    chk=$( $DDD docker images | grep -E "ubuntu.+${ver%.04}" || : )
    if [ -z "$chk" ]; then $DDD docker pull ubuntu:$ver; fi
    $DDD echo $ver
    $DDD _play ubuntu:$ver $@; done
