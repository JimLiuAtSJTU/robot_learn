/**********************
coordinate_map.cpp
author: wxw and Zhitao zheng 
email: qq44642754@gmail.com
time: 2021.02.07
**********************/

#include <iostream>
#include <string>
#include <opencv2/opencv.hpp>
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <geometry_msgs/PointStamped.h>
#include <image_transport/image_transport.h>
#include <sensor_msgs/CameraInfo.h>
#include <sensor_msgs/Image.h>
#include "ar_track_alvar/Marker.h"
#include <geometry_msgs/PoseStamped.h>
#include "darknet_ros_msgs/BoundingBoxes.h"

using namespace cv;
using namespace std;
class ImageConverter {
private:
	ros::NodeHandle			nh_;
	image_transport::ImageTransport it_;
	image_transport::Subscriber	image_sub_color;//接收彩色图像
	image_transport::Subscriber	image_sub_depth;//接收深度图像
	geometry_msgs::PoseStamped Marker_pose;
	ros::Subscriber camera_info_sub_;//接收深度图像对应的相机参数话题
	ros::Publisher	arm_point_pub_;//发布一个三维坐标点，可用于可视化

	sensor_msgs::CameraInfo		camera_info;
	geometry_msgs::PointStamped	output_point;

	/* Mat depthImage,colorImage; */
	Mat	colorImage;
	Mat	depthImage	= Mat::zeros( 720, 1280, CV_16UC1 );//注意这里要修改为你接收的深度图像尺寸
	Point	mousepos	= Point( 0, 0 );        /* mousepoint to be map */

public:

	//获取鼠标的坐标，通过param指针传出到类成员Point mousepos
	ros::Subscriber pose_sub = nh_.subscribe("/visualization_marker", 10, &ImageConverter::poseCallback, this);
	ros::Subscriber Object_sub = nh_.subscribe("/darknet_ros/bounding_boxes", 10 ,&ImageConverter::ObjectCallback,this);

	ImageConverter() : it_( nh_ )
	{
    //topic sub:	

		image_sub_depth = it_.subscribe( "/camera/aligned_depth_to_color/image_raw",
						 1, &ImageConverter::imageDepthCb, this );
		image_sub_color = it_.subscribe( "/camera/color/image_raw", 1,
						 &ImageConverter::imageColorCb, this );
		camera_info_sub_ =
			nh_.subscribe( "/camera/aligned_depth_to_color/camera_info", 1,
				       &ImageConverter::cameraInfoCb, this );
    
    //topic pub:
		arm_point_pub_ =
			nh_.advertise<geometry_msgs::PointStamped>( "/mouse_point", 10 );

		cv::namedWindow( "colorImage" );
		//setMouseCallback( "colorImage", &ImageConverter::on_mouse,
		//		  (void *) &mousepos );
	}


	~ImageConverter()
	{
		cv::destroyWindow( "colorImage" );
	}
	
	
	void poseCallback(const visualization_msgs::Marker &marker_tmp)
	{	
		Marker_pose.header = marker_tmp.header;
		Marker_pose.pose.position = marker_tmp.pose.position;

	}
	
	void ObjectCallback(const darknet_ros_msgs::BoundingBoxes &object_tmp)
	{
		Marker_pose.pose.position.x = (object_tmp.bounding_boxes[0].xmin + object_tmp.bounding_boxes[0].xmax)/2;
		Marker_pose.pose.position.y = (object_tmp.bounding_boxes[0].ymin + object_tmp.bounding_boxes[0].ymax)/2;
	}

	void cameraInfoCb( const sensor_msgs::CameraInfo &msg )
	{
		camera_info = msg;
	}


	void imageDepthCb( const sensor_msgs::ImageConstPtr &msg )
	{
		cv_bridge::CvImagePtr cv_ptr;

		try {
			cv_ptr =
				cv_bridge::toCvCopy( msg, sensor_msgs::image_encodings::TYPE_16UC1 );
			depthImage = cv_ptr->image;
		} catch ( cv_bridge::Exception &e ) {
			ROS_ERROR( "cv_bridge exception: %s", e.what() );
			return;
		}
	}


	void imageColorCb( const sensor_msgs::ImageConstPtr &msg )
	{
		cv_bridge::CvImagePtr cv_ptr;
		try {
			cv_ptr		= cv_bridge::toCvCopy( msg, sensor_msgs::image_encodings::BGR8 );
			colorImage	= cv_ptr->image;
		} catch ( cv_bridge::Exception &e ) {
			ROS_ERROR( "cv_bridge exception: %s", e.what() );
			return;
		}
		
		//先查询对齐的深度图像的深度信息，根据读取的camera info内参矩阵求解对应三维坐标
		mousepos.x = Marker_pose.pose.position.x;
		//cout<<mousepos.x<<endl;		
		mousepos.y = Marker_pose.pose.position.y;
		float	real_z	= 0.001 * depthImage.at<u_int16_t>( mousepos.y, mousepos.x );
		float	real_x	=
			(mousepos.x - camera_info.K.at( 2 ) ) / camera_info.K.at( 0 ) * real_z;
		float real_y =
			(mousepos.y - camera_info.K.at( 5 ) ) / camera_info.K.at( 4 ) * real_z;

		char tam[100];
		sprintf( tam, "(%0.2f,%0.2f,%0.2f)", real_x, real_y, real_z );
		putText( colorImage, tam, mousepos, FONT_HERSHEY_SIMPLEX, 0.6,
			 cvScalar( 0, 0, 255 ), 1 );//打印到屏幕上
		circle( colorImage, mousepos, 2, Scalar( 255, 0, 0 ) );
		output_point.header.frame_id	= "/camera_depth_optical_frame";
		output_point.header.stamp	= ros::Time::now();
		output_point.point.x		= real_x;
		output_point.point.y		= real_y;
		output_point.point.z		= real_z;
		arm_point_pub_.publish( output_point );
		cv::imshow( "colorImage", colorImage );
		cv::waitKey( 1 );
	}
};

int main( int argc, char **argv )
{
	ros::init( argc, argv, "coordinate_map" );
	int a = 400;
	int b = 500;
	ImageConverter imageconverter;
	ros::spin();
	return(0);
}


