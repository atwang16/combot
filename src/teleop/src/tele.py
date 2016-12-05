#!/usr/bin/env python

import rospy
from teleop.msg import robotcmd
import sys, select, termios, tty

def getKey():
	tty.setraw(sys.stdin.fileno())
	select.select([sys.stdin], [], [], 0)
	key = sys.stdin.read(1)
	termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
	return key

def initPublisher():
    rospy.init_node('controller', anonymous=True)
    pub = rospy.Publisher('command', robotcmd, queue_size=1)
    rate = rospy.Rate(30) # in hertz
    return (pub, rate)

if __name__ == '__main__':
    try:
        settings = termios.tcgetattr(sys.stdin)
        pub, rate = initPublisher()

	cmdMsg = robotcmd()

        while not rospy.is_shutdown():
            cmdMsg.drive_fvel = 0.0
            cmdMsg.drive_rvel = 0.0
            cmdMsg.flipper = 0.0

            key = getKey()
            if key == '1' or key == '2' or key == '3':
                cmdMsg.drive_fvel = 1.0
            elif key == 'a' or key == 's' or key == 'd':
                cmdMsg.drive_fvel = -1.0

            if key == '1' or key == 'q' or key == 'a':
                cmdMsg.drive_rvel = 1.0
            elif key == '3' or key =='e' or key == 'd':
                cmdMsg.drive_rvel = -1.0

            if key == 'l':
                cmdMsg.flipper = 1.0
            elif key == 'k':
                cmdMsg.flipper = 0.5

            if key == 't':
                break

            pub.publish(cmdMsg)
            rate.sleep()

        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

    except rospy.ROSInterruptException:
        pass
