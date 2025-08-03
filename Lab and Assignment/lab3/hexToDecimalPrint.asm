.model small
.stack 100h
.data
msg1 db "Enter a hex digit(A-F): $"
msg2 db 0dh,0ah,"In decimal it is : 1$"

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input
    mov ah,1
    int 21h
    sub al,17
    mov bl,al
    
    ;newline print
    call newline_print
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2
    mov dl,bl
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