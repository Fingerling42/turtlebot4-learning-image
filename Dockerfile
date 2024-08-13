# Based on official ROS 2 Humble image
FROM ros:humble-ros-base-jammy

ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG RASPPI_IP

WORKDIR /ros2_user_ws

# Get necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    ros-dev-tools \
    ros-humble-turtlebot4-robot \
    ros-humble-turtlebot4-navigation \
    ros-humble-irobot-create-control \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create the user with root privileges and the same UID that machine have
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Add ROS 2 environment variables
ENV ROS_DOMAIN_ID=0
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV ROS_LOCALHOST_ONLY=0
ENV ROS_SUPER_CLIENT=TRUE

USER $USERNAME

CMD ["/bin/sh"]