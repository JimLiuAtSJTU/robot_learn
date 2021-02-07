
(cl:in-package :asdf)

(defsystem "easy_handeye_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :easy_handeye_msgs-msg
)
  :components ((:file "_package")
    (:file "ComputeCalibration" :depends-on ("_package_ComputeCalibration"))
    (:file "_package_ComputeCalibration" :depends-on ("_package"))
    (:file "ListAlgorithms" :depends-on ("_package_ListAlgorithms"))
    (:file "_package_ListAlgorithms" :depends-on ("_package"))
    (:file "RemoveSample" :depends-on ("_package_RemoveSample"))
    (:file "_package_RemoveSample" :depends-on ("_package"))
    (:file "SetAlgorithm" :depends-on ("_package_SetAlgorithm"))
    (:file "_package_SetAlgorithm" :depends-on ("_package"))
    (:file "TakeSample" :depends-on ("_package_TakeSample"))
    (:file "_package_TakeSample" :depends-on ("_package"))
  ))