from pwn import *
from Crypto.Util.number import long_to_bytes

r = remote("edu-ctf.zoolab.org", 10102)

n = r.recvline()
e = r.recvline()
enc = r.recvline()

n = int(n)
e = int(e)
enc = int(enc)

x = 0
pt = 0
for i in range(256 * 8):
    inv = pow(3, -1, n)

    c = pow(inv, i * e, n) * enc % n
    r.sendline(str(c).encode("ascii"))

    recv = int(r.recvline(keepends=False).decode())
    a = (recv - (inv * x) % n) % 3
    x = inv * x % n + a

    pt += pow(3, i) * a

r.close()

print(long_to_bytes(pt))