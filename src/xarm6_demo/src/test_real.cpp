#include <stdio.h>
#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <math.h>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>
#include <moveit/trajectory_processing/iterative_time_parameterization.h>
#define M 4
#define N 4
#define P 1

using namespace std;

geometry_msgs::PoseStamped Marker_pose, Marker_id, current_pose;

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
	//cout<<Marker_id.pose.position.x<<endl;
}


int main(int argc, char **argv)
{
	//初始化ros的节点
	ros::init(argc, argv, "test_real");
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
	arm.setMaxAccelerationScalingFactor(1.0);
	arm.setMaxVelocityScalingFactor(1.0);
	
	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);

	// 定义循环
	int count = 1;
	while (count == 1)
	{
		system("play /home/qq44642754/音乐/注意避让.wav");
		// 机器人关节运动到预备状态
		double targetPose[6] = {(0.0/180.0)*M_PI, (-59.8/180.0)*M_PI, (-12.9/180.0)*M_PI, (0.0/180.0)*M_PI, (72.7/180.0)*M_PI, (0.0/180.0)*M_PI};
		std::vector<double> joint_group_positions1(6);
		joint_group_positions1[0] = targetPose[0];
		joint_group_positions1[1] = targetPose[1];
		joint_group_positions1[2] = targetPose[2];
		joint_group_positions1[3] = targetPose[3];
		joint_group_positions1[4] = targetPose[4];
		joint_group_positions1[5] = targetPose[5];

		arm.setJointValueTarget(joint_group_positions1);
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
		Marker_pose.pose.position.x = c[0][0]-0.1876;
		Marker_pose.pose.position.y = c[1][0];
		Marker_pose.pose.position.z = c[2][0]+0.005;
		//cout<<Marker_pose<<endl;

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
			cout<<"到达门把手"<<endl;
			system("play /home/qq44642754/音乐/到达门把手.wav");
		sleep(1);

		//开门的第一个位置
		system("play /home/qq44642754/音乐/准备开门.wav");
		cout<<"准备开门"<<endl;
		/*double targetPose1[6] = {(54.7/180.0)*M_PI, (11.3/180.0)*M_PI, (-64.2/180.0)*M_PI, (0.0/180.0)*M_PI, (52.8/180.0)*M_PI, (54.8/180.0)*M_PI};
		std::vector<double> joint_group_positions1(6);
		joint_group_positions1[0] = targetPose1[0];
		joint_group_positions1[1] = targetPose1[1];
		joint_group_positions1[2] = targetPose1[2];
		joint_group_positions1[3] = targetPose1[3];
		joint_group_positions1[4] = targetPose1[4];
		joint_group_positions1[5] = targetPose1[5];
		
		//开门的第二个位置
		double targetPose2[6] = {(53.9/180.0)*M_PI, (49.5/180.0)*M_PI, (-123.3/180.0)*M_PI, (0.0/180.0)*M_PI, (73.8/180.0)*M_PI, (53.9/180.0)*M_PI};
		std::vector<double> joint_group_positions2(6);
		joint_group_positions2[0] = targetPose2[0];
		joint_group_positions2[1] = targetPose2[1];
		joint_group_positions2[2] = targetPose2[2];
		joint_group_positions2[3] = targetPose2[3];
		joint_group_positions2[4] = targetPose2[4];
		joint_group_positions2[5] = targetPose2[5];
	
		arm.setJointValueTarget(joint_group_positions1);
		arm.move();
		arm.setJointValueTarget(joint_group_positions2);
		arm.move();
		system("play /home/qq44642754/音乐/开门完成.wav");
		cout<<"开门完成"<<endl;
		sleep(1);*/

		// 获取机器人的起始位置
		moveit::core::RobotStatePtr start_state(arm.getCurrentState());
		const robot_state::JointModelGroup *joint_model_group = start_state->getJointModelGroup(arm.getName());

		std::vector<double> joint_group_positions;
		std::vector<double> joint_group_positions2;  //存储开门的第一个点 
		start_state->copyJointGroupPositions(joint_model_group, joint_group_positions);

		//设置第一个目标点
		joint_group_positions[0] = (54.7/180.0)*M_PI;  // radians
		joint_group_positions[1] = (11.3/180.0)*M_PI;
		joint_group_positions[2] = (-64.2/180.0)*M_PI;
		joint_group_positions[3] = (0.0/180.0)*M_PI;
		joint_group_positions[4] =  (52.8/180.0)*M_PI;
		joint_group_positions[5] = (54.8/180.0)*M_PI;
		arm.setJointValueTarget(joint_group_positions);
		joint_group_positions2 = joint_group_positions;
		// 计算第一条轨迹
		moveit::planning_interface::MoveGroupInterface::Plan plan1;
		success = arm.plan(plan1);

		joint_model_group = start_state->getJointModelGroup(arm.getName());    
		start_state->setJointGroupPositions(joint_model_group, joint_group_positions);
		arm.setStartState(*start_state);

		//设置第二个目标点
    		joint_group_positions[0] = (53.9/180.0)*M_PI;  // radians
    		joint_group_positions[1] = (49.5/180.0)*M_PI;
    		joint_group_positions[2] = (-123.3/180.0)*M_PI;
    		joint_group_positions[3] = (0.0/180.0)*M_PI;
    		joint_group_positions[4] = (73.8/180.0)*M_PI;
    		joint_group_positions[5] = (53.9/180.0)*M_PI;
    		arm.setJointValueTarget(joint_group_positions);

    		// 计算第二条轨迹
    		moveit::planning_interface::MoveGroupInterface::Plan plan2;
    		success = arm.plan(plan2);

    		//连接两条轨迹
    		moveit_msgs::RobotTrajectory trajectory;

    		trajectory.joint_trajectory.joint_names = plan1.trajectory_.joint_trajectory.joint_names;
    		trajectory.joint_trajectory.points = plan1.trajectory_.joint_trajectory.points;
    		for (size_t j = 1; j < plan2.trajectory_.joint_trajectory.points.size(); j++)
    		{
    		    trajectory.joint_trajectory.points.push_back(plan2.trajectory_.joint_trajectory.points[j]);
    		}

    		moveit::planning_interface::MoveGroupInterface::Plan joinedPlan;
    		robot_trajectory::RobotTrajectory rt(arm.getCurrentState()->getRobotModel(), "xarm6");
    		rt.setRobotTrajectoryMsg(*arm.getCurrentState(), trajectory);
    		trajectory_processing::IterativeParabolicTimeParameterization iptp;
    		iptp.computeTimeStamps(rt, 0.2, 0.2);

    		rt.getRobotTrajectoryMsg(trajectory);
    		joinedPlan.trajectory_ = trajectory;

    		if (!arm.execute(joinedPlan))
    		{
    		    ROS_ERROR("Failed to execute plan");
    		    return false;
    		}

		sleep(1);
		system("play /home/qq44642754/音乐/开门完成.wav");
		cout<<"开门完成"<<endl;

		//回到预备状态
		arm.setJointValueTarget(joint_group_positions2);
		arm.move();
		
		system("play /home/qq44642754/音乐/准备回到初始状态.wav");
		cout<<"回到预备状态"<<endl;
		sleep(1);
		count += 1;

	}

	// 控制机械臂先回到初始化位置
	arm.setNamedTarget("home");
	arm.move();
	sleep(1);
	system("play /home/qq44642754/音乐/回到初始状态.wav");
	cout<<"回到初始状态"<<endl;	

	ros::shutdown(); 

	return 0;
}
