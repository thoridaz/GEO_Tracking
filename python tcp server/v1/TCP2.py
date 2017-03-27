import asyncio
import functions

HOST = functions.HOST
PORT = functions.PORT
trackers = []

class GpsServer(asyncio.Protocol):

    def connection_made(self, transport):
        self.transport = transport
        self.addr = transport.get_extra_info('peername')
        self.s = transport.get_extra_info('socket')
        self._rest = b''
        trackers.append(self)
        print("Connection from {}".format(self.addr))
        print(trackers)

    def data_received(self, data):
        data = self._rest + data
        (msgs, rest) = functions.parse_recvd_data(data)
        #(msgs, rest) = functions.recv_msgs(self.s, data)
        self._rest = rest
        for msg in msgs:
            msg = '{}: {}'.format(self.addr, msg.decode())
            print (msg)

    def connection_lost(self, ex):
        print('Client {} disconnected'.format(self.addr))
        trackers.remove(self)

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    coroutine = loop.create_server(GpsServer,
                                       host=HOST,
                                       port=PORT)
    server = loop.run_until_complete(coroutine)
    for socket in server.sockets:
        addr = socket.getsockname()
        print('Listening on {}'.format(addr))
    loop.run_forever()
        
