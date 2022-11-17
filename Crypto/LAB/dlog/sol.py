from Crypto.Util.number import isPrime, size, getPrime, long_to_bytes
from pwn import *

p = 0
while not isPrime(p + 1) or size(p) != 1024:
    p = 2
    while size(p) != 1024:
        if size(p) == 1023:
            p *= 2
        elif size(p) < 1023:
            p *= getPrime(10)
        else:
            break
        
p = p + 1
b = 11

r = remote("edu-ctf.zoolab.org", 10103)

r.readuntil(b"give me a prime")
r.sendline(str(p).encode())
r.readuntil(b"give me a number")
r.sendline(str(b).encode())
r.readuntil(b"The hint about my secret:")
ct = int(r.readline().strip())

b = Mod(b, p)
ct = Mod(ct, p)
flag = discrete_log(ct, b)
print(long_to_bytes(flag))

r.close()