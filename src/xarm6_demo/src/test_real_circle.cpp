/*机器人开门演示的demo，通过ARMarker来定位门把手，并通过圆弧运动的方式来实现开门的动作

 作者：Zheng, Zhitao
 Emali: ztzheng@fitgreat.cn

*/

#include <math.h>
#include <cmath>
#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_trajectory/robot_trajectory.h>
#include <iostream>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>
#include <Eigen/Core>
#include <Eigen/Geometry>

#define M 4
#define N 4
#define P 1

using namespace std;

geometry_msgs::PoseStamped Marker_pose, Marker_id;
//定义话题/visualization的回调函数
void poseCallback(const visualization_msgs::Marker &marker_tmp)
{
	Marker_pose.header = marker_tmp.header;
	Marker_pose.pose.position = marker_tmp.pose.position;
	Marker_pose.pose.orientation.x = 1.0;
	Marker_pose.pose.orientation.y = 0.0;
	Marker_pose.pose.orientation.z = 0.0;
	Marker_pose.pose.orientation.w = 0.0;
	Marker_id.pose.position.x = marker_tmp.id;
	Marker_id.pose.orientation = marker_tmp.pose.orientation;
	//cout<<Marker_pose.pose.position<<endl;
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "test_real_circle");
	// 定义句柄
	ros::NodeHandle n;
	ros::AsyncSpinner spinner(1);
	spinner.start();

	ros::Subscriber pose_sub = n.subscribe("/visualization_marker", 10, poseCallback);

	moveit::planning_interface::MoveGroupInterface arm("xarm6");

	//获取终端link的名称
	std::string end_effector_link = arm.getEndEffectorLink();

	//设置目标位置所使用的参考坐标系
	std::string reference_frame = "link_base";
	arm.setPoseReferenceFrame(reference_frame);

	//当运动规划失败后，允许重新规划
	arm.allowReplanning(true);

	//设置位置(单位：米)和姿态（单位：弧度）的允许误差
	arm.setGoalPositionTolerance(0.001);
	arm.setGoalOrientationTolerance(0.01);

	//设置允许的最大速度和加速度
	arm.setMaxAccelerationScalingFactor(0.5);
	arm.setMaxVelocityScalingFactor(0.5);

	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);
	
	//机械臂进入预备状态
	system("play /home/qq44642754/音乐/注意避让.wav");
	double prepare[6] = {(0.0/180.0)*M_PI, (-59.8/180.0)*M_PI, (-12.9/180.0)*M_PI, (0.0/180.0)*M_PI, (72.7/180.0)*M_PI, (0.0/180.0)*M_PI};
	std::vector<double> prepare_positions(6);
	prepare_positions[0] = prepare[0];
	prepare_positions[1] = prepare[1];
	prepare_positions[2] = prepare[2];
	prepare_positions[3] = prepare[3];
	prepare_positions[4] = prepare[4];
	prepare_positions[5] = prepare[5];

	arm.setJointValueTarget(prepare_positions);
	arm.move();
	sleep(1);
	cout<<"到达预备状态"<<endl;
	
	// 计算物体在机械臂坐标系下的位置
	double a[M][N] = { {0.9991, -0.0076, 0.0408, 0.4495},{-0.0404, 0.0459, 0.9981, -0.0926},{ -0.0095, -0.9989, 0.0455, 0.3678},{ 0.0, 0.0, 0.0, 1.0}};
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

	// 设置机器人终端的目标位置(门把手)

	// 获取目前门的状态（开了多少度）
	Eigen::Quaterniond quanternion4(Marker_id.pose.orientation.x, Marker_id.pose.orientation.y, Marker_id.pose.orientation.z, Marker_id.pose.orientation.w);
	Eigen::Vector3d eulerAngle4 = quanternion4.matrix().eulerAngles(2,1,0);
	//cout << "yaw(z) pitch(y) roll(x) = " << eulerAngle4.transpose() << endl;
	//cout <<eulerAngle4<<endl;	
	double Angle = 3.00-eulerAngle4[0]; //176-Yaw
	//cout<<Angle*180.0/M_PI<<endl;

	//根据旋转角来确定门把手的位置
	Marker_pose.pose.position.x = c[0][0] - 0.1876*cos(Angle);
	Marker_pose.pose.position.y = c[1][0] + 0.1876*sin(Angle);
	Marker_pose.pose.position.z = c[2][0] + 0.005 ;
	arm.setPoseTarget(Marker_pose);
	cout<<Marker_pose<<endl;
	arm.move();
	cout<<"到达门把手"<<endl;
	system("play /home/qq44642754/音乐/到达门把手");
	cout<<"-----------"<<endl;
	cout<<"准备开门"<<endl;
	system("play /home/qq44642754/准备开门");

	
	// 设置旋转点
	geometry_msgs::Pose target_pose;
	geometry_msgs::Pose center_pose;

	center_pose.position.x = 0.4971;
	center_pose.position.y = 0.2451;
	center_pose.position.z = 0.2952;

	center_pose.orientation.x = 1.0;
	center_pose.orientation.y = 0.0;
	center_pose.orientation.z = 0.0;
	center_pose.orientation.w = 0.0;


	target_pose.position.x = 0.4971;
	target_pose.position.y = 0.2451;
	target_pose.position.z = 0.2952;

	target_pose.orientation.x = 1.0;
	target_pose.orientation.y = 0.0;
	target_pose.orientation.z = 0.0;
	target_pose.orientation.w = 0.0;

	//cout<<target_pose<<endl;
	std::vector<geometry_msgs::Pose> waypoints;

	
	// 设置圆心	
	double centerA = center_pose.position.x;
	double centerB = center_pose.position.y;

	// 计算圆心到门把手的距离
	double e = center_pose.position.x - (c[0][0]-0.1876*cos(Angle));
	double f = center_pose.position.y - (c[1][0]+0.1876*sin(Angle));
	double radius = sqrt(pow(e,2) + pow(f,2));

	// 计算圆心和门把手连成的线和基座标系的夹角
	double g = e/radius;
	//cout<<theta<<endl;	
	

	// 加入圆周上的点
	for(double th = acos(g); th < 1.25; th = th + 0.005)
	{
		target_pose.position.x = centerA - radius * cos(th);
		target_pose.position.y = centerB + radius * sin(th);
		waypoints.push_back(target_pose);
	}

	// 笛卡尔空间下的路径规划
	moveit_msgs::RobotTrajectory trajectory;
	moveit_msgs::RobotTrajectory trajectory1;
	const double jump_threshold = 0.0;
	const double eef_step = 0.01;
	double fraction = 0.0;
	int maxtries = 100;   //最大尝试规划次数
	int attempts = 0;     //已经尝试规划次数

	while(fraction < 1.0 && attempts < maxtries)
	{
		fraction = arm.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
		attempts++;
        
		if(attempts % 10 == 0)
		ROS_INFO("Still trying after %d attempts...", attempts);
	}
    
	if(fraction == 1)
	{   
		ROS_INFO("Path computed successfully. Moving the arm.");

		// 生成机械臂的运动规划数据
		moveit::planning_interface::MoveGroupInterface::Plan plan;
		plan.trajectory_ = trajectory;

		// 执行运动
		arm.execute(plan);
		system("play /home/qq44642754/音乐/开门完成.wav");
		sleep(1);
	}
	else
	{
		ROS_INFO("Path planning failed with only %0.6f success after %d attempts.", fraction, maxtries);
	}
	
	// 机械臂逆运算回到初始位置
	std::vector<geometry_msgs::Pose> waypoints2;
	for(double th1 = 1.25; th1 > (4.0/180.0)*M_PI; th1 = th1 - 0.005)
	{
		target_pose.position.x = centerA - radius * cos(th1);
		target_pose.position.y = centerB + radius * sin(th1);
		waypoints2.push_back(target_pose);	
	}
	
	fraction = 0.0;
	attempts = 0;
	

	//开门的逆运算
	while(fraction < 1.0 && attempts < maxtries)
	{
		fraction = arm.computeCartesianPath(waypoints2, eef_step, jump_threshold, trajectory1);
		attempts++;
        
		if(attempts % 10 == 0)
		ROS_INFO("Still trying after %d attempts...", attempts);
	}
    
	if(fraction == 1)
	{   
		ROS_INFO("Path computed successfully. Moving the arm.");

		// 生成机械臂的运动规划数据
		moveit::planning_interface::MoveGroupInterface::Plan plan1;
		plan1.trajectory_ = trajectory1;

		// 执行运动
		system("play /home/qq44642754/音乐/准备关门.wav");
		arm.execute(plan1);
		sleep(1);
		system("play /home/qq44642754/音乐/门已关上.wav");
		
	}
	else
	{
		ROS_INFO("Path planning failed with only %0.6f success after %d attempts.", fraction, maxtries);
	}



	// 抬高机械爪
	geometry_msgs::Pose current_pose;
	current_pose = arm.getCurrentPose(end_effector_link).pose;
	current_pose.position.z += 0.1;
	arm.setPoseTarget(current_pose);
	system("play /home/qq44642754/音乐/松开机械爪.wav");
	arm.move();
	sleep(1);

	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	system("play /home/qq44642754/音乐/回到初始状态.wav");
	sleep(1);

	ros::shutdown(); 
	return 0;
}
