wget https://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
tar --extract --verbose --file bash-4.4.tar.gz
(
    cd bash-4.4
    ./configure
    make
    sudo make install
    sudo mv bash $( which bash )
)
rm -rf bash-4.4
