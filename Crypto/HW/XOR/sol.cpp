#include <bitset>
#include <iostream>
#include <sstream>
#include <string>

using namespace std;

const string ct{"011001001100100110101010111101010110001010010101101001111111001000011010111000010110101001000010010011000101101000001010010100010101101111000011000111100100101111110010001010110100110011011110010110111100000101000100011010001100101000001000100111001110001111111110000101101000010011011010101101111100001110110001001100101100011100010100101010011110000101111000110110000100001101100001001001110001000101110100000010010110011010000110"};
const string tail{ct.substr(392)};
string flag{ct.substr(0, 392)};

class Cipher {
   public:
    Cipher(unsigned int state) : state{state} {}
    bool getbit() {
        bool b = state.test(31);
        state <<= 1;
        if (b) {
            state ^= 0x8345a9;
        }
        return b;
    }
    bool rgetbit() {
        bool b = state.test(0);
        state >>= 1;
        if (b) {
            // 0x8041a2d4 = (0x8345a9 >> 1) | 0x80000000
            state ^= 0x8041a2d4;
        }
        return b;
    }

   private:
    bitset<32> state;
};

int main() {
    unsigned int state;

    // find end state
    for (state = (1U << 31) - 1; state >= 0; state--) {
        Cipher c(state << 1);
        bool stop = true;
        for (int i = 39; i >= 0; i--) {
            if (c.rgetbit() != (tail[i] - '0')) {
                stop = false;
                break;
            }
            for (int j = 0; j < 36; j++)
                c.rgetbit();
        }
        if (stop) {
            state <<= 1;
            break;
        }
    }

    Cipher c(state);
    for (int i = 0; i < 40; i++) {
        c.rgetbit();
        for (int j = 0; j < 36; j++) {
            c.rgetbit();
        }
    }

    // recover flag
    for (int i = 391; i >= 0; i--) {
        bool b = c.rgetbit();
        flag[i] = (b ^ (flag[i] - '0')) + '0';
        for (int j = 0; j < 36; j++) {
            c.rgetbit();
        }
    }

    // binary string to ASCII string
    stringstream ss(flag);
    flag.clear();
    while (ss.good()) {
        bitset<8> b;
        ss >> b;
        char c = char(b.to_ulong());
        flag += c;
    }

    cout << flag << endl;

    return 0;
}