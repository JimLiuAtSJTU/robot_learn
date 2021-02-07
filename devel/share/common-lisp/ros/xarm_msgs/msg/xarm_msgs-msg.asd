
(cl:in-package :asdf)

(defsystem "xarm_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IOState" :depends-on ("_package_IOState"))
    (:file "_package_IOState" :depends-on ("_package"))
    (:file "RobotMsg" :depends-on ("_package_RobotMsg"))
    (:file "_package_RobotMsg" :depends-on ("_package"))
  ))