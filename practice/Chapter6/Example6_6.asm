;Example 6.6 : Read a character, and if it's an uppercase letter, display it.

.model small
.stack 100h
.data 
 msg1 db 0ah,0dh,"Enter a charecter : $" 
 msg2 db 0ah,0dh,"The upper case letter is $"
 nw db 0ah,0dh,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;display first message 
       end_if:
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input character
  
    mov ah,1
    int 21h
    
    ;A<=char and A>=char
    cmp al,'A'
    jnge end_if   ;A<=char
    
    cmp al,'Z'
    jnle end_if   ;A>=char
    
    ;then display 
    ;mov ah,9
    ;lea dx,nw
    ;int 21h
    
    mov dl,al
    mov ah,2
    int 21h
    
    
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main