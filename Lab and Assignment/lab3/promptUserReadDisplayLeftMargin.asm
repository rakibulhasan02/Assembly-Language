.model small
.stack 100h
.data
msg1 db 0dh,0ah,"Enter 3 initials : $"

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    ;print massage
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h ;read space
    
    int 21h 
    mov cl,al
    
    int 21h
    
    int 21h
    mov bh,al
    
    ;newline print
    call newline_print
    
    ;print first initial
    mov ah,2
    mov dl,bl
    int 21h
    
    call newline_print
    
    mov dl,cl
    int 21h
    
    call newline_print
    
    mov dl,bh
    int 21h
    
    
   
    
    ;dos exit
    mov ah,4ch
    int 21h
main endp  
newline_print proc
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    ret
newline_print endp
end main