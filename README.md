# Fitgreat
Robot door open, object detector, Marker tracking, robot move

该程序文件一共有三个部分

1. 机器视觉部分
该部分一共走三个功能包
  - ar_track_alvar
  - realsense-ros
  - darknet_ros
  
ar_track_alvar 是通过realsense来识别ar标签。能进行物体位置的定位
realsense_ros  是realsen的功能宝
darknet_ros 能够通过自己训练出来的weights来对物体进行识别

2. 底盘部分
该部分有一个功能包
- learn_action 他能够控制小乌龟运动到指定的位置

3. 机械臂部分
该部分有两个功能包
- xarm_ros
-xarm6_demo

xarm_ros 是猎户星空厂家提供的SDK 里面包含有机械臂的URDF模型，Gazebo的仿真模型等
xarm6_demo 中 moveit_circle_demo, moveit_continue_trajectory, moveit_it_demo 是机械臂基础运动的代码
                                   grasping_demo 是基于二维码定位的机械臂开门代码。
                                   yolov3_location 是物体的识别和定位。通过yolov3 所返回的像素坐标转化到物体相对于相机的实际坐标
                                  
 这是我三个月机器人从零开始的学习过程。如需帮助请联系ztzheng@fitgreat.cn



