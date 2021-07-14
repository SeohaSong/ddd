(

trap 'exit' ERR

curl -fsSL https://download.docker.com/linux/ubuntu/gpg\
 | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "\
deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg]\
 https://download.docker.com/linux/ubuntu\
 $(lsb_release -cs) stable" \
 | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update --yes
sudo apt-get install --yes --no-install-recommends\
 docker-ce docker-ce-cli containerd.io

)
