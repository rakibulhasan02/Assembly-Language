 ;Write some code to count the number of characters in input line
.model small
.stack 100h
.data
m   db "Enter some characters: $"
nw  db 0dh, 0ah, "$"
m1  db 0dh, 0ah, "No of characters: $"

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt 
    mov ah,9
    lea dx,m
    int 21h
    
    xor bx,bx   ;counter 0
    
    read_:
    mov ah,1
    int 21h
    mov cl,al
    cmp cl,13
    je reading
    
    inc bl
    jmp read_
    
    reading:
    mov ah,9
    lea  dx,m1
    int 21h
    
     add bl,48        ;convert character
     mov ah,2
     mov dl,bl        ;print no of charater
     int 21h
     
    
    
    ; Exit
    mov ah, 4ch
    int 21h
main endp
end main
