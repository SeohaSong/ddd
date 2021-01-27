local inputs=( $@ )
local var=${inputs[0]}
local inputs=( ${inputs[@]:1} )
local input_n=${#inputs[@]}
local input_i=0
eval "$var="
while [[ $input_i -lt $input_n ]]
do
    local input=${inputs[$input_i]}
    input_i=$(( $input_i + 1 ))
    if [[ ! $input =~ ^- ]]
    then
        eval "$var=\${$var:+\$$var }$input"
        continue
    fi
    input=${input#--}
    input=${input#-}
    if [[ $input =~ .=. ]]
    then
        eval "${input%=*}=${input#*=}"
        continue
    fi
    eval "$input=true"
done
