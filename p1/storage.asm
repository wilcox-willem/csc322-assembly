; WILLEM WILCOX
; Program 1: Data Storage
; 9/16/23
; What do I listen to when I debug? Rage Against the Compiler

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
;Source is from HWK 5

a: DB 11
b: DW 11b
c: DD 11h
d: DQ 11q
e: DW -5
f: DW 'CSC322'
g: DB 'Howdy'
h: DW 'Howdy'
i: DB 1,2,3
j: dd 10,11,12,13,14

a1: DW 11,13,15,17
b1: DB 11,13,15,18
c1: DD 100,200,300
d1: DQ 12345h

a2: DB -50
b2: DW -45
c2: DB -30
d2: DW -25
e2: DD -20

a3: DB 'Bears'
b3: DD 100
c3: DW 0
d3: DB 'Go '
e3: DB 'Mercer!'

a4: DW 100
b4: DW 100h
c4: DW 100b
d4: DW 100q
e4: DW 100d

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
