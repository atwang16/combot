; Auto-generated. Do not edit!


(cl:in-package teleop-msg)


;//! \htmlinclude robotcmd.msg.html

(cl:defclass <robotcmd> (roslisp-msg-protocol:ros-message)
  ((drive_fvel
    :reader drive_fvel
    :initarg :drive_fvel
    :type cl:float
    :initform 0.0)
   (drive_rvel
    :reader drive_rvel
    :initarg :drive_rvel
    :type cl:float
    :initform 0.0)
   (flipper
    :reader flipper
    :initarg :flipper
    :type cl:float
    :initform 0.0))
)

(cl:defclass robotcmd (<robotcmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robotcmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robotcmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name teleop-msg:<robotcmd> is deprecated: use teleop-msg:robotcmd instead.")))

(cl:ensure-generic-function 'drive_fvel-val :lambda-list '(m))
(cl:defmethod drive_fvel-val ((m <robotcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader teleop-msg:drive_fvel-val is deprecated.  Use teleop-msg:drive_fvel instead.")
  (drive_fvel m))

(cl:ensure-generic-function 'drive_rvel-val :lambda-list '(m))
(cl:defmethod drive_rvel-val ((m <robotcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader teleop-msg:drive_rvel-val is deprecated.  Use teleop-msg:drive_rvel instead.")
  (drive_rvel m))

(cl:ensure-generic-function 'flipper-val :lambda-list '(m))
(cl:defmethod flipper-val ((m <robotcmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader teleop-msg:flipper-val is deprecated.  Use teleop-msg:flipper instead.")
  (flipper m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robotcmd>) ostream)
  "Serializes a message object of type '<robotcmd>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'drive_fvel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'drive_rvel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'flipper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robotcmd>) istream)
  "Deserializes a message object of type '<robotcmd>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'drive_fvel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'drive_rvel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'flipper) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robotcmd>)))
  "Returns string type for a message object of type '<robotcmd>"
  "teleop/robotcmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robotcmd)))
  "Returns string type for a message object of type 'robotcmd"
  "teleop/robotcmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robotcmd>)))
  "Returns md5sum for a message object of type '<robotcmd>"
  "04e0164496b5b11175b5eb32f5fde4f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robotcmd)))
  "Returns md5sum for a message object of type 'robotcmd"
  "04e0164496b5b11175b5eb32f5fde4f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robotcmd>)))
  "Returns full string definition for message of type '<robotcmd>"
  (cl:format cl:nil "float32 drive_fvel~%float32 drive_rvel~%float32 flipper~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robotcmd)))
  "Returns full string definition for message of type 'robotcmd"
  (cl:format cl:nil "float32 drive_fvel~%float32 drive_rvel~%float32 flipper~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robotcmd>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robotcmd>))
  "Converts a ROS message object to a list"
  (cl:list 'robotcmd
    (cl:cons ':drive_fvel (drive_fvel msg))
    (cl:cons ':drive_rvel (drive_rvel msg))
    (cl:cons ':flipper (flipper msg))
))
