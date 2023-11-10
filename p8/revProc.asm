; WILLEM WILCOX
; Program 8
; 11/8/23
; Hey! Hope you doing well!
;
; Fun Story: While I was at my brother's bachelor party, I found out
;            one of the other groomsmen (Antonio) knew assembly! Also,
;            His brother has to take it next semester,
;            so we got to scare him early    :)




SECTION .data
;array1
array1: dd      1,2,3,4,5
len1:   EQU     ($-array1)

;array2
array2: dd      -10, -9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9
len2:   EQU     ($-array2)

;array3
array3: dd  0,10,20,30,40,50,60,70,80,90
  dd  100,110,120,130,140,150,160,170,180,190
  dd  200,210,220,230,240,250,260,270,280,290
  dd  300,310,320,330,340,350,360,370,380,390
  dd  400,410,420,430,440,450,460,470,480,490,500
len3:   EQU     ($-array3)

SECTION .bss
; empty

SECTION .text
global _main
_main:

; start of main
push array1
push len1
call reverseArrayMain

push array2
push len2
call reverseArrayMain

push array3
push len3
call reverseArrayMain

jmp lastBreak
; end of main

; function args (array, length)
reverseArrayMain:
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

    ; ecx now holds length of array, adjusted for size
    mov ecx,[ebp+8]
    shr ecx,3

    ; eax points to start of array
    mov eax,[ebp+12]
    ; ebx points to end of array
    mov ebx,[ebp+12]
    sub ebx,4
    add ebx,[ebp+8]
    
    ;loop for reverseArrayMain
    reverse: 
      ; edx is a temp1
      ; esi is a temp2
      mov edx,[ebx]
      mov esi,[eax]
      mov [ebx],esi
      mov [eax],edx

      add eax,4
      sub ebx,4
      loop reverse

    ; pop previously preserved registers and pointers/address
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ; end popping

    ret
;end reverseArrayMain



lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h



