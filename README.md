# Unity-Nav2 example with ROS2 (humble) on docker
## About
This repository provides environment to run [Unity-Technologies/Robotics-Nav2-SLAM-Example](https://github.com/Unity-Technologies/Robotics-Nav2-SLAM-Example) with ROS2 humble on Docker.

## Setup Instructions
Assumed Ubuntu 20.04 at following instructions
### Prerequirements
- Install Docker
- Install Unity (See also [here](https://qiita.com/yoshi1006/items/2f54d49958e55c2b5ab5#unity%E6%BA%96%E5%82%99) :only Japanese)
### Steps
#### Virtual Ubuntu on docker
1. Clone this repo
   ```
   $ git clone https://github.com/ttnt-1013/unity-nav2-humble-docker.git
   ```
2. Build and run a docker image
    ```
    $ cd unity-nav2-humble-docker
    $ docker build -t <your-docker-id>/nav2slam:test .
    $ docker run --rm -p 6080:80 -p 10000:10000 --security-opt seccomp=unconfined --shm-size=512m <your-docker-id>/nav2slam:test bash
    ```
3. Access [http://127.0.0.1:6080/](http://127.0.0.1:6080/)
    - You will see this screen on the browser.
    ![Ubuntu screen](/doc/images/ubuntu_screen.png)

#### ROS2 on Virtual Ubuntu
1. Open **Terminator**
2. Build packages and run application
    ```
    $ cd /colcon_ws
    $ sudo colcon build
    $ source install/setup.bash
    $ ros2 launch unity_slam_example unity_slam_example.py
    ```

#### Unity
1. Clone this [repo](https://github.com/Unity-Technologies/Robotics-Nav2-SLAM-Example)
   ```
   $ git clone https://github.com/Unity-Technologies/Robotics-Nav2-SLAM-Example.git
   ```
2. Open the example project on Unity 
(Project path is the top directory you cloned at previous step)
3. Open the scene "Simple Obstacle Course"
   - Assets > Scenes > Test > SimpleObstacleCourse
4. (Optional) Adjust Main Camera location
   - SimpleObstacleCourse > Main Camera
5. Start Scene
6. Check TCP Conndection
   - If the arrow at top left turn to blue, the connection is established
   (If red, not established)

*Unity view*
![last unity view](/doc/images/last_unity_view.png)

*Ubuntu view*
![last ubuntu view](/doc/images/last_ubuntu_view.png)

## ROS2 packages of other projects
- [unity_slam_example](https://github.com/Unity-Technologies/Robotics-Nav2-SLAM-Example/tree/main/ros2_docker/colcon_ws/src/unity_slam_example)
- [ROS-TCP-Endpoint (main-ros2)](https://github.com/Unity-Technologies/ROS-TCP-Endpoint/tree/main-ros2)

## License
The source code is licensed MIT LICENSE.