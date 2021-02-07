#!/usr/bin/env python
# -*- coding: utf-8 -*-
#订阅/visualization_marker话题，消息类型visualization_msgs/Marker
import rospy
from visualization_msgs.msg import Marker

def poseCallback(msg):
	rospy.loginfo("x:%0.6f, y:%0.6f", msg.pose.position.x, msg.pose.position.y)

def pose_subscriber():
	#ROS节点初始化
	rospy.init_node('pose_subscriber', anonymous=True)

	#
	rospy.Subscriber("/visualization_marker", Marker, poseCallback)

	# 循环等待回调函数
	rospy.spin()

if __name__ == '__main__':
	pose_subscriber()

