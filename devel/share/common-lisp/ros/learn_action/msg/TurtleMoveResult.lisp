; Auto-generated. Do not edit!


(cl:in-package learn_action-msg)


;//! \htmlinclude TurtleMoveResult.msg.html

(cl:defclass <TurtleMoveResult> (roslisp-msg-protocol:ros-message)
  ((turtle_final_x
    :reader turtle_final_x
    :initarg :turtle_final_x
    :type cl:float
    :initform 0.0)
   (turtle_final_y
    :reader turtle_final_y
    :initarg :turtle_final_y
    :type cl:float
    :initform 0.0)
   (turtle_final_theta
    :reader turtle_final_theta
    :initarg :turtle_final_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurtleMoveResult (<TurtleMoveResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurtleMoveResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurtleMoveResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name learn_action-msg:<TurtleMoveResult> is deprecated: use learn_action-msg:TurtleMoveResult instead.")))

(cl:ensure-generic-function 'turtle_final_x-val :lambda-list '(m))
(cl:defmethod turtle_final_x-val ((m <TurtleMoveResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_final_x-val is deprecated.  Use learn_action-msg:turtle_final_x instead.")
  (turtle_final_x m))

(cl:ensure-generic-function 'turtle_final_y-val :lambda-list '(m))
(cl:defmethod turtle_final_y-val ((m <TurtleMoveResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_final_y-val is deprecated.  Use learn_action-msg:turtle_final_y instead.")
  (turtle_final_y m))

(cl:ensure-generic-function 'turtle_final_theta-val :lambda-list '(m))
(cl:defmethod turtle_final_theta-val ((m <TurtleMoveResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader learn_action-msg:turtle_final_theta-val is deprecated.  Use learn_action-msg:turtle_final_theta instead.")
  (turtle_final_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurtleMoveResult>) ostream)
  "Serializes a message object of type '<TurtleMoveResult>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_final_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_final_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'turtle_final_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurtleMoveResult>) istream)
  "Deserializes a message object of type '<TurtleMoveResult>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_final_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_final_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'turtle_final_theta) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurtleMoveResult>)))
  "Returns string type for a message object of type '<TurtleMoveResult>"
  "learn_action/TurtleMoveResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurtleMoveResult)))
  "Returns string type for a message object of type 'TurtleMoveResult"
  "learn_action/TurtleMoveResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurtleMoveResult>)))
  "Returns md5sum for a message object of type '<TurtleMoveResult>"
  "0e7b4195ae4864a401f0242e01596152")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurtleMoveResult)))
  "Returns md5sum for a message object of type 'TurtleMoveResult"
  "0e7b4195ae4864a401f0242e01596152")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurtleMoveResult>)))
  "Returns full string definition for message of type '<TurtleMoveResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%float64 turtle_final_x~%float64 turtle_final_y~%float64 turtle_final_theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurtleMoveResult)))
  "Returns full string definition for message of type 'TurtleMoveResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%float64 turtle_final_x~%float64 turtle_final_y~%float64 turtle_final_theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurtleMoveResult>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurtleMoveResult>))
  "Converts a ROS message object to a list"
  (cl:list 'TurtleMoveResult
    (cl:cons ':turtle_final_x (turtle_final_x msg))
    (cl:cons ':turtle_final_y (turtle_final_y msg))
    (cl:cons ':turtle_final_theta (turtle_final_theta msg))
))
