[[ -f package.json && -f tsconfig.json ]]

files=(
    node_modules
    package-lock.json
)

for file in ${files[@]}
do
    if [[ -e $file ]]
    then
        rm -r $file
    fi
done

npm run clean
