<br />
<div align="center">
<h3 align="center">Docker Image for Turtlebot 4 Learning</h3>

<p align="center">
    A simple Docker image to boot onto Turtlebot 4 for learning robotics
</p>
</div>


## About Project

This Docker image is designed for learning robotics in general and ROS 2 in particular on a working [Turtlebot 4 Pro](https://clearpathrobotics.com/turtlebot-4/) robot designed by Clearpath Robotics.

The image is deployed using [Robot Agent]((https://github.com/merklebot/robot-agent)) software developed by MerkleBot.


## Usage

To make all ROS entities available inside a Docker container, the image must be run with the network, IPC mode and PID namespace using the host:

```bash
docker run -it -e ROS_DISCOVERY_SERVER=RASP_PI_IP:11811 ghcr.io/fingerling42/turtlebot4-learning-image:humble
```
