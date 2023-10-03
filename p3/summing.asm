; Wilcox, Willem
; Program 3 - Summing Arrays
; 10/01/23
; Due Wed, Oct 4th, 2023

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
bArray:		DB	1,-2,3,-4,5
wArray: 	DW	100,200,300,400,500
dArray:		DD	-322,-322h,-322q,-1833,-1833h
bArraySum: 	DB	0
wArraySum:	DW 	0
dArraySum:	DD	0
grandTotal:	DD	0

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:
; put your code here.

; Sum bArray
	mov al,BYTE [bArray]
	add BYTE [bArraySum],al

	mov al,BYTE [bArray+1]
	add BYTE [bArraySum],al

	mov al,BYTE [bArray+2]
	add BYTE [bArraySum],al

	mov al,BYTE [bArray+3]
	add BYTE [bArraySum],al

	mov al,BYTE [bArray+4]
	add BYTE [bArraySum],al
	
	movsx edx,BYTE [bArraySum]
	add DWORD [grandTotal],edx

	; For debugging, check bl for value of wArraySum
	mov bl,BYTE [bArraySum]
	
; Sum wArray
        mov ax,WORD [wArray]
        add WORD [wArraySum],ax

        mov ax,WORD [wArray+2]
        add WORD [wArraySum],ax

        mov ax,WORD [wArray+4]
        add WORD [wArraySum],ax

        mov ax,WORD [wArray+6]
        add WORD [wArraySum],ax

        mov ax,WORD [wArray+8]
        add WORD [wArraySum],ax

        movsx edx,WORD [wArraySum]
        add DWORD [grandTotal],edx

        ; For debugging, check bx for value of wArraySum
        mov ax,WORD [wArraySum]

; Sum dArray
        mov ecx,DWORD [dArray]
        add DWORD [dArraySum],ecx

        mov ecx,DWORD [dArray+4]
        add DWORD [dArraySum],ecx

        mov ecx,DWORD [dArray+8]
        add DWORD [dArraySum],ecx

        mov ecx,DWORD [dArray+12]
        add DWORD [dArraySum],ecx

        mov ecx,DWORD [dArray+16]
        add DWORD [dArraySum],ecx

        mov edx,DWORD [dArraySum]
        add DWORD [grandTotal],edx

        ; For debugging, check ecx for value of dArraySum
        mov ecx,DWORD [dArraySum]
	; For debugging, check edx for value of grandTotal
        mov edx,DWORD [grandTotal]

;Testing code
;mov al,[bArray]
;mov bx,[bArray]
;mov cx,[wArray]
;mov edx,[dArray]

; break point to peek into memory!
lastBreak:

; Normal termination code
mov ebx, 0
int 80h
