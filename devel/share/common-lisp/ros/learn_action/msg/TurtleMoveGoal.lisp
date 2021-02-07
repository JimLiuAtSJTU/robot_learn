; Auto-generated. Do not edit!


(cl:in-package learn_action-msg)


;//! \htmlinclude TurtleMoveGoal.msg.html

(cl:defclass <TurtleMoveGoal> (roslisp-msg-protocol:ros-message)
  ((turtle_target_x
    :reader turtle_target_x
    :initarg :turtle_target_x
    :type cl:float
    :initform 0.0)
   (turtle_target_y
    :reader turtle_target_y
    :initarg :turtle_target_y
    :type cl:float
    :initform 0.0)
   (turtle_target_theta
    :reader turtle_target_theta
    :initarg :turtle_target_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurtleMoveGoal (<TurtleMoveGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleMoveGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleMoveGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learn_action-msg:<TurtleMoveGoal> is deprecated: use learn_action-msg:TurtleMoveGoal instead.")))

(cl:ensure-generic-function 'turtle_target_x-val :lambda-list '(m))
(cl:defmethod turtle_target_x-val ((m <TurtleMoveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_target_x-val is deprecated.  Use learn_action-msg:turtle_target_x instead.")
  (turtle_target_x m))

(cl:ensure-generic-function 'turtle_target_y-val :lambda-list '(m))
(cl:defmethod turtle_target_y-val ((m <TurtleMoveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_target_y-val is deprecated.  Use learn_action-msg:turtle_target_y instead.")
  (turtle_target_y m))

(cl:ensure-generic-function 'turtle_target_theta-val :lambda-list '(m))
(cl:defmethod turtle_target_theta-val ((m <TurtleMoveGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_target_theta-val is deprecated.  Use learn_action-msg:turtle_target_theta instead.")
  (turtle_target_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleMoveGoal>) ostream)
  "Serializes a message object of type '<TurtleMoveGoal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_target_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_target_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_target_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleMoveGoal>) istream)
  "Deserializes a message object of type '<TurtleMoveGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_target_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_target_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_target_theta) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleMoveGoal>)))
  "Returns string type for a message object of type '<TurtleMoveGoal>"
  "learn_action/TurtleMoveGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleMoveGoal)))
  "Returns string type for a message object of type 'TurtleMoveGoal"
  "learn_action/TurtleMoveGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleMoveGoal>)))
  "Returns md5sum for a message object of type '<TurtleMoveGoal>"
  "d6ca75a13b0855b8f735f0fec295b281")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleMoveGoal)))
  "Returns md5sum for a message object of type 'TurtleMoveGoal"
  "d6ca75a13b0855b8f735f0fec295b281")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleMoveGoal>)))
  "Returns full string definition for message of type '<TurtleMoveGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%float64 turtle_target_x  # Specify Turtle's　target position~%float64 turtle_target_y~%float64 turtle_target_theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleMoveGoal)))
  "Returns full string definition for message of type 'TurtleMoveGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%float64 turtle_target_x  # Specify Turtle's　target position~%float64 turtle_target_y~%float64 turtle_target_theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleMoveGoal>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleMoveGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleMoveGoal
    (cl:cons ':turtle_target_x (turtle_target_x msg))
    (cl:cons ':turtle_target_y (turtle_target_y msg))
    (cl:cons ':turtle_target_theta (turtle_target_theta msg))
))
