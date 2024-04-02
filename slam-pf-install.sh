
#slam toolbox
sudo apt install ros-foxy-slam-toolbox

ros2 launch slam_toolbox online_async_launch.py params_file:=/home/nvidia/f1tenth_ws/src/f1tenth_system/f1tenth_stack/config/f1tenth_online_async.yaml

cd
git clone https://github.com/f1tenth/range_libc.git
cd range_libc/pywrapper
sudo WITH_CUDA=ON python setup.py install

# Launch rviz2
# Add /map by topic

# Add /graph_visualization by topic

# On top left corner of rviz, panels – add new panel – add SlamToolBoxPlugin
# panel

# Once you’re done mapping, save the map using the plugin. You can give it a
# name in the text box next to Save Map. Map will be saved in whichever
# directory you ran slam_toolbox

cd
cd /home/nvidia/f1tenth_ws/src
git clone https://github.com/f1tenth/particle_filter.git

rosdep install -r --from-paths . --ignore-src --rosdistro foxy -y

cd
cd ~/f1tenth_ws && colcon build
source install/setup.bash

# to run: ros2 launch particle_filter localize_launch.py
