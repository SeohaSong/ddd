(

trap 'exit' ERR

sudo apt install --yes --no-install-recommends linux-headers-$(uname -r)
distr=$(. /etc/os-release ; echo $ID$VERSION_ID | sed -e 's/\.//g')
wget https://developer.download.nvidia.com/compute/cuda/repos/$distr/x86_64/cuda-$distr.pin
sudo mv cuda-$distr.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distr/x86_64/7fa2af80.pub
echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distr/x86_64 /"\
 | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt update --yes
sudo apt install --yes --no-install-recommends cuda-drivers

echo "========================================================================="
echo "1. Reboot"
echo "2. Enroll MOK"
echo "========================================================================="

)
