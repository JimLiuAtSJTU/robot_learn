; Auto-generated. Do not edit!


(cl:in-package learn_action-msg)


;//! \htmlinclude TurtleMoveFeedback.msg.html

(cl:defclass <TurtleMoveFeedback> (roslisp-msg-protocol:ros-message)
  ((present_turtle_x
    :reader present_turtle_x
    :initarg :present_turtle_x
    :type cl:float
    :initform 0.0)
   (present_turtle_y
    :reader present_turtle_y
    :initarg :present_turtle_y
    :type cl:float
    :initform 0.0)
   (present_turtle_theta
    :reader present_turtle_theta
    :initarg :present_turtle_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurtleMoveFeedback (<TurtleMoveFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleMoveFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleMoveFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learn_action-msg:<TurtleMoveFeedback> is deprecated: use learn_action-msg:TurtleMoveFeedback instead.")))

(cl:ensure-generic-function 'present_turtle_x-val :lambda-list '(m))
(cl:defmethod present_turtle_x-val ((m <TurtleMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:present_turtle_x-val is deprecated.  Use learn_action-msg:present_turtle_x instead.")
  (present_turtle_x m))

(cl:ensure-generic-function 'present_turtle_y-val :lambda-list '(m))
(cl:defmethod present_turtle_y-val ((m <TurtleMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:present_turtle_y-val is deprecated.  Use learn_action-msg:present_turtle_y instead.")
  (present_turtle_y m))

(cl:ensure-generic-function 'present_turtle_theta-val :lambda-list '(m))
(cl:defmethod present_turtle_theta-val ((m <TurtleMoveFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:present_turtle_theta-val is deprecated.  Use learn_action-msg:present_turtle_theta instead.")
  (present_turtle_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleMoveFeedback>) ostream)
  "Serializes a message object of type '<TurtleMoveFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'present_turtle_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'present_turtle_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'present_turtle_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleMoveFeedback>) istream)
  "Deserializes a message object of type '<TurtleMoveFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'present_turtle_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'present_turtle_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'present_turtle_theta) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleMoveFeedback>)))
  "Returns string type for a message object of type '<TurtleMoveFeedback>"
  "learn_action/TurtleMoveFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleMoveFeedback)))
  "Returns string type for a message object of type 'TurtleMoveFeedback"
  "learn_action/TurtleMoveFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleMoveFeedback>)))
  "Returns md5sum for a message object of type '<TurtleMoveFeedback>"
  "4d26027f0f230cc5b61fa6b93405965c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleMoveFeedback)))
  "Returns md5sum for a message object of type 'TurtleMoveFeedback"
  "4d26027f0f230cc5b61fa6b93405965c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleMoveFeedback>)))
  "Returns full string definition for message of type '<TurtleMoveFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float64 present_turtle_x~%float64 present_turtle_y~%float64 present_turtle_theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleMoveFeedback)))
  "Returns full string definition for message of type 'TurtleMoveFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%float64 present_turtle_x~%float64 present_turtle_y~%float64 present_turtle_theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleMoveFeedback>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleMoveFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleMoveFeedback
    (cl:cons ':present_turtle_x (present_turtle_x msg))
    (cl:cons ':present_turtle_y (present_turtle_y msg))
    (cl:cons ':present_turtle_theta (present_turtle_theta msg))
))
