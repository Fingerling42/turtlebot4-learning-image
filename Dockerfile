FROM ros:humble-ros-base-jammy

RUN apt-get update && apt-get upgrade
RUN apt install -y \
    ros-humble-turtlebot4-robot \
    ros-humble-irobot-create-control \
    ros-humble-turtlebot4-navigation

CMD ["/bin/sh"]