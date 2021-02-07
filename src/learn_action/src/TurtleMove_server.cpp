/*  
　　　此程序通过通过动作编程实现由client发布一个目标位置
　　　然后控制Turtle运动到目标位置的过程
 */
#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include "learn_action/TurtleMoveAction.h"
#include <turtlesim/Pose.h> 
#include <turtlesim/Spawn.h>
#include <geometry_msgs/Twist.h>
 
typedef actionlib::SimpleActionServer<learn_action::TurtleMoveAction> Server;
 
struct Myturtle
{
    float x;
    float y;
    float theta;
}turtle_original_pose,turtle_target_pose;
 
ros::Publisher turtle_vel;
 
void posecallback(const turtlesim::PoseConstPtr& msg) 
{ 
  //ROS_INFO("Turtle1_position:(%f,%f,%f)",msg->x,msg->y,msg->theta);
  turtle_original_pose.x=msg->x; 
  turtle_original_pose.y=msg->y;
  turtle_original_pose.theta=msg->theta;
 }
 
// 收到action的goal后调用该回调函数
void execute(const learn_action::TurtleMoveGoalConstPtr& goal, Server* as)
{
    learn_action::TurtleMoveFeedback feedback;
 
    ROS_INFO("TurtleMove is working.");
    turtle_target_pose.x=goal->turtle_target_x;
    turtle_target_pose.y=goal->turtle_target_y; 
    turtle_target_pose.theta=goal->turtle_target_theta;
    
    geometry_msgs::Twist vel_msgs;
    float break_flag;
    
    while(ros::ok())
    {  
        ros::Rate r(10);
        
        vel_msgs.angular.z = 0.1 * (atan2(turtle_target_pose.y-turtle_original_pose.y,
                                   turtle_target_pose.x-turtle_original_pose.x)-turtle_original_pose.theta);

        double angle_to_goal = atan2(turtle_target_pose.y-turtle_original_pose.y,turtle_target_pose.x-turtle_original_pose.x);
        ROS_INFO("angle_to_goal= %f, current_angle = %f", angle_to_goal, turtle_original_pose.theta);

        vel_msgs.linear.x = 0.0125 * sqrt(pow(turtle_target_pose.x-turtle_original_pose.x, 2) +
                                      pow(turtle_target_pose.y-turtle_original_pose.y, 2)); 
        break_flag=sqrt(pow(turtle_target_pose.x-turtle_original_pose.x, 2) +
                                        pow(turtle_target_pose.y-turtle_original_pose.y, 2));
        turtle_vel.publish(vel_msgs);
 
        feedback.present_turtle_x=turtle_original_pose.x;
        feedback.present_turtle_y=turtle_original_pose.y;
        feedback.present_turtle_theta=turtle_original_pose.theta;
        as->publishFeedback(feedback);
        ROS_INFO("break_flag=%f",break_flag);
        if(break_flag<0.1) break;
        r.sleep();
    }
        // 当action完成后，向客户端返回结果
        ROS_INFO("TurtleMove is finished.");
        as->setSucceeded();
}
 
int main(int argc, char** argv)
{
    ros::init(argc, argv, "TurtleMove_server");
    ros::NodeHandle n,turtle_node;
    ros::Subscriber sub = turtle_node.subscribe("turtle1/pose",10,&posecallback); //订阅小乌龟的位置信息
    turtle_vel = turtle_node.advertise<geometry_msgs::Twist>("turtle1/cmd_vel",10);//发布控制小乌龟运动的速度
    // 定义一个服务器
        Server server(n, "TurtleMove", boost::bind(&execute, _1, &server), false);
        // 服务器开始运行
        server.start();
        ROS_INFO("server has started.");
    ros::spin();
 
    return 0;
}
