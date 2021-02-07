#include <iostream>
#include <ros/ros.h>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>

using namespace std;
geometry_msgs::PoseStamped Marker_pose;

//接收到订阅信息后，会进入消息回调函数

void poseCallback(const visualization_msgs::Marker &marker_tmp)
{
        Marker_pose.header = marker_tmp.header;
        Marker_pose.pose.position = marker_tmp.pose.position;
        Marker_pose.pose.orientation.x = 1.0;
        Marker_pose.pose.orientation.y = 0.0;
        Marker_pose.pose.orientation.z = 0.0;
        Marker_pose.pose.orientation.w = 0.0;

}

int main (int argc, char **argv)
{

	ros::init(argc,argv,"pose_subscriber");
	ros::NodeHandle n;
	ros::Subscriber pose_sub = n.subscribe("/visualization_marker", 10, poseCallback);

	cout<<Marker_pose.pose.orientation<<endl;
	ros::shutdown();
	return 0;
}
