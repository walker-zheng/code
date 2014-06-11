#!/usr/bin/python

import socket

# Build a socket to receive data from RTP server.
# Here we use SOCK_DGRAM, because RTP is on UDP.
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(("localhost", 6666))

for i in range(5):
        # We just get 16 bytes to analyze the RTP Header.
        buf = sock.recv(16)

        # Output the result in octal.
        for c in buf:
                print "%x" % ord(c),
        print

sock.close()
