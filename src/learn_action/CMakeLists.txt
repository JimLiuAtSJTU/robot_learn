cmake_minimum_required(VERSION 2.8.3)
project(learn_action)
 
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
  actionlib_msgs
  actionlib
)
 
## Generate actions in the 'action' folder
 add_action_files(
   FILES
   TurtleMove.action
 )
 
## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs
   actionlib_msgs
 )
 
catkin_package(
 CATKIN_DEPENDS roscpp rospy std_msgs
  message_runtime
)
 
include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)
 
 
add_executable(TurtleMove_client src/TurtleMove_client.cpp)
target_link_libraries(TurtleMove_client ${catkin_LIBRARIES})
add_dependencies(TurtleMove_client ${PROJECT_NAME}_gencpp)
 
add_executable(TurtleMove_server src/TurtleMove_server.cpp)
target_link_libraries(TurtleMove_server ${catkin_LIBRARIES})
add_dependencies(TurtleMove_server ${PROJECT_NAME}_gencpp)
