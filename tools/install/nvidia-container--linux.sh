(

trap 'exit' ERR

curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey\
 | sudo apt-key add -
distr=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distr/nvidia-container-runtime.list\
 | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
sudo apt update --yes
sudo apt install --yes --no-install-recommends nvidia-container-runtime

)
