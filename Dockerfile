FROM tiryoh/ros2-desktop-vnc:humble

ENV ROS_DISTRO=humble
ENV WS_NAME=colcon_ws
ENV DEFAULT_USER=ubuntu

RUN apt update && apt install -y ros-${ROS_DISTRO}-navigation2 ros-${ROS_DISTRO}-nav2-bringup \
    ros-${ROS_DISTRO}-rviz2

COPY ./colcon_ws/src/unity_slam_example $WS_NAME/src/unity_slam_example
COPY ./colcon_ws/src/ROS-TCP-Endpoint $WS_NAME/src/ROS-TCP-Endpoint