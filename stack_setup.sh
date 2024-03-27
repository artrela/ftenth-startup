sudo dpkg --configure -a

locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

wait

locale

sudo apt install software-properties-common
sudo add-apt-repository universe

wait

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

wait

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

wait

sudo apt update
sudo apt upgrade

wait

sudo apt install ros-foxy-desktop python3-argcomplete
sudo apt install ros-dev-tools

wait

# install colcon
sudo apt install python3-colcon-common-extensions

wait

# install & init rosdep
sudo apt install python3-bloom python3-rosdep fakeroot debhelper dh-python
sudo rosdep init --rosdistro=foxy
rosdep update --rosdistro=foxy


wait

# pull the f110th stack 
cd $HOME
mkdir -p f1tenth_ws/src

wait

cd f1tenth_ws
colcon build

wait

cd src
git clone https://github.com/f1tenth/f1tenth_system.git

wait

cd f1tenth_system
git submodule update --init --force --remote

wait

cd $HOME/f1tenth_ws
rosdep update --rosdistro=foxy
export ROS_DISTRO=foxy
rosdep install --from-paths src -i -y

wait
source /opt/ros/foxy/setup.bash
colcon build

echo "DONE!"