.model small
.stack 100h

.code
main proc  
    
    ;output mode for presenting question mark
    mov ah,2
    mov dl,'?'
    int 21h
        
    ;input mode    
    mov ah,1
    int 21h
    mov bl,al   
    
    
    ;go to the new line
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h

    ;display a character
    mov dl,bl
    int 21h
    
    
    
     ;dos exit
    mov ah,4ch
    int 21h
    
    
    
    main endp
end main
    
    
    