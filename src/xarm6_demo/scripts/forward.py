#!/usr/bin/env python
# coding=UTF-8
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import rospy, sys
import moveit_commander
import math

class xarm6demo:
    def __init__(self):
        # 初始化move_group的API
        moveit_commander.roscpp_initialize(sys.argv)

        # 初始化ROS节点
        rospy.init_node('xarm6demo', anonymous=True)
 
        # 初始化需要使用move group控制的机械臂中的arm group
        arm = moveit_commander.MoveGroupCommander('xarm6')

        gripper = moveit_commander.MoveGroupCommander('xarm_gripper')
        
        # 设置机械臂运动的允许误差值
        arm.set_goal_joint_tolerance(0.001)
        gripper.set_goal_joint_tolerance(0.001)

        # 设置允许的最大速度和加速度
        arm.set_max_acceleration_scaling_factor(0.1)
        arm.set_max_velocity_scaling_factor(0.1)
        
        # 控制机械臂先回到初始化位置
        arm.set_named_target('home')
        arm.go()
        rospy.sleep(1)
         
        # 设置机械臂的目标位置，使用六轴的位置数据进行描述（单位：弧度）
        joint_positions = [0.391410, -0.676384, -0.376217, 0.0, 1.052834, 0.454125]
        arm.set_joint_value_target(joint_positions)
                 
        # 控制机械臂完成运动
        arm.go()
        rospy.sleep(1)
	current_pose = arm.get_current_joint_values()
	rospy.loginfo(str(current_pose))  			# 机械臂到达门把手的位置

	#向下按压门把手
	current_pose[4] += (0/180.0)*math.pi
	
	#再次设置机械臂的目标位置

	arm.set_joint_value_target(current_pose)
	arm.go() 	
	rospy.sleep(1)
     	gripper.set_named_target('close')
	gripper.go()
     	gripper.set_named_target('open')
	gripper.go()
        # 控制机械臂先回到初始化位置
	
        arm.set_named_target('home')
        arm.go()
        rospy.sleep(1)
        
        # 关闭并退出moveit
        moveit_commander.roscpp_shutdown()
        moveit_commander.os._exit(0)

if __name__ == "__main__":
    try:
        xarm6demo()
    except rospy.ROSInterruptException:
        pass
