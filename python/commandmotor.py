#!/usr/bin/python3

import RPi.GPIO as GPIO
import sys

def syntax():
	print('Syntax: commandmotor type status num')
	print('    type   : motor/fan')
	print('    status : start/stop')
	print('    num    : number motor/fan')
	exit(1)
	
def cmd_line(args):
	nb_args = len(args)
	if nb_args != 4:
		syntax()
		
	if args[1] != 'motor' and args[1] != 'fan':
		syntax()
		
	if args[2] != 'start' and args[2] != 'stop':
		syntax()
		
	if int(args[3]) < 1 or int(args[3]) > 6:
		syntax()
	
	if args[1] == 'motor':
		chaine = 'Action ' + actionmotor (args[2], int(args[3]))
	else:
		chaine = 'Action ' + actionfan (args[2])
	
		
	return chaine 
		
	
def init():
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(5, GPIO.OUT)
    GPIO.setup(6, GPIO.OUT)
    GPIO.setup(9, GPIO.OUT)
    GPIO.setup(10, GPIO.OUT)
    GPIO.setup(11, GPIO.OUT)
    GPIO.setup(12, GPIO.OUT)
    GPIO.setup(13, GPIO.OUT)
    GPIO.setup(16, GPIO.OUT)
    GPIO.setup(17, GPIO.OUT)
    GPIO.setup(19, GPIO.OUT)
    GPIO.setup(21, GPIO.OUT)
    GPIO.setup(20, GPIO.OUT)
    GPIO.setup(22, GPIO.OUT)
    GPIO.setup(27, GPIO.OUT)

    

def actionmotor(status, num):
	init()
	if status == 'start':
		if num == 1:
			GPIO.output(10, False)
			GPIO.output(22, True)
		elif num == 2:
			GPIO.output(27, False)
			GPIO.output(17, True)
		elif num == 3:
			GPIO.output(5, True)
			GPIO.output(6, False)
		elif num == 4:
			GPIO.output(13, True)
			GPIO.output(19, False)
		elif num == 5:
			GPIO.output(20, True)
			GPIO.output(21, False)
		elif num == 6:
			GPIO.output(12, True)
			GPIO.output(16, False)
	else:
		if num == 1:
			GPIO.output(10, False)
			GPIO.output(22, False)
		elif num == 2:
			GPIO.output(27, False)
			GPIO.output(17, False)
		elif num == 3:
			GPIO.output(5, False)
			GPIO.output(6, False)
		elif num == 4:
			GPIO.output(13, False)
			GPIO.output(19, False)
		elif num == 5:
			GPIO.output(20, False)
			GPIO.output(21, False)
		elif num == 6:
			GPIO.output(12, False)
			GPIO.output(16, False)
	return 'Motor ' + status
	

def actionfan(status):
	init()
	if status == 'start':
		GPIO.output(9, False)
		GPIO.output(11, True)
	else:
		GPIO.output(9, False)
		GPIO.output(11, False)
	return 'Fan ' + status
		
    
if __name__ == '__main__':
	args = cmd_line(sys.argv)
	print(args)
