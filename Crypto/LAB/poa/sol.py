from pwn import *

r = remote("edu-ctf.zoolab.org", 10101)

# receive the hex byte string and decode it to ASCII string
ct = r.recvline(keepends=False).decode()
ct = bytes.fromhex(ct)

block_size = 16
nblocks = len(ct) // block_size

pt = b""

for blockIdx in range(1, nblocks):
    block_ct = ct[blockIdx * block_size: (blockIdx + 1) * block_size]
    last_ct = ct[(blockIdx - 1) * block_size: blockIdx * block_size]
    block_pt = b""

    for byteIdx in reversed(range(16)):
        prefix = last_ct[:byteIdx]
        postfix = bytes([i ^ j for i, j in zip(block_pt, last_ct[byteIdx + 1:])])

        # Why range(128, 256)?
        # We want to handle this situation: block_ct has padding
        # i.e. block_ct = [part of flag] + [0x80] + [0...0]
        # The problem is when byteIdx is at the padding section, b can always be 0 and still have the valid padding format!
        # And block_pt will puts 0x80 ^ 0 = 0x80 in it, instead of 0x00
        # That's why we need to flip the msb to ensure that it can handle the padding section

        # Another reason is: ASCII: 0~127, so the msb in a byte is always 0
        # This can reduce running time but also handle the above problem
        for b in range(128, 256):
            test = prefix + bytes([b ^ last_ct[byteIdx]]) + postfix + block_ct
            r.sendline(test.hex().encode("ascii"))
            res = r.recvline(keepends=False)

            if res == b"Well received :)":
                # Correct padding
                # Current byte is decoded to 0x80
                block_pt = bytes([0x80 ^ b]) + block_pt
                break
        else:
            # Current byte in plaintext is 0x80
            block_pt = bytes([0x80]) + block_pt

    pt += block_pt

print(pt)

r.close()