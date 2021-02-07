#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy, sys
import moveit_commander
import math
from moveit_commander import MoveGroupCommander
from geometry_msgs.msg import Pose
from copy import deepcopy

class TCPMove:
    def __init__(self):
        # 初始化move_group的API
        moveit_commander.roscpp_initialize(sys.argv)

        # 初始化ROS节点
        rospy.init_node('TCP_Move', anonymous=True)

        # 是否需要使用笛卡尔空间的运动规划
        cartesian = rospy.get_param('~cartesian', True)
                      
        # 初始化需要使用move group控制的机械臂中的arm group
        arm = MoveGroupCommander('xarm6')
        
        # 当运动规划失败后，允许重新规划
        arm.allow_replanning(True)
        
        # 设置目标位置所使用的参考坐标系
        arm.set_pose_reference_frame('link_base')
                
        # 设置位置(单位：米)和姿态（单位：弧度）的允许误差
        arm.set_goal_position_tolerance(0.001)
        arm.set_goal_orientation_tolerance(0.001)
        
        # 设置允许的最大速度和加速度
        arm.set_max_acceleration_scaling_factor(0.1)
        arm.set_max_velocity_scaling_factor(0.1)
        
        # 获取终端link的名称
        end_effector_link = arm.get_end_effector_link()

        # 控制机械臂先回到初始化位置
        arm.set_named_target('home')
        arm.go()
        rospy.sleep(1)
        

	# 角度弧度转换
	j1 = 90.0/180*math.pi
	j2 = -18.6/180*math.pi
	j3 = -28.1/180*math.pi
	j4 = 1.0/180*math.pi
	j5 = 47.6/180*math.pi
	j6 = -0.9 /180*math.pi
         
        # 设置机械臂的目标位置，使用六轴的位置数据进行描述（单位：弧度）
        joint_positions = [j1, j2, j3, j4, j5, j6]
        arm.set_joint_value_target(joint_positions) 
	
	arm.go()
	rospy.sleep(1)
	
	# 向下按压门把手
	current_pose = arm.get_current_joint_values()
	current_pose[4] += (20.0/180.0)*math.pi
	arm.set_joint_value_target(current_pose)
	arm.go()
	rospy.sleep(1)        
      	                      
        #推开门	
	current_pose = arm.get_current_joint_values()
	current_pose[0] -= (42.0/180.0)*math.pi
	current_pose[1] += (2.0/180.0)*math.pi
	current_pose[2] -= (11.4/180.0)*math.pi
	arm.set_joint_value_target(current_pose)
	arm.go()
	rospy.sleep(1) 
	
        # 控制机械臂先回到初始化位置
        arm.set_named_target('home')
        arm.go()
        rospy.sleep(1)
        
        # 关闭并退出moveit
        moveit_commander.roscpp_shutdown()
        moveit_commander.os._exit(0)

if __name__ == "__main__":
    try:
        TCPMove()
    except rospy.ROSInterruptException:
        pass
