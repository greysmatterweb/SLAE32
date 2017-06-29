#!/usr/bin/python

# Author :  Ian McLachlan
# Python Cryptor with AES 128 & Base64

# This will Encrypt shellcode and send to screen and file : shellcode.encrypt


from Crypto.Cipher import AES
import sys, os, base64


def encryptor(private):
 block_size = 16    # 128bit AES
 seperation ='{'
 pad = lambda s: s + (block_size - len(s) % block_size) * seperation
 encode = lambda c, s: base64.b64encode(c.encrypt(pad(s)))
 key = 'aabbccddeeffgghh'
 cipher = AES.new(key)
 encoded = encode (cipher, private)
 os.system('clear')
 f = open('shellcode.encrypt','w')
 f.write(encoded)
 f.close()
 print 'Encrypted Shellcode: \r\n\r\n', encoded
 sys.exit(0)

if len(sys.argv) != 2:
 print('**  Usage: '+sys.argv[0]+' shellcode\n\n')
 sys.exit(1)

shellcode = sys.argv[1]
crypted = encryptor (shellcode)

