;Example 6.2 Replace.the number in AX by its absolute value.

.model small
.stack 100h
.data
.code
main  proc 
    mov ah,1
    int 21h
    
   mov bl,al
    cmp bl,0
    jnl exit
    
    neg bl 
    
    ;print ax
    mov ah,2
    mov dl,bl
    int 21h
    
    
     exit:
     mov ah,4ch
     int 21h
    
    
    
    
    
   
   
     
     
     main endp
end main
