#include <actionlib/client/simple_action_client.h>
#include "learn_action/TurtleMoveAction.h"
#include <turtlesim/Pose.h> 
#include <turtlesim/Spawn.h>
#include <geometry_msgs/Twist.h>
#include <iostream>

using namespace std;
 
typedef actionlib::SimpleActionClient<learn_action::TurtleMoveAction> Client;
 
struct Myturtle
{
    float x;
    float y;
    float theta;
}turtle_present_pose, turtle_current_pose;
 
// 当action完成后会调用该回调函数一次
void doneCb(const actionlib::SimpleClientGoalState& state,
        const learn_action::TurtleMoveResultConstPtr& result)
{
    ROS_INFO("Yay! The TurtleMove is finished!");
    ros::shutdown();
}

void posecallback(const turtlesim::PoseConstPtr& msg) 
{ 
    ROS_INFO("Turtle1_position:(%f,%f,%f)",msg->x,msg->y,msg->theta);
    turtle_current_pose.x=msg->x; 
    turtle_current_pose.y=msg->y;
    turtle_current_pose.theta=msg->theta;
  
 }
 
// 当action激活后会调用该回调函数一次
void activeCb()
{
    ROS_INFO("Goal just went active");
}
 
// 收到feedback后调用该回调函数
void feedbackCb(const learn_action::TurtleMoveFeedbackConstPtr& feedback)
{
   // ROS_INFO(" present_pose : %f  %f  %f", feedback->present_turtle_x,feedback->present_turtle_y,feedback->present_turtle_theta);
}
 
int main(int argc, char** argv)
{
    ros::init(argc, argv, "TurtleMove_client");
 
    // 定义一个客户端
    Client client("TurtleMove", true);
 
    ros::NodeHandle n;

    // 等待服务器端
    ROS_INFO("Waiting for action server to start.");
    client.waitForServer();
    ROS_INFO("Action server started, sending goal.");
    ros::Subscriber sub = n.subscribe("turtle1/pose",10,&posecallback); //订阅小乌龟的位置信息
    sleep(2);
    // 创建一个action的goal
    int count = 1;
    while (count < 50 )
    {
	    learn_action::TurtleMoveGoal goal;
	    ROS_INFO("x = %f", turtle_current_pose.x);
   	    goal.turtle_target_x = turtle_current_pose.x + 0.1;
   	    goal.turtle_target_y = turtle_current_pose.y + 0.1;
    	    goal.turtle_target_theta = 0.0;
  	    client.sendGoal(goal,  &doneCb, &activeCb, &feedbackCb);
	    count += 1;
   	    sleep(2);

    }

    ROS_INFO("%f", count);
    /*double th = 0.0;
    double radius = 1.0 ;
	
    for (double th = -1.57; th < 4.71; th = th + 0.1)
    {
	goal.turtle_target_x = 5.0 + radius * cos(th);
	goal.turtle_target_y = 5.0 + radius * sin(th);
	goal.turtle_target_theta = th;
	client.sendGoal(goal,  &doneCb, &activeCb, &feedbackCb);
	sleep(1);
    }
  */
 
    ros::spin();
 
    return 0;
}
