from typing import List
import random

class OrgCipher:
    def __init__(self, state: int) -> None:
        self._state = state

    def getbit(self) -> int:
        self._state <<= 1
        if self._state & (1 << 32):
            self._state ^= 0x1008345a9
            return 1
        return 0

    def rgetbit(self) -> int:
        if self._state & 1:
            self._state ^= 0x1008345a9
        self._state >>= 1
        return (self._state >> 31) & 1

class Cipher:
    def __init__(self, state: List[int]) -> None:
        assert len(state) == 32
        self.__state = state
        self.__taps = [8, 14, 15, 17, 21, 23, 24, 26, 28]
        
    def getbit(self) -> int:
        self.__ffeedback()
        if self.__state[-1] == 1:
            self.__flip()
        return self.__state[-1]

    def rgetbit(self) -> int:
        if self.__state[-1] == 1:
            self.__flip()
        self.__rfeedback()
        return self.__state[0]

    def __ffeedback(self) -> None:
        x = self.__state[0]
        self.__state = self.__state[1:] + [x]

    def __rfeedback(self) -> None:
        x = self.__state[-1]
        self.__state = [x] + self.__state[:-1]

    def __flip(self) -> None:
        for i in self.__taps:
            self.__state[i] ^= 1

ct = [0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0]

print("Total steps:", 1 << 32)

for state in range(1, 1 << 31):
    state <<= 1

    if state % 1000000 == 0:
        print("State:", state)

    # state = list(map(int, "{0:032b}".format(state)))
    c = OrgCipher(state)

    for i in range(40):
        if c.rgetbit() != ct[-i]:
            break
        for _ in range(36):
            c.rgetbit()
    else:
        print("Find terminal state", state)
        break
