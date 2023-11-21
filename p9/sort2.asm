; WILLEM WILCOX
; Program 9
; 11/13/23
; One day, the wheel is gonna catch me. I don't know when, 
; but I'll keep running until it does 

; Welcome to macro city baby! Time to get cookin'

; Prints to console
%macro prt 2
    ; %1 = address of item
    ; %2 = length of item
    pusha
    
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
    
    popa
%endmacro

; Prints the array
%macro prtArray 2
    ; %1 = address of array
    ; %2 = length of array
    pusha
    
    mov edi, %2     ; set edi to numslen
    xor esi, esi    ; clear esi for use as counter
    mov ax, [%1]    ; set ax to nums address in memory

    call prtArrayLoop
    
    popa
%endmacro

;;;; END MACROS ;;;;


;;;; START DATA ;;;;

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

;; Main Array
nums:    dw 2000, 30000, 0, 65535, 0, 1, 2, 3, 100
numslen: EQU ($-nums)/2
numslenb: EQU numslen*2

; String place holder
string:  db "     ", 10, 0

; Clear Screen
cls:     db 1bh, '[2J'
clsLen:  dd ($-cls)

; New Line
nl:    db 10
nlLen:   dd ($-nl)

;; Titles and Headers
m1:    db "****Wills Wacky Array Sorter****"
m1Len: EQU ($-m1)
m2:    db "Original Array"
m2Len: EQU ($-m2)
m3:    db "Sorted Array"
m3Len: EQU ($-m3)

SECTION .bss
; define uninitialized data here

;;;; END OF DATA ;;;;

;;;; START OF MAIN ;;;;

SECTION .text
global _main
_main:

prt cls, [clsLen]       ; clear the screen
prt cls, [clsLen]
prt nl, [nlLen]         ; print new line

prt m1, [m1Len]     ; print the title of the program
prt nl, [nlLen]         ; print new line

prt m2, [m2Len]     ; print the header "Original array"
prt nl, [nlLen]         ; print new line

;;;;
prtArray nums, numslen          ; prtArray function

push nums
push numslenb
call sortArray	


prt m3, [m3Len]     ; print the header "Sorted array"
prt nl, [nlLen]         ; print new line

;;;;
prtArray nums, numslen          ; prtArray function
;;;;



; break
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

;;;; END MAIN ;;;;

prtArrayLoop:
    cmp esi, edi            ; check if out of bounds
    jge exitLoop            ; if not OOB, continue

    push edi                ; store counter

    mov edi, string         ; set edi to string var in memory
    call intToStr           ; call to conversion function

    pop edi                 ; restore counter

    prt string, 7           ; print string

    inc esi                 ; increment counter
    ;mov ax, WORD[nums + esi * 2]; 

    jmp prtArrayLoop

    exitLoop:
ret

intToStr:
    ;;;;
    mov bl, 10      ; set bl to 10 for division
    add edi, 4      ; move edi to the last 0 in string
    convert:
        div bl          ; divide ax by 10, result in eax, remainder in edx
        add ah, '0'     ; convert remainder to ASCII
        mov [edi], ah   ; move ASCII char into end of edi
        dec edi         ; move edi back a step in memory
        xor ah, ah      ; clear ah
        cmp ax, 0       ; check if quotient is zero
        jne convert     ; if not, continue
    
ret

; function args (array, length)
sortArray:
; start reverseArrayMain
    ; preserve base pointer/address
    push ebp
    mov ebp, esp

    ; preserve registers
    push eax
    push ebx
    push ecx
    push edx
    push esi
    ; end pushing/preserving

    ; dx now holds length of array
    mov dx,[ebp+8]

    ; bx points to end of array
    mov bx,[ebp+12]
    add bx,[ebp+8]



    repeatloop:
    ; ax now points to start of the array
    mov eax,[ebp+12]

    ; adjust location for last item in unsorted portion
    sub bx, 2

    cmp bx, 0
    jz endsort

    compare:
    	mov cx,WORD[eax]
    	cmp cx, WORD[eax + 2]
    	jb noswap

    	; swap
    	xchg cx, WORD[eax + 2]
    	mov WORD[eax], cx

    	noswap:
    	add eax, 2
    	cmp eax, ebx
    	jb compare

    	jmp repeatloop

    endsort:

    ; pop previously preserved registers and pointers/address
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ; end popping

    ret


