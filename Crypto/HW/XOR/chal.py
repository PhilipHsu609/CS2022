import random

# from secret import FLAG

FLAG = b"FLAG{abc}"

state = random.randint(0, 1 << 32)

def getbit():
    global state
    state <<= 1
    if state & (1 << 32):
        state ^= 0x1008345a9
        return 1
    return 0

flag = list(map(int, ''.join(["{:08b}".format(c) for c in FLAG])))

output = []
for _ in range(len(flag) + 40):
    for __ in range(36):
        getbit()
    output.append(getbit())

for i in range(len(flag)):
    output[i] ^= flag[i]

print(output)
