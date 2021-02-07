/***********************************************************************
Copyright 2019 Wuhan PS-Micro Technology Co., Itd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
***********************************************************************/

#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_trajectory/robot_trajectory.h>
#include <moveit/trajectory_processing/iterative_time_parameterization.h>
#include <moveit_msgs/OrientationConstraint.h>
#include <math.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "moveit_revise_trajectory_demo");
    ros::NodeHandle node_handle; 
    ros::AsyncSpinner spinner(1);
    spinner.start();

    moveit::planning_interface::MoveGroupInterface arm("xarm6");

    arm.setGoalJointTolerance(0.001);

    double accScale = 0.1;
    double velScale = 0.1;
    arm.setMaxAccelerationScalingFactor(accScale);
    arm.setMaxVelocityScalingFactor(velScale);

    // 控制机械臂先回到初始化位置
    arm.setNamedTarget("home");
    arm.move();
    sleep(1);

    // 获取机器人的起始位置
    moveit::core::RobotStatePtr start_state(arm.getCurrentState());
    const robot_state::JointModelGroup *joint_model_group = start_state->getJointModelGroup(arm.getName());

    std::vector<double> joint_group_positions;
    start_state->copyJointGroupPositions(joint_model_group, joint_group_positions);

    //设置第一个目标点
    joint_group_positions[0] = (54.7/180.0)*M_PI;  // radians
    joint_group_positions[1] = (11.3/180.0)*M_PI;
    joint_group_positions[2] = (-64.2/180.0)*M_PI;
    joint_group_positions[3] = (0.0/180.0)*M_PI;
    joint_group_positions[4] =  (52.8/180.0)*M_PI;
    joint_group_positions[5] = (54.8/180.0)*M_PI;
    arm.setJointValueTarget(joint_group_positions);

    // 计算第一条轨迹
    moveit::planning_interface::MoveGroupInterface::Plan plan1;
    moveit::planning_interface::MoveItErrorCode success = arm.plan(plan1);

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
    iptp.computeTimeStamps(rt, velScale, accScale);

    rt.getRobotTrajectoryMsg(trajectory);
    joinedPlan.trajectory_ = trajectory;

    if (!arm.execute(joinedPlan))
    {
        ROS_ERROR("Failed to execute plan");
        return false;
    }

    sleep(1);

    ROS_INFO("Finished");

    // 控制机械臂先回到初始化位置
    arm.setNamedTarget("home");
    arm.move();
    sleep(1);

    ros::shutdown(); 

    return 0;
}
