[ ! -z "$KEY" ]
apath=$( dirname $( eval $INTRO ) )
cd $apath
if [ -d tmp ]; then rm -rf tmp; fi
mkdir tmp
cat dockerfile | sed -e "s/<KEY\/>/$KEY/g" | tee "tmp/dockerfile"
net_opt='--network host'
if $( $DDD __is-wsl__ ); then unset net_opt; fi
$DDD docker build --tag ddd $net_opt tmp
rm -r tmp
