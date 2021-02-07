#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy, sys
import moveit_commander
import tf
import threading
import math
import numpy as np
from moveit_msgs.msg import RobotTrajectory
from trajectory_msgs.msg import JointTrajectoryPoint
from geometry_msgs.msg import PoseStamped, Pose
from ar_track_alvar_msgs.msg import AlvarMarkers,AlvarMarker

x = 0
y = 0
z = 0
ox = 0
oy = 0
oz = 0
zw = 0  
#Moveit的初始化
# 初始化move_group的API
moveit_commander.roscpp_initialize(sys.argv)               
# 初始化需要使用move group控制的机械臂中的arm group
arm = moveit_commander.MoveGroupCommander('xarm6')
# 初始化需要使用move group控制的机械臂中的gripper group
# gripper = moveit_commander.MoveGroupCommander('gripper')       
# 获取终端link的名称
end_effector_link = arm.get_end_effector_link()                       
# 设置目标位置所使用的参考坐标系
reference_frame = 'link_base'
arm.set_pose_reference_frame(reference_frame)              
# 当运动规划失败后，允许重新规划
arm.allow_replanning(True)
# 设置最大速度增益 
arm.set_max_velocity_scaling_factor(0.1)
# 设置最大加速度增益     
arm.set_max_acceleration_scaling_factor(0.1)
# 设置位置(单位：米)和姿态（单位：弧度）的允许误差
arm.set_goal_position_tolerance(0.01)
arm.set_goal_orientation_tolerance(0.05)
#gripper.set_goal_joint_tolerance(0.001)        
# 控制机械臂先回到初始化位置
arm.set_named_target('home')
arm.go()
# 设置机器臂当前的状态作为运动初始状态
arm.set_start_state_to_current_state()
Marker_id = PoseStamped()
Marker_pose = PoseStamped()

# 订阅 ar_pose_marker里面的内容 
def Listener():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("/ar_pose_marker",AlvarMarkers,ar_pose)

#定义回调函数
def ar_pose(data):

	#读取ArMarker的坐标
	x = data.markers[0].pose.pose.position.x
	y = data.markers[0].pose.pose.position.y
	z = data.markers[0].pose.pose.position.z
	ox = data.markers[0].pose.pose.orientation.x
	oy = data.markers[0].pose.pose.orientation.y
	oz = data.markers[0].pose.pose.orientation.z
	ow = data.markers[0].pose.pose.orientation.w
	id = data.markers[0].id
	
	# 计算出Ar_Marker的在机械臂坐标系下的坐标
	Base_H_Cam2 = np.array([[0.9850, -0.0286, 0.1700, 0.4438], [-0.1699, 0.0054, 0.9854, -0.008], [-0.0291, -0.9996, 0.0, 0.3339], [0.0, 0.0, 0.0, 1.0]])
	Cam2_H_Cam1 = np.array([[0.0, -1.0, 0.0, 0.0], [0.0, 0.0, -1.0, 0.0], [1.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 1.0]])
	Base_H_Cam1 = np.dot(Base_H_Cam2, Cam2_H_Cam1)
	Cam1_H_Obj = np.array([[x], [y], [z], [1.0]])
	Base_H_Obj = np.dot(Base_H_Cam1, Cam1_H_Obj)
	#print(Base_H_Obj)

	# 将坐标赋值给Marker_pose    
	Marker_pose.header.frame_id = reference_frame
	Marker_pose.header.stamp = rospy.Time.now() 
	Marker_pose.pose.position.x = Base_H_Obj[0,0]-0.196
	Marker_pose.pose.position.y = Base_H_Obj[1,0]-0.11
	Marker_pose.pose.position.z = Base_H_Obj[2,0]+0.02
	Marker_pose.pose.orientation.x = -0.5
	Marker_pose.pose.orientation.y = -0.5
	Marker_pose.pose.orientation.z = -0.5
	Marker_pose.pose.orientation.w = 0.5
	#print(Marker_pose)

	# 获得Ar_Marker的id
	Marker_id.pose.position.x = id
	

if __name__ == "__main__":
	#while not rospy.is_shutdown():
		Listener()

		# 机械臂预备状态
		j1 = (26.5/180.0)*math.pi
		j2 = (13.0/180.0)*math.pi
		j3 = (-23.3/180.0)*math.pi
		j4 = (0.0/180.0)*math.pi
		j5 = (10.3/180.0)*math.pi
		j6 = (23.0/180.0)*math.pi

		# 设置机械臂的目标位置，使用六轴的位置数据进行描述（单位：弧度）
		joint_positions = [j1, j2, j3, j4, j5, j6]
		arm.set_joint_value_target(joint_positions) 
		arm.go()
		rospy.loginfo("进入预备状态")
		rospy.sleep(5)
		# 判断Ar标签的id
		id = Marker_id.pose.position.x
		print(id)
		if id == 16:
			# 若表标签的id=16 则开弹簧门
			arm.set_pose_target(Marker_pose, end_effector_link)
			arm.go()
			rospy.loginfo("到达门把手的位置")
			rospy.sleep(3)
			rospy.loginfo("抓住门把手")

			# 开门的第一个点
			rospy.loginfo("开门")
			j2_1 = (58.6/180.0)*math.pi
			j2_2 = (38.8/180.0)*math.pi
			j2_3 = (-69.0/180.0)*math.pi
			j2_4 = (-4.1/180.0)*math.pi
			j2_5 = (-60.8/180.0)*math.pi
			j2_6 = (3.4/180.0)*math.pi

			# 开门的第二个点
			j3_1 = (60.4/180.0)*math.pi
			j3_2 = (61.7/180.0)*math.pi
			j3_3 = (-114.2/180.0)*math.pi
			j3_4 = (36.8/180.0)*math.pi
			j3_5 = (-44.0/180.0)*math.pi
			j3_6 = (-26.9/180.0)*math.pi

			# 到达第一个点
			joint_positions = [j2_1, j2_2, j2_3, j2_4, j2_5, j2_6]
			arm.set_joint_value_target(joint_positions)
			arm.go()

			# 到达第二个点
			joint_positions = [j3_1, j3_2, j3_3, j3_4, j3_5, j3_6]
			arm.set_joint_value_target(joint_positions)
			arm.go()
			rospy.loginfo("开门动作结束")
			rospy.sleep(1)
			# 回到初始状态
			rospy.loginfo("回到初始状态")
			#arm.set_pose_target(Marker_pose, end_effector_link)
			#arm.go()
			arm.set_named_target('home')
			arm.go()
			arm.clear_pose_targets()

		elif id == 10:

			#若表标签的id=10 则joint1 转10度
			arm.set_pose_target(Marker_pose, end_effector_link)
			arm.go()
			rospy.sleep(1)
			current_joint_values = arm.get_current_joint_values()
			current_joint_values[0] -=(10.0/180.0)*math.pi
			arm.set_joint_value_target(current_joint_values) 
			arm.go()
			rospy.sleep(1)
			arm.clear_pose_targets()


