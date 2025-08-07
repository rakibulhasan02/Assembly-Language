 ;Write a program to read a character. and if it's an uppercase letter,display it
.model small
.stack 100h
.data
m   db "Enter a characters: $"
nw  db 0dh, 0ah, "$"
m1  db 0dh, 0ah, "print character: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt 
    mov ah,9
    lea dx,m
    int 21h
    
    ;read a character
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'A'
    jl exit
    cmp bl,'Z'
    jg exit
    jmp print
    
    print:
    mov ah,9
    lea dx,m1
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
main endp
end main
