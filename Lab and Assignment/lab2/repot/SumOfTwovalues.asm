.model small
.stack 100h
.data
msg1 db "Enter two number(0-9): $"
msg2 db "sum of two value: $"
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;print msg1
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input two number
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    add al,bl
    sub al,48
    mov cl,al
     
     ;print newline
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h 
    ;print sum
    mov ah,2
    mov dl,cl
    int 21h
    
    
    ;dos exit
    mov ah,4ch
    int 21h
main endp 
end main