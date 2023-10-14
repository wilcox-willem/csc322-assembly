; WILLEM WILCOX
; Program 5
; 10/13/23
; If you're reading this, have a wonderful day! :)

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
FibsPrev: DD 0

SECTION .bss
; define uninitialized data here
MaxFib: RESD 1
FibCount: RESW 1

SECTION .text
global _main
_main:

; set data
mov word [FibCount],0
mov dword [MaxFib],1

loop_start:
        inc dword [FibCount]
        mov ecx,[FibsPrev]
        mov edx,[MaxFib]
        add ecx,edx ; ECX now contains new MaxFib
        jc end_of_loop

        mov [FibsPrev],edx ; FibsPrev is now MaxFib
        mov [MaxFib],ecx ; MaxFib is now the newest fib seq
        
        ; Loop control
        ; cmp bx,# is an arbitrary means to stop inf loops
        inc bx
        cmp bx,99 
        jle loop_start

end_of_loop:
        ; update MaxFib to largest unsigned dword fib seq
        mov edx,[FibsPrev]
        mov [MaxFib],edx 

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

