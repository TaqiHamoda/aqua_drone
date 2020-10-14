import RPi.GPIO as GPIO
import threading
import socket
from time import sleep

# Global Variables
HOST = "127.0.0.1"
PORT = 60000
exit = False
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Motor Pins
Motor_bl = 21
Motor_br = 22
Motor_tl = 23
Motor_tr = 24


def motor_run():
	"""
	Runs the motor until the server signals to stop. Only thread that can modify exit
	"""
	motor = ""

	while motor != "----":
		while len(motor) < 4:
			motor += repr(server.recv(4))

		GPIO.output(Motor_bl, int(motor[0]))
		GPIO.output(Motor_br, int(motor[1]))
		GPIO.output(Motor_tl, int(motor[2]))
		GPIO.output(Motor_tr, int(motor[3]))

		motor = ""

	exit = True


def camera_send():
	while not exit:


if __name__ == "__main__":

	# Sets up the motors
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(Motor_bl, GPIO.OUT)
	GPIO.setup(Motor_br, GPIO.OUT)
	GPIO.setup(Motor_tl, GPIO.OUT)
	GPIO.setup(Motor_tr, GPIO.OUT)

	# Sets up Camera


	# Connects to server
	server.connect((HOST, PORT))

	# Runs Threads
	try:
		thread_1 = threading.Thread(name="camera", target=camera_send)
		thread_2 = threading.Thread(name="motor", target=motor_run)

		thread_1.start()
		sleep(5)
		thread_2.start()

		thread_2.join()
		thread_1.join()

	except:
		print("Error: Cannot start threads")

	# Cleanup
	GPIO.cleanup()
	sock.close()
