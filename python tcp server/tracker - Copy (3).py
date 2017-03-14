import socket
import time
import functions

HOST = '192.168.1.33'
PORT = functions.PORT

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
print('Connected to {}:{}'.format(HOST, PORT))
starttime = time.time()
while True:
    msg = None
    functions.send_msg(s, msg)
    time.sleep(5.0 - ((time.time() - starttime) % 5.0))
