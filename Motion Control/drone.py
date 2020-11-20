import RPi.GPIO as GPIO
import threading
import socket
import picamera
import io
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


# A class for the raspberry pi camera to write to
class StreamingOutput(object):
    def __init__(self):
        self.frame = None
        self.buffer = io.BytesIO()
        self.condition = threading.Condition()

    def write(self, buf):
        if buf.startswith(b'\xff\xd8'):
            # New frame, copy the existing buffer's content and notify all
            # clients it's available
            self.buffer.truncate()
            with self.condition:
                self.frame = self.buffer.getvalue()
                self.condition.notify_all()
            self.buffer.seek(0)
        return self.buffer.write(buf)


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

	exit = True


def camera_send(output):
	# While the server didn't send an exit response
	while not exit:
		# Wait until there is a frame to write and then write it
		with output.condition:
			output.condition.wait()
			frame = output.frame

		# Send the frame
		server.send(frame)
		server.send(b"\r\n")




if __name__ == "__main__":

	# Sets up the motors
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(Motor_bl, GPIO.OUT)
	GPIO.setup(Motor_br, GPIO.OUT)
	GPIO.setup(Motor_tl, GPIO.OUT)
	GPIO.setup(Motor_tr, GPIO.OUT)

	# Connects to server
	server.connect((HOST, PORT))

	# Set up the camera
	with picamera.PiCamera(resolution='1280x720', framerate=60) as camera:  # 60 fps @ 720p
		output = StreamingOutput()
		camera.start_recording(output, format='mjpeg')

		try:
			# Runs Threads
			thread_1 = threading.Thread(name="camera", target=camera_send, args=(output, ))
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

		finally:
			# Turn off motors
			GPIO.output(Motor_bl, 0)
			GPIO.output(Motor_br, 0)
			GPIO.output(Motor_tl, 0)
			GPIO.output(Motor_tr, 0)

			# Stop the camera
			camera.stop_recording()


	# Cleanup
	GPIO.cleanup()
	socket.close()
