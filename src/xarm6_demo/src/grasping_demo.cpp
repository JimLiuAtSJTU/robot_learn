/*机器人开门演示的demo，通过ARMarker来定位门把手，并通过圆弧运动的方式来是实现按压门把手的动作

 作者：Zheng, Zhitao
 Emali: ztzheng@fitgreat.cn

*/


#include <math.h>
#include <cmath>
#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_trajectory/robot_trajectory.h>
#include <actionlib/client/simple_action_client.h>
#include <xarm_gripper/MoveAction.h>
#include <iostream>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>
#include <Eigen/Core>
#include <Eigen/Geometry>

using namespace std;


geometry_msgs::PoseStamped Marker_pose, Marker_id;
Eigen::Matrix<double, 4, 1> TCP_offset, Handle;
std::vector<double> rpy(3);
geometry_msgs::Pose current_pose, target_pose, close_pose;

//定义话题/visualization的回调函数

void poseCallback(const visualization_msgs::Marker &marker_tmp)
{	

	if ( marker_tmp.pose.position.x > -0.5 && marker_tmp.pose.position.x < 1.0 && marker_tmp.pose.position.y > -0.5 && marker_tmp.pose.position.y < 1.0 && 
	     marker_tmp.pose.position.z > 0.1 && marker_tmp.pose.position.z < 1.0 )		//数值滤波
	{
		Marker_pose.header = marker_tmp.header;
		Marker_pose.pose.position = marker_tmp.pose.position;
		Marker_id.pose.position.x = marker_tmp.id;
		Marker_id.pose.orientation = marker_tmp.pose.orientation;
		//cout << Marker_id.pose.position.x << endl;
	}

}

void gripper_open ()
{
	actionlib::SimpleActionClient<xarm_gripper::MoveAction> ac("xarm/gripper_move", true);
	ac.waitForServer();
	xarm_gripper::MoveGoal open;
	open.target_pulse = 800;
	open.pulse_speed = 1500;
	ac.sendGoal(open);
}

void gripper_close ()
{
	actionlib::SimpleActionClient<xarm_gripper::MoveAction> ac("xarm/gripper_move", true);
	ac.waitForServer();
	xarm_gripper::MoveGoal open;
	open.target_pulse = 0;
	open.pulse_speed = 1500;
	ac.sendGoal(open);
}

void attainPosition (vector<double> pos)
{	
	// 该函数计算物体在机械臂坐标系下的位置(TCP_offset)
	
	Eigen::Quaterniond quaternion4( pos[6], pos[3], pos[4], pos[5]);// 机械臂rpy 四元数
	Eigen::Vector3d eulerAngle4 = quaternion4.matrix().eulerAngles(2,1,0);	//四元数转欧拉角
	Eigen::Matrix3d rotation_matrix3;
	rotation_matrix3 = Eigen::AngleAxisd(eulerAngle4[0], Eigen::Vector3d::UnitZ()) * 	
		        Eigen::AngleAxisd(eulerAngle4[1], Eigen::Vector3d::UnitY()) * 
                              Eigen::AngleAxisd(eulerAngle4[2], Eigen::Vector3d::UnitX());	//欧拉角转旋转矩阵

	Eigen::Matrix4d Transform;
	Transform << rotation_matrix3(0,0), rotation_matrix3(0,1), rotation_matrix3(0,2), pos[0],
		  rotation_matrix3(1,0), rotation_matrix3(1,1), rotation_matrix3(1,2), pos[1], 
		  rotation_matrix3(2,0), rotation_matrix3(2,1), rotation_matrix3(2,2), pos[2],
		  0.0,		   0.0,		    0.0,		     1.0;

	// 机械爪的偏移
	Handle = Transform * TCP_offset;			//门把手相对与终端的位置

}

void attainObject (double x, double y, double z)		
{	
	// 该函数计算门把手在机械臂坐标系下的位置，xyz为标签离门把手的位移量
	Marker_pose.pose.position.x = Handle[0] + x;
	Marker_pose.pose.position.y = Handle[1] + y;
	Marker_pose.pose.position.z = Handle[2] + z;
}

void turnHandle (double handle_length, double angle, double r, double p, double y, double x1, double y1, double z1)
{
	Eigen::Quaterniond quaternion3;
	quaternion3 = Eigen::AngleAxisd(y, Eigen::Vector3d::UnitZ()) * 
	Eigen::AngleAxisd(p, Eigen::Vector3d::UnitY()) * 
	Eigen::AngleAxisd(r, Eigen::Vector3d::UnitX());
 
	target_pose.position.x = x1;	
	target_pose.position.y = y1 - handle_length * (1.0-cos(angle/180.0*M_PI));
	target_pose.position.z = z1 - handle_length * sin(angle/180.0*M_PI);
	
	target_pose.orientation.x = quaternion3.x();
	target_pose.orientation.y = quaternion3.y();
	target_pose.orientation.z = quaternion3.z();
	target_pose.orientation.w = quaternion3.w();

}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "grasping_demo");
	ros::AsyncSpinner spinner(1);
	// 定义句柄
	ros::NodeHandle n;
	spinner.start();

	// moveit 控制
	moveit::planning_interface::MoveGroupInterface arm("xarm6");

	// 获取终端link的名称
	std::string end_effector_link = arm.getEndEffectorLink();
	
	// 设置目标位置所使用的参考坐标系
	std::string reference_frame = "link_base";
	arm.setPoseReferenceFrame(reference_frame);

	// 当运动规划失败后，允许重新规划
	arm.allowReplanning(true);

	// 设置位置(单位：米)和姿态（单位：弧度）的允许误差
	arm.setGoalPositionTolerance(0.001);
	arm.setGoalOrientationTolerance(0.01);

	// 设置允许的最大速度和加速度
	arm.setMaxAccelerationScalingFactor(0.1);
	arm.setMaxVelocityScalingFactor(0.1);

	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(0.5);
	
	// 机械爪的偏移值
	TCP_offset << 0.0, 0.0, -0.172, 1.0;		//TCP_Offset的值
	
	ros::Subscriber pose_sub = n.subscribe("/visualization_marker", 10, poseCallback);
	sleep(1);	// 处理数据的时间

	int ID = Marker_id.pose.position.x;
	cout << "ID是--------------------------------------------------" << ID << endl;


	//机器人运动到预备状态
	system("play /home/qq44642754/音乐/注意避让.wav");
	std::vector<double> joint_group_positions(6);
	std::vector<double> joint_group_positions2(6);

	if (ID == 0 || ID == 7)
	{
		joint_group_positions[0] = -90.0/180.0*M_PI;
		joint_group_positions[1] = -12.4/180.0*M_PI;
		joint_group_positions[2] = -19.3/180.0*M_PI;
		joint_group_positions[3] = -76.4/180.0*M_PI;
		joint_group_positions[4] = -81.7/180.0*M_PI;
		joint_group_positions[5] = -58.9/180.0*M_PI;
		arm.setJointValueTarget(joint_group_positions);
		arm.move();
	}
	else if (ID == 1)
	{
		joint_group_positions[0] = -50.6/180.0*M_PI;
		joint_group_positions[1] = 0.0/180.0*M_PI;
		joint_group_positions[2] = 0.0/180.0*M_PI;
		joint_group_positions[3] = 0.0/180.0*M_PI;
		joint_group_positions[4] = -90.0/180.0*M_PI;
		joint_group_positions[5] = 0.0/180.0*M_PI;
		arm.setJointValueTarget(joint_group_positions);
		arm.move();
	}	

	//打开夹爪
	gripper_open();
	sleep(2);
	cout<<"到达预备状态"<<endl;


	//计算物体在机械臂坐标系下的位置(tf转化)
	Eigen::Matrix<double, 4, 4> Base_H_Cam;
	Base_H_Cam << 0.0107, 0.1326, 0.9911, -0.1808, 
		   -0.9999, 0.0049, 0.0102, -0.1944, 
		   -0.0035, -0.9912 , 0.1327, 0.4541,
		    0.0, 0.0, 0.0, 1.0 ;
	Eigen::Matrix<double, 4, 1> Cam_H_Obj;
	Cam_H_Obj << Marker_pose.pose.position.x, Marker_pose.pose.position.y, Marker_pose.pose.position.z, 1.0;
	cout << Cam_H_Obj <<endl;
	Eigen::Matrix<double, 4, 1> Base_H_Obj;
	Base_H_Obj = Base_H_Cam * Cam_H_Obj;	//得到标签的位置
	cout << Base_H_Obj <<endl;


	// 获取目前门的状态（开了多少度）
	//Eigen::Quaterniond quanternion4(Marker_id.pose.orientation.x, Marker_id.pose.orientation.y, Marker_id.pose.orientation.z, Marker_id.pose.orientation.w);
	//Eigen::Vector3d dooreulerAngle4 = quanternion4.matrix().eulerAngles(2,1,0);
	//double doorOpenAngle = 3.08412-dooreulerAngle4[0]; // 门打开的角度

	// 机械臂运动到门把手的位置

	if (ID == 7)		// 若Marker的id为10	
	{	
		// 仓库门的开门姿势
		std::vector<double> pose(7);
		pose[0] = Base_H_Obj[0];
		pose[1] = Base_H_Obj[1];
		pose[2] = Base_H_Obj[2];
		Marker_pose.pose.orientation.x = pose[3] = 0.5;  
		Marker_pose.pose.orientation.y = pose[4] = 0.5;	 
		Marker_pose.pose.orientation.z = pose[5] = 0.5;	 
		Marker_pose.pose.orientation.w = pose[6] = 0.5;  
		attainPosition (pose);
		attainObject (-0.05, -0.1175, 0.0003);	//输入门把手离标签的xyz的距离
		

	}
	else if (ID == 0)
	{	
		// 会议室门的开门姿势
		std::vector<double> pose(7);
		pose[0] = Base_H_Obj[0];
		pose[1] = Base_H_Obj[1];
		pose[2] = Base_H_Obj[2];
		Marker_pose.pose.orientation.x = pose[3] = 0.5;  
		Marker_pose.pose.orientation.y = pose[4] = 0.5;	 
		Marker_pose.pose.orientation.z = pose[5] = 0.5;	 
		Marker_pose.pose.orientation.w = pose[6] = 0.5;  
		attainPosition (pose);
		attainObject (- 0.1265*cos(1.1876 + 0.0), - 0.1265*sin(1.1876 + 0.0), 0.005);	//输入门把手离标签的xyz的距离

	}
	else if (ID == 1)
	{	
		// 门口玻璃门的开门姿势
		std::vector<double> pose(7);
		pose[0] = Base_H_Obj[0];
		pose[1] = Base_H_Obj[1];
		pose[2] = Base_H_Obj[2];
		Marker_pose.pose.orientation.x = pose[3] = 0.707107;  
		Marker_pose.pose.orientation.y = pose[4] = 0.0;	 
		Marker_pose.pose.orientation.z = pose[5] = 0.707107;	 
		Marker_pose.pose.orientation.w = pose[6] = 0.0;  
		attainPosition (pose);
		attainObject (- 0.1488, -0.1255 , 0.0);	//到达门把手10cm处
		arm.setPoseTarget(Marker_pose);
		cout<< "门把手的位置**************************" << Marker_pose.pose <<endl;
		arm.move();
		sleep(1);
		joint_group_positions2 = arm.getCurrentJointValues();
		cout << "角度值" << joint_group_positions2[0] << endl;
		attainObject (- 0.0488 , -0.1255 , 0.0);

	}		
	arm.setPoseTarget(Marker_pose);
	cout<< "门把手的位置" << Marker_pose.pose <<endl;
	arm.move();
	sleep(1);
	cout<<"到达门把手"<<endl;
	system("play /home/qq44642754/音乐/到达门把手.wav"); //sleep


	//关闭夹爪
	gripper_close();
	cout<<"准备开门"<<endl;
	system("play /home/qq44642754/音乐/准备开门.wav");

	// 转到门把手前的位置

	current_pose = arm.getCurrentPose(end_effector_link).pose;	//夹爪关闭时的位姿
	
	//---------------------------------------------------------------------------------
	// 转动门把手
	if (ID == 0 || ID == 7)
	{
		double handle_length = 0.082; 	//82mm
		double angle = 40.0;		//40度
		rpy = arm.getCurrentRPY();	//当前的RPY值
		rpy[1] = angle/180.0*M_PI;
		turnHandle (handle_length, angle, rpy[0], rpy[1], rpy[2], current_pose.position.x, current_pose.position.y, current_pose.position.z);
		//3.2 欧拉角转换为四元数,
		arm.setPoseTarget(target_pose);
		arm.move();

	}

	else if (ID == 1)
	{
		sleep(0.5); //不需要按压门把手的动作

	}
	//----------------------------------------------------------------------------------

	//移动底盘
	cout << "小推车运动" << endl;
	system("play /home/qq44642754/音乐/开门完成.wav");
	sleep(5);
	system("play /home/qq44642754/音乐/准备关门.wav");
	cout << "小推车运动" << endl;
	// 回到门把手转动前
	arm.setPoseTarget(current_pose);
	arm.move();
	sleep(1);
	//松开夹爪
	gripper_open();
	system("play /home/qq44642754/音乐/门已关上.wav");
	system("play /home/qq44642754/音乐/回到初始状态.wav");

	// 回到初始位置，关闭夹爪
	if (ID == 0 || ID == 7)
	{
		arm.setJointValueTarget(joint_group_positions);
		arm.move();
		gripper_close();
		sleep (0.5);
	}

	else if (ID ==1)
	{
		arm.setJointValueTarget(joint_group_positions2);
		arm.move();
		arm.setJointValueTarget(joint_group_positions);
		arm.move();
		gripper_close();
		sleep (0.5);
	}

	arm.setNamedTarget("home");
	arm.move();
	sleep(1);
	ros::shutdown();
	return 0;

}
