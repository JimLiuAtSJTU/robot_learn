#!/usr/bin/env python2
import rospy
import actionlib
from control_msgs.msg import FollowJointTrajectoryActionFeedback, FollowJointTrajectoryActionResult, \
    FollowJointTrajectoryAction, FollowJointTrajectoryGoal
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
import moveit_commander
import moveit_msgs.msg
import numpy as np


if __name__ == '__main__':
    rospy.init_node('robot_jogging')