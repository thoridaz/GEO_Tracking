import socket

HOST = ''
PORT = 4040

def create_listen_socket(host, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((host, port))
    s.listen(100)
    return s

def parse_recvd_data(data):
    parts = data.split(b'\0')
    msgs = parts[:-1]
    rest = parts[-1]
    return (msgs, rest)

'''def recv_msgs(s, data=bytes):
    msgs = []
    while not msgs:
        recvd = s.recv(4096)
        if not recvd:
            raise ConnectionError()
        data = data + recvd
        (msgs, rest) = parse_recvd_data(data)
    msgs = [msg.decode() for msg in msgs]
    return (msgs, rest)'''

def prep_msg(msg):
    msg += '\0'
    return msg.encode()

def send_msg(sock, msg):
    data = prep_msg(msg)
    sock.sendall(data)
