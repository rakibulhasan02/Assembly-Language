.model small
.stack 100h
.data
msg1 db 0dh,0ah,"The sum of $"
msg2 db " and $"
msg3 db " is $"
a db ?
b db ?
c db ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;display  ?
    mov ah,2
    mov dl,'?'
    int 21h 
    
    ;read two decimal digit
    mov ah,1
    int 21h
    mov a,al
    
    int 21h
    mov b,al
    mov bl,al 
    
    ;display line
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,2
    mov dl,a
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2
    mov dl,b
    int 21h
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    add bl,a
    sub bl,48
    
    mov ah,2
    mov dl,bl
    int 21h
    
    
    
    
   
    
    ;dos exit
    mov ah,4ch
    int 21h
main endp 
end main