#!/usr/bin/env python

import GPIO as IO
import time
import abc

FORWARD = 1
REVERSE = 0
HIGH = 1
LOW = 0

class Motor():
    def __init__(self, pwm_pin, reverse):
        self.pwm = pwm_pin
        IO.setup(self.pwm, IO.OUTPUT)
        self.mtr = IO.PWM(self.pwm, 100) # 100 hz frequency
        self.mtr.start(0) # start with 0 duty cycle
        self.reverse = reverse

    @abc.abstractmethod
    def setDirection(self, dir):
        """
        Sets direction (CW or CCW) of motor
        :param dir: 1 or 0 indicating direction
        """
        return

    @abc.abstractmethod
    def calcSpeed(self, speed):
        """
        Sets speed of motor
        :param speed: real number between -1.0 and 1.0
        :return: translated speed for ChangeDutyCycle (0 to 100 for percent of pulse)
        """
        return

    def run(self, speed):
        """
        Sets the motor to run at a specified speed
        :param speed: real number between -1.0 and 1.0
        """
        if speed > 0:
            self.setDirection(FORWARD)
        else:
            self.setDirection(REVERSE)
        self.mtr.ChangeDutyCycle(calcSpeed(speed))

    def stop(self):
        self.mtr.ChangeDutyCycle(calcSpeed(0.0))

class SFMotor(Motor):
    def __init__(self, pwm_pin, in1_pin, in2_pin, reverse):
        Motor.__init__(pwm_pin, reverse)
        self.in1 = in1_pin
        self.in2 = in2_pin
        IO.setup(self.in1, IO.OUT)
        IO.setup(self.in2, IO.OUT)
        IO.output(self.in1, HIGH)
        IO.output(self.in2, LOW)

    def setDirection(self, dir):
        if dir != self.reverse:
            IO.output(self.in1, HIGH)
            IO.output(self.in2, LOW)
        else:
            IO.output(self.in1, LOW)
            IO.output(self.in2, HIGH)

    def calcSpeed(self, speed):
        return(abs(speed) * 100.0)

class TinyESCMotor(Motor):

    def __init__(self, pwm_pin, reverse):
        Motor.__init__(pwm_pin, reverse)

    def setDirection(self, dir):
        # Direction set by pulse width
        return

    def calcSpeed(self, speed):
        return 5.0*speed*(1 if self.reverse == FORWARD else -1) + 85.0