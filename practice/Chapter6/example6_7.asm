;Example 6.7 Read a character. If it's "y" or "Y", display it; otherwise, terminate the program.

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
       
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input character
  
    mov ah,1
    int 21h
    
   
    cmp al,'y'
    je display
    cmp al,'Y'
    je display
    jmp exit
    
    display:
    mov ah,2
    mov dl,al
    int 21h
    jmp exit
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main