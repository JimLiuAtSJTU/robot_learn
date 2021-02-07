# Install script for directory: /home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/qq44642754/xarm6_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/action" TYPE FILE FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/action/Move.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/msg" TYPE FILE FILES
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveAction.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveActionGoal.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveActionResult.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveActionFeedback.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveGoal.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveResult.msg"
    "/home/qq44642754/xarm6_ws/devel/share/xarm_gripper/msg/MoveFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/cmake" TYPE FILE FILES "/home/qq44642754/xarm6_ws/build/xarm_ros/xarm_gripper/catkin_generated/installspace/xarm_gripper-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/devel/include/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/devel/share/roseus/ros/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/devel/share/common-lisp/ros/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/devel/share/gennodejs/ros/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/qq44642754/xarm6_ws/devel/lib/python2.7/dist-packages/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/devel/lib/python2.7/dist-packages/xarm_gripper")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/qq44642754/xarm6_ws/build/xarm_ros/xarm_gripper/catkin_generated/installspace/xarm_gripper.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/cmake" TYPE FILE FILES "/home/qq44642754/xarm6_ws/build/xarm_ros/xarm_gripper/catkin_generated/installspace/xarm_gripper-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/cmake" TYPE FILE FILES
    "/home/qq44642754/xarm6_ws/build/xarm_ros/xarm_gripper/catkin_generated/installspace/xarm_gripperConfig.cmake"
    "/home/qq44642754/xarm6_ws/build/xarm_ros/xarm_gripper/catkin_generated/installspace/xarm_gripperConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper" TYPE FILE FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/config" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/config/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/launch" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/meshes" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/meshes/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/xarm_gripper/urdf" TYPE DIRECTORY FILES "/home/qq44642754/xarm6_ws/src/xarm_ros/xarm_gripper/urdf/")
endif()

