#include <stdio.h>

#define BUFSIZE 0x025980

unsigned char key[] = "0vCh8RrvqkrbxN9Q7Ydx";
unsigned char buf[BUFSIZE];

int main() {
    FILE *r = fopen("./enc.png", "rb");
    FILE *w = fopen("./dec.png", "wb");

    fread(buf, BUFSIZE, 1, r);
    
    for(int i = 0; i < BUFSIZE; i++) {
        buf[i] ^= key[i % 21];
    }

    fwrite(buf, BUFSIZE, 1, w);

    fclose(r);
    fclose(w);

    return 0;
}