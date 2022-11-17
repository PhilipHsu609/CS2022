#pragma comment(lib, "crypt32.lib")

#include <stdio.h>
#include <Windows.h>
#include <Wincrypt.h>

unsigned char flag[] = {
  0xE1, 0xD6, 0x26, 0x81, 0x83, 0x9F, 0x36, 0x8F, 0xF6, 0x39,
  0x89, 0x7A, 0x92, 0x97, 0x84, 0xA4, 0x70, 0x04, 0x61, 0x4B,
  0x77, 0xED, 0x58, 0x5D, 0xE0, 0xE1, 0x75, 0x3A, 0xF9, 0x34
};

int main() {
	HCRYPTPROV phProv;
	HCRYPTHASH phHash;
	HCRYPTKEY phKey;
	BYTE data = 0xFF;
	BYTE *block;
	size_t size = 0x1E;

	CryptAcquireContextW(&phProv, 0i64, 0i64, 1i64, 0);
	CryptCreateHash(phProv, CALG_SHA, 0i64, 0i64, &phHash);
	CryptHashData(phHash, &data, 1i64, 0i64);
	CryptDeriveKey(phProv, 26625i64, phHash, 1i64, &phKey);

	CryptDestroyHash(phHash);

	block = (BYTE*)malloc(size);

	if (!block)
		exit(1);

	ZeroMemory(block, size);
	CopyMemory(block, flag, size);

	CryptEncrypt(phKey, 0i64, 1i64, 0i64, block, (DWORD*)&size, size);

	printf("%s\n", block);

	return 0;
}