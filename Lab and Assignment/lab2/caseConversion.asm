.model small
.stack 100h
.data
m1 db 'Enter a upper charracter : $'
m2 db 10,13, 'Lower charrecter is : $'
m3 db 10,13,'Upper charracter is : $'
c db ? 



.code
main proc
    mov ax,@data
    mov ds,ax 
    
     ;print 1st message
    mov ah,9
    lea dx,m1
    int 21h 
    
    ;input charrecter  
    mov ah,1 
    int 21h
    add al,32
    mov c,al  
     
     
          
    ;print newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;print 2nd message 
    mov ah,9
    lea dx,m2
    int 21h
    
    ;convert upper to lower
    
    mov ah,2
    mov dl,c
    int 21h 
    
   
    
    mov ah,9
    lea dx,m3
    int 21h;
    
    ;convert into upercase letter
    
    mov ah,2
    sub c,32
    mov dl,c
    int 21h
    
    
    
    
    
    
    
    
    mov ax,4ch
    int 21h
    
    main endp
end main