local ADPATH=$__ADPATH__
local KEY=$__KEY__
local CMD=$__CMD__
$CMD __trap__
[ ! -z "$KEY" ]
cd $ADPATH
if [ -d ddd ]; then rm -rf ddd; fi
mkdir ddd
cat dockerfile | sed -e "s/<KEY\/>/$KEY/g" | tee "ddd/dockerfile"
local net_opt='--network host'
if $( $CMD __is-wsl__ ); then unset net_opt; fi
$CMD docker build \
--tag ddd \
$net_opt \
ddd
rm -r ddd
