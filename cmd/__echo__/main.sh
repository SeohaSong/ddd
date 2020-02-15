main() {
    echo "[$( shs __name__ )] \"$@.\""
}
main $1
unset -f main
