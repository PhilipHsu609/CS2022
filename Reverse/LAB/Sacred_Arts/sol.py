from Crypto.Util.number import long_to_bytes

arr = [
    "8D909984B8BEBAB3",
    "8D9A929E98D18B92",
    "D0888BD19290D29C",
    "8C9DC08F978FBDD1",
    "D9C7C7CCCDCB92C2",
    "C8CFC7CEC2BE8D91",
    "FFFFFFFFFFFFCF82"
]

b = bytes()

for a in arr:
    s = a[:12] + a[-2:] + a[-4:-2]             # xchgl al, ah
    h = (int(s, 16) ^ 0xFFFFFFFFFFFFFFFF) + 1  # neg   rax
    b += long_to_bytes(h)[::-1]

print(b)