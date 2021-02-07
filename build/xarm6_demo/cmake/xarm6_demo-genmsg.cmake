# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "xarm6_demo: 7 messages, 0 services")

set(MSG_I_FLAGS "-Ixarm6_demo:/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg;-Iactionlib_msgs:/opt/ros/melodic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(xarm6_demo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" "actionlib_msgs/GoalID:xarm6_demo/MoveGoal:std_msgs/Header"
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" ""
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" "actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:xarm6_demo/MoveActionResult:xarm6_demo/MoveActionGoal:xarm6_demo/MoveActionFeedback:xarm6_demo/MoveResult:xarm6_demo/MoveGoal:std_msgs/Header:xarm6_demo/MoveFeedback"
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" "xarm6_demo/MoveFeedback:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:std_msgs/Header"
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" ""
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" ""
)

get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_custom_target(_xarm6_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "xarm6_demo" "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" "actionlib_msgs/GoalID:xarm6_demo/MoveResult:actionlib_msgs/GoalStatus:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_cpp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
)

### Generating Services

### Generating Module File
_generate_module_cpp(xarm6_demo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(xarm6_demo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(xarm6_demo_generate_messages xarm6_demo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_cpp _xarm6_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm6_demo_gencpp)
add_dependencies(xarm6_demo_gencpp xarm6_demo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm6_demo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)
_generate_msg_eus(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
)

### Generating Services

### Generating Module File
_generate_module_eus(xarm6_demo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(xarm6_demo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(xarm6_demo_generate_messages xarm6_demo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_eus _xarm6_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm6_demo_geneus)
add_dependencies(xarm6_demo_geneus xarm6_demo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm6_demo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)
_generate_msg_lisp(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
)

### Generating Services

### Generating Module File
_generate_module_lisp(xarm6_demo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(xarm6_demo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(xarm6_demo_generate_messages xarm6_demo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_lisp _xarm6_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm6_demo_genlisp)
add_dependencies(xarm6_demo_genlisp xarm6_demo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm6_demo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)
_generate_msg_nodejs(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
)

### Generating Services

### Generating Module File
_generate_module_nodejs(xarm6_demo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(xarm6_demo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(xarm6_demo_generate_messages xarm6_demo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_nodejs _xarm6_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm6_demo_gennodejs)
add_dependencies(xarm6_demo_gennodejs xarm6_demo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm6_demo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)
_generate_msg_py(xarm6_demo
  "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg;/opt/ros/melodic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
)

### Generating Services

### Generating Module File
_generate_module_py(xarm6_demo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(xarm6_demo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(xarm6_demo_generate_messages xarm6_demo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveGoal.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveAction.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveFeedback.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/qq44642754/xarm6_ws/devel/share/xarm6_demo/msg/MoveActionResult.msg" NAME_WE)
add_dependencies(xarm6_demo_generate_messages_py _xarm6_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(xarm6_demo_genpy)
add_dependencies(xarm6_demo_genpy xarm6_demo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS xarm6_demo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/xarm6_demo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(xarm6_demo_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(xarm6_demo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/xarm6_demo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(xarm6_demo_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(xarm6_demo_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/xarm6_demo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(xarm6_demo_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(xarm6_demo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/xarm6_demo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(xarm6_demo_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(xarm6_demo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/xarm6_demo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(xarm6_demo_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(xarm6_demo_generate_messages_py std_msgs_generate_messages_py)
endif()
