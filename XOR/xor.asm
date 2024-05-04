TITLE xor.asm
.model small
.stack 100h
.data
myString db "Proud to be PLMayers","$"
.code
main proc
mov ax,@data
mov ds,ax
mov bx,offset myString
LP1: mov dl,[bx]
Cmp dl, '$'
Je exit
Inc bx
XOR dl, 00100000B
mov ah,02
int 21h
jmp lp1
Exit: Mov ax, 4c00h
Int 21h
Main endp
End main
