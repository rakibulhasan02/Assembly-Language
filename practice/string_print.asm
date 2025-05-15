.model small 
.stack 100h
.data
msg db "Hello world$"
.code
main proc  
    
    
    
    ;initialize data segment 
    mov ax,@data
    mov ds,ax
    
    
    ;string processing
    mov ah,9
    lea dx,msg
    int 21h
    
    
    ;return dos
     mov ah,4ch
     int 21h
    
    main endp
end main