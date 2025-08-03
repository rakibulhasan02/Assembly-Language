.model small
.stack 100h
.data
msg1 db "Enter two number: $"
msg2 db "sub of two value: $"
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
    mov cl,al
    
    sub bl,cl
     add bl,48
     
     ;print newline
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h 
    ;print sub
    mov ah,2
    mov dl,bl
    int 21h
    
    
    ;dos exit
    mov ah,4ch
    int 21h
main endp 
end main