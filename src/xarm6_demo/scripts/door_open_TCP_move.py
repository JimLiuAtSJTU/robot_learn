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
         
        # 设置机械臂的目标位置，使用六轴的位置数据进行描述（单位：弧度）u
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
      	                      
        # 获取当前位姿数据最为机械臂点对点运动的起始位姿
        start_pose = arm.get_current_pose(end_effector_link).pose

        # 初始化路点列表
        waypoints = []   #放入点的位置
            
        # 设置路点数据，并加入路点列表
        wpose = deepcopy(start_pose)
        wpose.position.z += 0.053     
        waypoints.append(deepcopy(wpose)) # z方向上的位移

        wpose.position.x += 0.2018
	waypoints.append(deepcopy(wpose)) # x方向上的位移
	
	#wpose.position.y -= 0.0
        #waypoints.append(deepcopy(wpose)) # y方向上的位移

        if cartesian:
		fraction = 0.0   #路径规划覆盖率
		maxtries = 100   #最大尝试规划次数
		attempts = 0     #已经尝试规划次数
		
		# 设置机器臂当前的状态作为运动初始状态
		arm.set_start_state_to_current_state()
	 
		# 尝试规划一条笛卡尔空间下的路径，依次通过所有路点
		while fraction < 1.0 and attempts < maxtries:
		    (plan, fraction) = arm.compute_cartesian_path (
		                            waypoints,   # waypoint poses，路点列表
		                            0.01,        # eef_step，终端步进值
		                            0.0,         # jump_threshold，跳跃阈值
		                            True)        # avoid_collisions，避障规划
		    
		    # 尝试次数累加
		    attempts += 1
		    
		    # 打印运动规划进程
		    if attempts % 10 == 0:
		        rospy.loginfo("Still trying after " + str(attempts) + " attempts...")
		             
		# 如果路径规划成功（覆盖率100%）,则开始控制机械臂运动
		if fraction == 1.0:
		    rospy.loginfo("Path computed successfully. Moving the arm.")
		    arm.execute(plan)
		    rospy.loginfo("Path execution complete.")
		    #rospy.loginfo(str(waypoints) )
		# 如果路径规划失败，则打印失败信息
		else:
		    rospy.loginfo("Path planning failed with only " + str(fraction) + " success after " + str(maxtries) + " attempts.")  

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
