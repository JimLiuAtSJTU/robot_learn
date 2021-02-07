#include "ros/ros.h"
#include "tf2_msgs/TFMessage.h"
#include <iostream>
#include <geometry_msgs/PoseStamped.h>
#include <moveit/move_group_interface/move_group_interface.h>
#define M 4
#define N 4
#define P 1



using namespace std;

geometry_msgs::PoseStamped Obj_pose;
tf2_msgs::TFMessageConstPtr last_msg_;
geometry_msgs::Pose current_pose;

void number_callback(const tf2_msgs::TFMessage::ConstPtr& msg)
{
	last_msg_ = msg;
	if (last_msg_ ->transforms[0].transform.translation.x  != 0.0)
	{
		Obj_pose.pose.position.x = last_msg_ ->transforms[0].transform.translation.x;
		Obj_pose.pose.position.y = last_msg_ ->transforms[0].transform.translation.y;
		Obj_pose.pose.position.z = last_msg_ ->transforms[0].transform.translation.z;
	}

}



int main(int argc, char **argv)
{
	ros::init(argc, argv, "tf_subscribe");
	ros::NodeHandle n;
	ros::AsyncSpinner spinner(1);
	spinner.start();
	
	ros::Subscriber tf_sub = n.subscribe("/tf",10, number_callback);

	moveit::planning_interface::MoveGroupInterface arm("xarm6");
	//获取终端link的名称
	std::string end_effector_link = arm.getEndEffectorLink();

	//设置目标位置所使用的参考坐标系
	std::string reference_frame = "link_base";
	arm.setPoseReferenceFrame(reference_frame);

	//设置位置(单位：米)和姿态（单位：弧度）的允许误差
	arm.setGoalJointTolerance(0.001);
	arm.setGoalPositionTolerance(0.001);

	//设置允许的最大速度和加速度
	arm.setMaxAccelerationScalingFactor(0.1);
	arm.setMaxVelocityScalingFactor(0.1);
	
	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);
	//current_pose = arm.getCurrentPose(end_effector_link).pose;
	//cout << "****************************" << Obj_pose.pose.position << endl;
	//cout << "current pose"<< current_pose << endl;
	// 机器人到达预备状态
	double targetPose[6] = {(66.5/180.0)*M_PI, (-18.8/180.0)*M_PI, (-26.4/180.0)*M_PI, (-0.1/180.0)*M_PI, (45.2/180.0)*M_PI, (66.6/180.0)*M_PI};
	std::vector<double> joint_group_positions(6);
	joint_group_positions[0] = targetPose[0];
	joint_group_positions[1] = targetPose[1];
	joint_group_positions[2] = targetPose[2];
	joint_group_positions[3] = targetPose[3];
	joint_group_positions[4] = targetPose[4];
	joint_group_positions[5] = targetPose[5];

	arm.setJointValueTarget(joint_group_positions);
	arm.move();
	sleep(1);

	// 计算物体在机械臂坐标系下的位置
	double a[M][N] = { {-0.9991, -0.0234, 0.0365, -0.1382},{-0.0245, 0.9992, -0.0309, 0.4809},{ -0.0358, -0.0317, -0.9989, 0.5004},{ 0.0, 0.0, 0.0, 1.0}};
	double b[N][P] = { {Obj_pose.pose.position.x},{Obj_pose.pose.position.y},{Obj_pose.pose.position.z},{1.0}};
	double c[M][P];
	int i, j, k;
	for (i = 0; i < M; i++)
		for (j = 0; j < P; j++)
			c[i][j] = 0;
	for (i = 0; i < M; i++)
		for (j = 0; j < P; j++)
			for (k = 0; k < N; k++)
				c[i][j] += a[i][k] * b[k][j];
	// 设置机器人终端的目标位置


	Obj_pose.pose.position.x = c[0][0];
	Obj_pose.pose.position.y = c[0][1];
	Obj_pose.pose.position.z = c[0][2]+ 0.03;
		
	Obj_pose.pose.orientation.x = 1.0;
	Obj_pose.pose.orientation.y = 0.0;
	Obj_pose.pose.orientation.z = 0.0;
	Obj_pose.pose.orientation.w = 0.0;

    	// 设置机器臂当前的状态作为运动初始状态
    	arm.setStartStateToCurrentState();

    	arm.setPoseTarget(Obj_pose.pose);

    	// 进行运动规划，计算机器人移动到目标的运动轨迹，此时只是计算出轨迹，并不会控制机械臂运动
    	moveit::planning_interface::MoveGroupInterface::Plan plan;
    	moveit::planning_interface::MoveItErrorCode success = arm.plan(plan);

    	ROS_INFO("Plan (pose goal) %s",success?"":"FAILED");   

    	//让机械臂按照规划的轨迹开始运动。
    	if(success)
      		arm.execute(plan);
    	sleep(1);
	
	cout << "****************************" << Obj_pose.pose.position << endl;
	

	arm.setJointValueTarget(joint_group_positions);
	arm.move();
	sleep(1);

	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);

	ros::shutdown(); 
	return 0;

}
