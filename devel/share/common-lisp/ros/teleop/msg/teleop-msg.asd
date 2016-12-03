
(cl:in-package :asdf)

(defsystem "teleop-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "robotcmd" :depends-on ("_package_robotcmd"))
    (:file "_package_robotcmd" :depends-on ("_package"))
  ))