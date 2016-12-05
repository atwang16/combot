#!/usr/bin/env python

import rospy
import motor
from teleop.msg import robotcmd

PWMA = 11
AIN1 = 13
AIN2 = 12
PWMB = 19
BIN1 = 15
BIN2 = 16
PWMW = 22
THRESHOLD = 0.1

_leftDriveMotor = motor.SFMotor(PWMA, AIN1, AIN2, False)
_rightDriveMotor = motor.SFMotor(PWMB, BIN1, BIN2, True)
_flipperMotor = motor.TinyESCMotor(PWMW, False)

_leftDriveSpeed = 0.0
_rightDriveSpeed = 0.0
_flipperSpeed = 0.0

def threshold(speed):
    return 0.0 if abs(speed) < 0.1 else speed

def cap(speed):
    return max(min(cap, 1.0), -1.0)

def calcDriveSpeeds(fvel, rvel):
    left = -rvel + fvel / 2.0
    right = rvel + fvel / 2.0
    return (threshold(left), threshold(right))

def update():
    global _leftDriveMotor
    global _rightDriveMotor
    global _flipperMotor
    global _leftDriveSpeed
    global _rightDriveSpeed
    global _flipperSpeed

    _leftDriveMotor.run(_leftDriveSpeed)
    _rightDriveMotor.run(_rightDriveSpeed)
    _flipperMotor.run(_flipperSpeed)

def callback(cmd):
    # rospy.loginfo(rospy.get_caller_id() + "I heard %s", msg.data)
    global _leftDriveSpeed
    global _rightDriveSpeed
    global _flipperSpeed

    _leftDriveSpeed, _rightDriveSpeed = calcDriveSpeeds(cmd.drive_fvel, cmd.drive_rvel)
    _flipperSpeed = cmd.flipper

def listener():
    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    rospy.init_node('robot', anonymous=True)
    rospy.Subscriber("command", robotcmd, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
