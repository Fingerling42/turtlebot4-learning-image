FROM ros:humble-ros-base-jammy

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-dev-tools \
    ros-humble-turtlebot4-robot \
    ros-humble-turtlebot4-navigation \
    ros-humble-irobot-create-control \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV ROS_DOMAIN_ID=0
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

CMD ["/bin/sh"]