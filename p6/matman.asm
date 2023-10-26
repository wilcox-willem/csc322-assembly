; WILLEM WILCOX
; Program 6
; 10/25/23
; If you're reading this, have a wonderful morning/evening/night! :)

ROWS: EQU 5 ; constant for number of rows.
COLS: EQU 7 ; constant for number of columns.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
; test matrix below
MyMatrix: dd   1,  2,  3,  4,  5,  6,  7
          dd   8,  9, 10, 11, 12, 13, 14
          dd  15, 16, 17, 18, 19, 20, 21
          dd  22, 23, 24, 25, 26, 27, 28
          dd  29, 30, 31, 32, 33, 34, 35

CurrentRow: dd ROWS
CurrentCol: dd COLS

SECTION .bss
; define uninitialized data here
RowSums: RESD ROWS
ColSums: RESD COLS
Sum: RESD 1

SECTION .text
global _main
_main:

  ; This loop starts from the furthest item and works it way to the first

  ; start first loop (for columns)
  col_loop:
        ; first, check if curr col is within bounds
        dec dword[CurrentCol]
        mov eax,[CurrentCol]
        cmp eax,-1
        jng exit_loops

	
        mov dword[CurrentRow],ROWS ; reset ROWS counter

  ; start second loop (for rows)
  row_loop:
        ; first, check if curr row is within bounds, if not do a col loop
        dec dword[CurrentRow]
        mov eax,[CurrentRow]
        cmp eax,-1
        jng col_loop

        ; row_loop main
        mov eax,[CurrentRow] ; begin prepping index val
        mov ebx,COLS
        mul ebx ; multiply 
        add eax,[CurrentCol]
        mov edx,MyMatrix ; add address of MyMatrix to index

        mov ecx,[edx + eax * 4] ; ecx now holds current matrix item
        add dword[Sum],ecx ; update sum

        mov eax,[CurrentRow]
        mov edx,RowSums
        add [edx + eax * 4],ecx ; update RowSum

        mov eax,[CurrentCol]
        mov edx,ColSums
        add [edx + eax * 4],ecx ; update ColSum

        jmp row_loop

exit_loops:


lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


