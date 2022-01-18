wsl -d Ubuntu-18.04 -e sudo apt-get update -y
wsl -d Ubuntu-18.04 -e sudo apt-get install -y g++ gdb make cmake ninja-build rsync zip
mkdir cache
wsl -d Ubuntu-18.04 -e sudo bash ./libs/boost/install.sh
