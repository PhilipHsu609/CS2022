#include <stdio.h>

unsigned char flag[] = {
    0x46, 0x99, 0xF7, 0x64, 0x1D, 0x79, 0x44, 0x22, 0xC1, 0xD3,
    0x27, 0xCD, 0x31, 0xC1, 0xD9, 0x77, 0xEC, 0x7A, 0x75, 0x24,
    0xBF, 0xDD, 0x24, 0xDD, 0x23, 0xB2, 0xCD, 0x7C, 0x02, 0x58,
    0x46, 0x24, 0xAC, 0xD8, 0x21, 0xD1, 0x5D, 0xBC, 0xC5, 0x7C,
    0x05, 0x6C, 0x48, 0x2B, 0xBB, 0xD5, 0x11, 0xCB, 0x35, 0xB6,
    0xD9, 0x57, 0x0F, 0x60, 0x3F, 0x34, 0xFF, 0xEC};

void xor_87(unsigned char *c) {
    *c ^= 0x87;
}

void xor_FF(unsigned char *c) {
    *c ^= 0xFF;
}

void xor_63(unsigned char *c) {
    *c ^= 0x63;
}

void(*func[3])(unsigned char *c) = {
    xor_87, xor_FF, xor_63
};

unsigned char keys[] = {
    0xDE, 0xAD, 0xBE, 0xBF};

void TLS_Callback1() {
    for(int i = 0; i < 4; i++) {
        func[i % 3](&keys[i]);
    }
}

void TLS_Callback2() {
    void(*tmp)(unsigned char*) = func[0];
    func[0] = func[1];
    func[1] = func[2];
    func[2] = tmp;
}

int main() {
    TLS_Callback2();
    TLS_Callback1();
    TLS_Callback2();

    for(int i = 0; i < 58; i++) {
        flag[i] -= keys[i % 4];
        func[i % 3](&flag[i]);
    }

    printf("%s\n", flag);

    return 0;
}