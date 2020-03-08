[ -f $ARGS ]
[[ $ARGS =~ \.py$ ]]
name=${ARGS%.py}
import_opt='--hidden-import pkg_resources.py2_warn'
shs run pyinstaller --onefile $import_opt $name.py
mv dist/$name $name
rm -r build dist __pycache__ $name.spec
