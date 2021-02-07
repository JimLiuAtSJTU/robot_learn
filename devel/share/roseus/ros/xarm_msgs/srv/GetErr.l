;; Auto-generated. Do not edit!


(when (boundp 'xarm_msgs::GetErr)
  (if (not (find-package "XARM_MSGS"))
    (make-package "XARM_MSGS"))
  (shadow 'GetErr (find-package "XARM_MSGS")))
(unless (find-package "XARM_MSGS::GETERR")
  (make-package "XARM_MSGS::GETERR"))
(unless (find-package "XARM_MSGS::GETERRREQUEST")
  (make-package "XARM_MSGS::GETERRREQUEST"))
(unless (find-package "XARM_MSGS::GETERRRESPONSE")
  (make-package "XARM_MSGS::GETERRRESPONSE"))

(in-package "ROS")





(defclass xarm_msgs::GetErrRequest
  :super ros::object
  :slots ())

(defmethod xarm_msgs::GetErrRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass xarm_msgs::GetErrResponse
  :super ros::object
  :slots (_err _message ))

(defmethod xarm_msgs::GetErrResponse
  (:init
   (&key
    ((:err __err) 0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _err (round __err))
   (setq _message (string __message))
   self)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; int16 _err
    2
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _err
       (write-word _err s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _err
     (setq _err (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass xarm_msgs::GetErr
  :super ros::object
  :slots ())

(setf (get xarm_msgs::GetErr :md5sum-) "e76afb4d672a4bc2845f5f5cad909c5e")
(setf (get xarm_msgs::GetErr :datatype-) "xarm_msgs/GetErr")
(setf (get xarm_msgs::GetErr :request) xarm_msgs::GetErrRequest)
(setf (get xarm_msgs::GetErr :response) xarm_msgs::GetErrResponse)

(defmethod xarm_msgs::GetErrRequest
  (:response () (instance xarm_msgs::GetErrResponse :init)))

(setf (get xarm_msgs::GetErrRequest :md5sum-) "e76afb4d672a4bc2845f5f5cad909c5e")
(setf (get xarm_msgs::GetErrRequest :datatype-) "xarm_msgs/GetErrRequest")
(setf (get xarm_msgs::GetErrRequest :definition-)
      "
---

int16 err

string message
")

(setf (get xarm_msgs::GetErrResponse :md5sum-) "e76afb4d672a4bc2845f5f5cad909c5e")
(setf (get xarm_msgs::GetErrResponse :datatype-) "xarm_msgs/GetErrResponse")
(setf (get xarm_msgs::GetErrResponse :definition-)
      "
---

int16 err

string message
")



(provide :xarm_msgs/GetErr "e76afb4d672a4bc2845f5f5cad909c5e")


