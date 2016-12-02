#!/usr/bin/env python

import rospy
from std_msgs.msg import String # create new message type

import sys, select, termios, tty

def getKey():
	tty.setraw(sys.stdin.fileno())
	select.select([sys.stdin], [], [], 0)
	key = sys.stdin.read(1)
	termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
	return key

def initPublisher():
    pub = rospy.Publisher('command', String, queue_size=1)
    rospy.init_node('controller', anonymous=True)
    rate = rospy.Rate(30) # in hertz
    return (pub, rate)

if __name__ == '__main__':
    try:
        settings = termios.tcgetattr(sys.stdin)
        pub, rate = initPublisher()

        while not rospy.is_shutdown():
            cmdMsg.drive_fvel = 0.0
            cmdMsg.drive_rvel = 0.0
            cmdMsg.flipper = 0.0

            key = getKey()
            if key == 'w':
                cmdMsg.drive_fvel = 1.0
            elif key == 's':
                cmdMsg.drive_fvel = -1.0

            if key == 'a':
                cmdMsg.theta = 1.0
            elif key == 'd':
                cmdMsg.theta = 1.0
            if key == 'l':
                cmdMsg.flipper = 1.0
            elif key == 'k':
                cmdMsg.flipper = 0.5
            if key == 'q':
                break

            pub.publish(cmdMsg)
            rate.sleep()

        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

    except rospy.ROSInterruptException:
        pass