#include <bitset>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

const string output{"111100100111100111110000001110010111000100011100100110100111000111000010110011101011011110010101000100100110101010001101011100010000001110011100111001011001010011000010010011110111011001101000011111000011011010011101101100000010100110110101010001010000000010010100111010001111110010001101101000100101011000110111010101100001001111000111000010100110010010110010011010010011100001111000000100101101010111000100011100111111100101001001"};
const string FLAG{output.substr(0, 232)};
const string garbage{output.substr(232)};

class LFSR {
   public:
    LFSR(unsigned int tap, unsigned int state, size_t size) {
        _tap = tap;
        _state = bitset<30>(state);
        _size = size;
    }
    bool getbit() {
        bool x = _state[0];
        bool f = (_state & bitset<30>(_tap)).count() & 1;
        _state >>= 1;
        _state.set(_size - 1, f);
        return x;
    }
    unsigned int _tap;
    bitset<30> _state;
    size_t _size;
};

double cal_cor(const string &s1, const string &s2) {
    int count = 0, n = s1.length();
    for (int i = 0; i < n; i++) {
        if (s1[i] == s2[i])
            count++;
    }
    return count / static_cast<double>(n);
}

int main(int argc, char **argv) {
    size_t size[4] = {0, 27, 23, 25};
    unsigned int taps[4];
    unsigned int states[4];

    taps[1] = 1 | 1 << 13 | 1 << 16 | 1 << 26;
    taps[2] = 1 | 1 << 5 | 1 << 7 | 1 << 22;
    taps[3] = 1 | 1 << 17 | 1 << 19 | 1 << 24;

    for (int i = 2; i <= 3; i++) {
        // find s2 and s3
        for (int s = 1; s < (1 << size[i]); s++) {
            LFSR lfsr(taps[i], s, size[i]);

            for (int j = 0; j < 232; j++)
                lfsr.getbit();

            string res(200, ' ');
            for (int j = 0; j < 200; j++)
                res[j] = lfsr.getbit() ? '1' : '0';

            if (cal_cor(res, garbage) >= 0.7) {
                states[i] = s;
                break;
            }
        }
    }

    // find s1
    for (int s = 1; s < (1 << size[1]); s++) {
        LFSR l1(taps[1], s, size[1]);
        LFSR l2(taps[2], states[2], size[2]);
        LFSR l3(taps[3], states[3], size[3]);

        for (int i = 0; i < 232; i++) {
            l1.getbit();
            l2.getbit();
            l3.getbit();
        }

        string out(200, ' ');
        for (int i = 0; i < 200; i++) {
            bool x1 = l1.getbit(), x2 = l2.getbit(), x3 = l3.getbit();
            bool x = x1 ? x2 : x3;
            out[i] = x ? '1' : '0';
        }

        if (cal_cor(out, garbage) >= 1) {
            states[1] = s;
            break;
        }
    }

    // decode
    LFSR l1(taps[1], states[1], size[1]);
    LFSR l2(taps[2], states[2], size[2]);
    LFSR l3(taps[3], states[3], size[3]);

    bitset<232> pt;
    for (int i = 0; i < 232; i++) {
        bool x1 = l1.getbit(), x2 = l2.getbit(), x3 = l3.getbit();
        bool x = x1 ? x2 : x3;
        bool b = FLAG[i] == '1' ? true : false;
        pt.set(232 - i - 1, x ^ b);
    }

    // bitset to ASCII string
    stringstream ss(pt.to_string());
    string flag;
    while (ss.good()) {
        bitset<8> b;
        ss >> b;
        char c = char(b.to_ulong());
        flag += c;
    }

    cout << flag << endl;

    return 0;
}