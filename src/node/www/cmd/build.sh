if [[ -e dist ]]
then
    rm -r dist
fi
cp -r .dist dist

webpack

cd dist
python -m http.server
