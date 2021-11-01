cmake_minimum_required(VERSION 3.0.2)
project(jason_blueROV)

find_package(catkin REQUIRED COMPONENTS
  jason_metacontrol
  jason_ros
  jason_ros_msgs
  rospy
  std_msgs
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
