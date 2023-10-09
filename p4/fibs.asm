; WILLEM WILCOX
; Program 4
; 10/09/23
; If you're reading this, have a wonderful day

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

FIBS_ONE: DD 0
FIBS_TWO: DD 1

SECTION .bss
; define uninitialized data here
Fibs: RESD 16

SECTION .text
global _main
_main:
; put your code here.

; assign Fibs[0]
mov ebx,0
mov ecx,[FIBS_ONE]
mov [Fibs + ebx],ecx

; assign Fibs[1]
mov ebx,1 ; Fibs index
mov ecx,[FIBS_TWO]
mov [Fibs + ebx*4],ecx ; *4 to account for size of data

; loop for Fibs[2-15]
mov ebx,2
loop_start:
	mov ecx,[FIBS_ONE]
	mov edx,[FIBS_TWO]
	add ecx,edx ; ECX now contains new FIBS_TWO
	mov [FIBS_ONE],edx ; FIBS_ONE is now the old FIBS_TWO
	mov [FIBS_TWO],ecx
	; update Fibs[EBX] with new FIBS_TWO
	mov [Fibs + ebx*4],ecx ; *4 to account for data size
	add ebx,1
	cmp ebx,16
	jle loop_start
; end of loop


lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
