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
	Manages the motors values and adjusts it based on server instruction.
	Only thread that can modify exit
	"""
	#         BL      BR     TL     TR    run
	motor = [False, False, False, False, True]
	data = ""

	while motor[4]:
		# Recieves instruction from server. Blocks until instruction is recieved
		data += (server.recv(7)).decode()

		# Process data recieved if complete
		if "\r\n" in data:
			for i in range(5):
				motor[i] = (data[i] == '1')

			# Adjusts motors based on server instruction
			GPIO.output(Motor_bl, motor[0])
			GPIO.output(Motor_br, motor[1])
			GPIO.output(Motor_tl, motor[2])
			GPIO.output(Motor_tr, motor[3])

			data = data[data.index("\r\n") + 2:]  # Shift data recieved over

	motor_adjust(False, False, False, False)  # Turn off motors
	exit = True


# TODO: Needs to be implemented
def camera_send():
	"""while not exit:
		pass
	"""
	pass


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

	try:
		# Runs Threads
		thread_1 = threading.Thread(name="camera", target=camera_send)
		thread_2 = threading.Thread(name="motor", target=motor_run)

		# Start camera first so that the server has input to process
		thread_1.start()
		sleep(5)
		thread_2.start()

		# Wait until server is finished processing
		thread_2.join()
		thread_1.join()

	except Exception as e:
		print(e)

		# Turn off motors
		GPIO.output(Motor_bl, 0)
		GPIO.output(Motor_br, 0)
		GPIO.output(Motor_tl, 0)
		GPIO.output(Motor_tr, 0)


	# Cleanup
	GPIO.cleanup()
	sock.close()
