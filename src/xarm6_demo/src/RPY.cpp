#include <iostream>
 
#include <Eigen/Core>
#include <Eigen/Geometry>
 
using namespace std;
 
#define PI (3.1415926535897932346f)
 
int main(int argc, char **argv) 
{
    /**** 1. 旋转向量 ****/
    cout << endl << "********** AngleAxis **********" << endl;
    //1.0 初始化旋转向量,沿Z轴旋转45度的旋转向量
    Eigen::AngleAxisd rotation_vector1 (M_PI/4, Eigen::Vector3d(0, 0, 1)); 
    //cout<<rotation_vector1<<endl;
 
    //1.1 旋转向量转换为旋转矩阵
    //旋转向量用matrix()转换成旋转矩阵
    Eigen::Matrix3d rotation_matrix1 = Eigen::Matrix3d::Identity();
    rotation_matrix1 = rotation_vector1.matrix();
    cout << "rotation matrix1 =\n" << rotation_matrix1 << endl;                
    //或者由罗德里格公式进行转换
    rotation_matrix1 = rotation_vector1.toRotationMatrix();
    cout << "rotation matrix1 =\n" << rotation_matrix1 << endl; 
 
    /*1.2 旋转向量转换为欧拉角*/
    //将旋转向量转换为旋转矩阵,再由旋转矩阵转换为欧拉角,详见旋转矩阵转换为欧拉角
    Eigen::Vector3d eulerAngle1 = rotation_vector1.matrix().eulerAngles(2,1,0);
    cout << "eulerAngle1, z y x: " << eulerAngle1 << endl;
 
    /*1.3 旋转向量转四元数*/
    Eigen::Quaterniond quaternion1(rotation_vector1);
    //或者
    Eigen::Quaterniond quaternion1_1;
    quaternion1_1 = rotation_vector1;
    cout << "quaternion1 x: " << quaternion1.x() << endl;
    cout << "quaternion1 y: " << quaternion1.y() << endl;
    cout << "quaternion1 z: " << quaternion1.z() << endl;
    cout << "quaternion1 w: " << quaternion1.w() << endl;
    
    cout << "quaternion1_1 x: " << quaternion1_1.x() << endl;
    cout << "quaternion1_1 y: " << quaternion1_1.y() << endl;
    cout << "quaternion1_1 z: " << quaternion1_1.z() << endl;
    cout << "quaternion1_1 w: " << quaternion1_1.w() << endl;
 
 
    /**** 2. 旋转矩阵 *****/
    cout << endl << "********** RotationMatrix **********" << endl;
    //2.0 旋转矩阵初始化
    Eigen::Matrix3d rotation_matrix2;
    rotation_matrix2 << 0.707107, -0.707107, 0, 0.707107, 0.707107, 0, 0, 0, 1;
;
    //或直接单位矩阵初始化
    Eigen::Matrix3d rotation_matrix2_1 = Eigen::Matrix3d::Identity();
 
    //2.1 旋转矩阵转换为欧拉角
    //ZYX顺序，即先绕x轴roll,再绕y轴pitch,最后绕z轴yaw,0表示X轴,1表示Y轴,2表示Z轴
    Eigen::Vector3d euler_angles = rotation_matrix2.eulerAngles(2, 1, 0); 
    cout << "yaw(z) pitch(y) roll(x) = " << euler_angles.transpose() << endl;
 
    //2.2 旋转矩阵转换为旋转向量
    Eigen::AngleAxisd rotation_vector2;
    rotation_vector2.fromRotationMatrix(rotation_matrix2);
    //或者
    Eigen::AngleAxisd rotation_vector2_1(rotation_matrix2);
    cout << "rotation_vector2 " << "angle is: " << rotation_vector2.angle() * (180 / M_PI) 
                                << " axis is: " << rotation_vector2.axis().transpose() << endl;
 
    cout << "rotation_vector2_1 " << "angle is: " << rotation_vector2_1.angle() * (180 / M_PI) 
                                  << " axis is: " << rotation_vector2_1.axis().transpose() << endl;
 
    //2.3 旋转矩阵转换为四元数
    Eigen::Quaterniond quaternion2(rotation_matrix2);
    //或者
    Eigen::Quaterniond quaternion2_1;
    quaternion2_1 = rotation_matrix2;
    cout << "quaternion2 x: " << quaternion2.x() << endl;
    cout << "quaternion2 y: " << quaternion2.y() << endl;
    cout << "quaternion2 z: " << quaternion2.z() << endl;
    cout << "quaternion2 w: " << quaternion2.w() << endl;
    
    cout << "quaternion2_1 x: " << quaternion2_1.x() << endl;
    cout << "quaternion2_1 y: " << quaternion2_1.y() << endl;
    cout << "quaternion2_1 z: " << quaternion2_1.z() << endl;
    cout << "quaternion2_1 w: " << quaternion2_1.w() << endl;
 
 
    /**** 3. 欧拉角 ****/
    cout << endl << "********** EulerAngle **********" << endl;
    //3.0 初始化欧拉角(Z-Y-X，即RPY, 先绕x轴roll,再绕y轴pitch,最后绕z轴yaw)
    Eigen::Vector3d ea(89.5/180.0*M_PI, 23.9/180.0*M_PI, 90.1/180.0*M_PI);
 
    //3.1 欧拉角转换为旋转矩阵

    ea[0] = 0.0/180.0*M_PI,
    ea[1] = 0.0/180.0*M_PI;
    ea[2] = 180.0/180.0*M_PI;	
    Eigen::Matrix3d rotation_matrix3;
    cout<<"------------------------------------------------------------------------------"<<endl;
    rotation_matrix3 = Eigen::AngleAxisd(ea[0], Eigen::Vector3d::UnitZ()) * 
                       Eigen::AngleAxisd(ea[1], Eigen::Vector3d::UnitY()) * 
                       Eigen::AngleAxisd(ea[2], Eigen::Vector3d::UnitX());
    //cout << "rotation matrix3 =\n" << rotation_matrix3 << endl;

    Eigen::Matrix3d mat;
    mat << rotation_matrix3(0,0), rotation_matrix3(0,1), rotation_matrix3(0,2), 
	rotation_matrix3(1,0), rotation_matrix3(1,1), rotation_matrix3(1,2), 
	rotation_matrix3(2,0), rotation_matrix3(2,1), rotation_matrix3(2,2);
    cout << mat << endl;
    /*mat.conservativeResize(mat.rows(), mat.cols()+1);
    Eigen::Vector3d vec;
    vec<< 0.0, 0.0, 0.0;
    mat.col(mat.cols()-1) = vec;*/
    cout << "rotation matrix3 =\n" << rotation_matrix3 << endl;
 
    //3.2 欧拉角转换为四元数,
    Eigen::Quaterniond quaternion3;
    quaternion3 = Eigen::AngleAxisd(ea[0], Eigen::Vector3d::UnitZ()) * 
                  Eigen::AngleAxisd(ea[1], Eigen::Vector3d::UnitY()) * 
                  Eigen::AngleAxisd(ea[2], Eigen::Vector3d::UnitX());
    cout << "quaternion3 x: " << quaternion3.x() << endl;
    cout << "quaternion3 y: " << quaternion3.y() << endl;
    cout << "quaternion3 z: " << quaternion3.z() << endl;
    cout << "quaternion3 w: " << quaternion3.w() << endl;
    cout<<"----------------------------------------"<<ea[1]<<endl;
 
    //3.3 欧拉角转换为旋转向量
    Eigen::AngleAxisd rotation_vector3;
    rotation_vector3 = Eigen::AngleAxisd(ea[0], Eigen::Vector3d::UnitZ()) * 
                       Eigen::AngleAxisd(ea[1], Eigen::Vector3d::UnitY()) * 
                       Eigen::AngleAxisd(ea[2], Eigen::Vector3d::UnitX());  
    cout << "rotation_vector3 " << "angle is: " << rotation_vector3.angle() * (180 / M_PI) 
                                << " axis is: " << rotation_vector3.axis().transpose() << endl;
 
 
    /**** 4.四元数 ****/
    cout << endl << "********** Quaternion **********" << endl;
    //4.0 初始化四元数,注意eigen Quaterniond类四元数初始化参数顺序为w,x,y,z
    Eigen::Quaterniond quaternion4( 0.55507  ,  0.4245, 0.511699, -0.499862);
 
    //4.1 四元数转换为旋转向量
    Eigen::AngleAxisd rotation_vector4(quaternion4);
    //或者
    Eigen::AngleAxisd rotation_vector4_1;
    rotation_vector4_1 = quaternion4;
    cout << "rotation_vector4 " << "angle is: " << rotation_vector4.angle() * (180 / M_PI) 
                                << " axis is: " << rotation_vector4.axis().transpose() << endl;
 
    cout << "rotation_vector4_1 " << "angle is: " << rotation_vector4_1.angle() * (180 / M_PI) 
                                  << " axis is: " << rotation_vector4_1.axis().transpose() << endl;
 
    //4.2 四元数转换为旋转矩阵
    Eigen::Matrix3d rotation_matrix4;
    rotation_matrix4 = quaternion4.matrix();
    Eigen::Matrix3d rotation_matrix4_1;
    rotation_matrix4_1 = quaternion4.toRotationMatrix();
    cout << "rotation matrix4 =\n" << rotation_matrix4 << endl;
    cout << "rotation matrix4_1 =\n" << rotation_matrix4_1 << endl;      
 
 
    //4.4 四元数转欧拉角(Z-Y-X，即RPY)
    Eigen::Vector3d eulerAngle4 = quaternion4.matrix().eulerAngles(2,1,0);
    cout << "yaw(z) pitch(y) roll(x) = " << eulerAngle4.transpose() << endl;

 
 
    return 0;
}
