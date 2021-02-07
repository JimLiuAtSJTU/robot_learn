; Auto-generated. Do not edit!


(cl:in-package xarm_msgs-srv)


;//! \htmlinclude GripperState-request.msg.html

(cl:defclass <GripperState-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GripperState-request (<GripperState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xarm_msgs-srv:<GripperState-request> is deprecated: use xarm_msgs-srv:GripperState-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperState-request>) ostream)
  "Serializes a message object of type '<GripperState-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperState-request>) istream)
  "Deserializes a message object of type '<GripperState-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperState-request>)))
  "Returns string type for a service object of type '<GripperState-request>"
  "xarm_msgs/GripperStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperState-request)))
  "Returns string type for a service object of type 'GripperState-request"
  "xarm_msgs/GripperStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperState-request>)))
  "Returns md5sum for a message object of type '<GripperState-request>"
  "ee93247e08e7d91618c792d4812f0e03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperState-request)))
  "Returns md5sum for a message object of type 'GripperState-request"
  "ee93247e08e7d91618c792d4812f0e03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperState-request>)))
  "Returns full string definition for message of type '<GripperState-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperState-request)))
  "Returns full string definition for message of type 'GripperState-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperState-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperState-request
))
;//! \htmlinclude GripperState-response.msg.html

(cl:defclass <GripperState-response> (roslisp-msg-protocol:ros-message)
  ((curr_pos
    :reader curr_pos
    :initarg :curr_pos
    :type cl:float
    :initform 0.0)
   (err_code
    :reader err_code
    :initarg :err_code
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GripperState-response (<GripperState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xarm_msgs-srv:<GripperState-response> is deprecated: use xarm_msgs-srv:GripperState-response instead.")))

(cl:ensure-generic-function 'curr_pos-val :lambda-list '(m))
(cl:defmethod curr_pos-val ((m <GripperState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xarm_msgs-srv:curr_pos-val is deprecated.  Use xarm_msgs-srv:curr_pos instead.")
  (curr_pos m))

(cl:ensure-generic-function 'err_code-val :lambda-list '(m))
(cl:defmethod err_code-val ((m <GripperState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xarm_msgs-srv:err_code-val is deprecated.  Use xarm_msgs-srv:err_code instead.")
  (err_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperState-response>) ostream)
  "Serializes a message object of type '<GripperState-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'curr_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'err_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperState-response>) istream)
  "Deserializes a message object of type '<GripperState-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'curr_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_code) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperState-response>)))
  "Returns string type for a service object of type '<GripperState-response>"
  "xarm_msgs/GripperStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperState-response)))
  "Returns string type for a service object of type 'GripperState-response"
  "xarm_msgs/GripperStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperState-response>)))
  "Returns md5sum for a message object of type '<GripperState-response>"
  "ee93247e08e7d91618c792d4812f0e03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperState-response)))
  "Returns md5sum for a message object of type 'GripperState-response"
  "ee93247e08e7d91618c792d4812f0e03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperState-response>)))
  "Returns full string definition for message of type '<GripperState-response>"
  (cl:format cl:nil "~%float32 curr_pos~%int16 err_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperState-response)))
  "Returns full string definition for message of type 'GripperState-response"
  (cl:format cl:nil "~%float32 curr_pos~%int16 err_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperState-response>))
  (cl:+ 0
     4
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperState-response
    (cl:cons ':curr_pos (curr_pos msg))
    (cl:cons ':err_code (err_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GripperState)))
  'GripperState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GripperState)))
  'GripperState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperState)))
  "Returns string type for a service object of type '<GripperState>"
  "xarm_msgs/GripperState")