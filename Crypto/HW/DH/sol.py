from pwn import *
from Crypto.Util.number import long_to_bytes

r = remote("edu-ctf.zoolab.org", 10104)

p = int(r.recvline().decode())

assert p % 4 == 1

g = pow(2, (p-1)//4, p)
r.sendline(str(g).encode())

ct = int(r.recvline().decode())
r.close()

for i in range(4):
    f = ct * pow(g, -i, p) % p
    print(long_to_bytes(f))