#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <math.h>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>
#define M 4
#define N 4
#define P 1


using namespace std;

geometry_msgs::PoseStamped Marker_pose,Marker_id;

//定义话题/visualization的回调函数
void poseCallback(const visualization_msgs::Marker &marker_tmp)
{
	Marker_pose.header = marker_tmp.header;
	Marker_pose.pose.position = marker_tmp.pose.position;
	Marker_pose.pose.orientation = marker_tmp.pose.orientation;
	Marker_id.pose.position.x = marker_tmp.id;
	//cout<<Marker_id.pose.position.x<<endl;
}


int main(int argc, char **argv)
{
	//初始化ros的节点
	ros::init(argc, argv, "test");
	//定义句柄
	ros::NodeHandle n;
	ros::AsyncSpinner spinner(1);
	spinner.start();

	ros::Subscriber pose_sub = n.subscribe("/visualization_marker",10,poseCallback);

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
	arm.setMaxAccelerationScalingFactor(0.2);
	arm.setMaxVelocityScalingFactor(0.2);
	
	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);
	cout << Marker_pose.pose.position << endl;
	// 定义循环
	int count = 1;
	while (count <= 3)
	{

		// 机器人关节运动到预备状态
		double targetPose[6] = {(0.0/180.0)*M_PI, (-57.6/180.0)*M_PI, (-7.0/180.0)*M_PI, (0.0/180.0)*M_PI, (64.6/180.0)*M_PI, (0.0/180.0)*M_PI};
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
		cout<<Marker_pose<<endl;
		// 计算物体在机械臂坐标系下的位置
		double a[M][N] = { {0.7543, -0.6565, -0.0000, -0.5425},{-0.6565, -0.7543, -0.0000, -0.3516},{ 0.0, 0.0000, -1.0000, 0.3497},{ 0.0, 0.0000, 0.0, 1.0}};
		double b[N][P] = { {Marker_pose.pose.position.x},{Marker_pose.pose.position.y},{Marker_pose.pose.position.z},{1.0}};
		double c[M][P];
		int i, j, k;
		for (i = 0; i < M; i++)
			for (j = 0; j < P; j++)
				c[i][j] = 0;
		for (i = 0; i < M; i++)
			for (j = 0; j < P; j++)
				for (k = 0; k < N; k++)
					c[i][j] += a[i][k] * b[k][j];
		cout << "resault：" << endl;
		for (i = 0; i < M; i++) {
			for (j = 0; j < P; j++)
				cout << c[i][j] << " ";
			cout << endl;
		}

		// 设置机器人终端的目标位置
		Marker_pose.pose.position.x = c[0][0];
		Marker_pose.pose.position.y = c[1][0];
		Marker_pose.pose.position.z = c[2][0]+0.015;
		

		// 设置机器臂当前的状态作为运动初始状态
		arm.setStartStateToCurrentState();

		arm.setPoseTarget(Marker_pose);
		
		// 进行运动规划，计算机器人移动到目标的运动轨迹，此时只是计算出轨迹，并不会控制机械臂运动
		moveit::planning_interface::MoveGroupInterface::Plan plan;
		moveit::planning_interface::MoveItErrorCode success = arm.plan(plan);

		ROS_INFO("Plan (pose goal) %s",success?"":"FAILED");   

		//让机械臂按照规划的轨迹开始运动。
		if(success)
			arm.execute(plan);
		sleep(1);

		//回到预备状态
		arm.setJointValueTarget(joint_group_positions);
		arm.move();
		sleep(1);
		count = count+1;
	}
	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);

	ros::shutdown(); 

	return 0;
}
