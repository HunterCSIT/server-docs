
# HunterMT

HunterMT is an Alienware Area-51 R5 desktop located in the G lab
Specs
 - Ubuntu 22.04 LTS
 - Intel i7 7800X
 - 2x Nvidia GTX1080s
 - 32GB RAM

## Setup Instructions


Connecting to the internet using the allocated static IP.

```bash
sudo apt update && sudo apt -y upgrade
```



```bash
sudo apt update && sudo apt -y upgrade
sudo apt -y install vim
sudo apt -y install curl
sudo apt -y install build-essential
sudo apt -y install cmake
sudo apt -y install tree
sudo apt -y install gdebi-core
sudo apt -y install terminator
sudo apt -y install vlc
sudo apt -y install neofetch
sudo apt -y install autoconf
sudo apt -y install automake
sudo apt -y install tmux
sudo apt -y install gawk
sudo apt -y install curl
sudo apt -y install git
sudo apt -y install subversion
sudo apt -y install python3-dev
sudo apt -y install python3-pip
sudo apt -y install openssh-server
sudo apt -y install default-jre
sudo apt -y install default-jdk
sudo apt -y install libboost-all-dev


# echo "********** installing Google Chrome **********"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
echo "google-chrome-stable_current_amd64.deb"
rm google-chrome-stable_current_amd64.deb

# echo "********** installing VS CODE **********"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y install code

# echo "********** installing ANACONDA **********"
# CHECK FOR NEWER VERSION AND HASH
EXPECTEDHASH="e7ecbccbc197ebd7e1f211c59df2e37bc6959d081f2235d387e08c9026666acd"
sudo curl https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh --output /tmp/anaconda-install.sh
sudo chmod 700 /tmp/anaconda-install.sh
sudo echo "$EXPECTEDHASH  /tmp/anaconda-install.sh" | sudo sha256sum --check
if [ $? -eq 0 ]; then
    echo "sha256 matches, running anaconda-install.sh"
    sudo bash /tmp/anaconda-install.sh
    sudo rm /tmp/anaconda-install.sh
else
    echo "ERROR: anaconda sha256 checksum does not match, skipping anaconda install"
fi

```