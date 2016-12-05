;; Auto-generated. Do not edit!


(when (boundp 'teleop::robotcmd)
  (if (not (find-package "TELEOP"))
    (make-package "TELEOP"))
  (shadow 'robotcmd (find-package "TELEOP")))
(unless (find-package "TELEOP::ROBOTCMD")
  (make-package "TELEOP::ROBOTCMD"))

(in-package "ROS")
;;//! \htmlinclude robotcmd.msg.html


(defclass teleop::robotcmd
  :super ros::object
  :slots (_drive_fvel _drive_rvel _flipper ))

(defmethod teleop::robotcmd
  (:init
   (&key
    ((:drive_fvel __drive_fvel) 0.0)
    ((:drive_rvel __drive_rvel) 0.0)
    ((:flipper __flipper) 0.0)
    )
   (send-super :init)
   (setq _drive_fvel (float __drive_fvel))
   (setq _drive_rvel (float __drive_rvel))
   (setq _flipper (float __flipper))
   self)
  (:drive_fvel
   (&optional __drive_fvel)
   (if __drive_fvel (setq _drive_fvel __drive_fvel)) _drive_fvel)
  (:drive_rvel
   (&optional __drive_rvel)
   (if __drive_rvel (setq _drive_rvel __drive_rvel)) _drive_rvel)
  (:flipper
   (&optional __flipper)
   (if __flipper (setq _flipper __flipper)) _flipper)
  (:serialization-length
   ()
   (+
    ;; float32 _drive_fvel
    4
    ;; float32 _drive_rvel
    4
    ;; float32 _flipper
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _drive_fvel
       (sys::poke _drive_fvel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _drive_rvel
       (sys::poke _drive_rvel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _flipper
       (sys::poke _flipper (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _drive_fvel
     (setq _drive_fvel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _drive_rvel
     (setq _drive_rvel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _flipper
     (setq _flipper (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get teleop::robotcmd :md5sum-) "04e0164496b5b11175b5eb32f5fde4f5")
(setf (get teleop::robotcmd :datatype-) "teleop/robotcmd")
(setf (get teleop::robotcmd :definition-)
      "float32 drive_fvel
float32 drive_rvel
float32 flipper

")



(provide :teleop/robotcmd "04e0164496b5b11175b5eb32f5fde4f5")


