.model small
.stack 100h
.data
msg1 db "The sum of $"
msg2 db " and $"
msg3 db " is $"
nw db 0ah,0dh,"$"

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    ;print ?
    mov ah,2
    mov dl,"?"
    int 21h
    
    ;input 1st 
    mov ah,1
    int 21h
    mov bl,al
    ;input 2nd
    int 21h
    mov cl,al
    mov dl,al  
    
    ;add 1st and 2nd
    add dl,bl
    sub dl,48
    mov bh,dl
    
    ;print new line
    mov ah,9
    lea dx,nw
    int 21h 
    ;print msg1
    lea dx,msg1
    int 21h
    
    ;print 1st value
    mov ah,2
    mov dl,bl
    int 21h 
    ;print 2nd msg 
    mov ah,9
    lea dx,msg2
    int 21h
    
    ;print 2nd value
    mov ah,2
    mov dl,cl
    int 21h
    
    ;print msg 3
    mov ah,9
    lea dx,msg3
    int 21h
     
     ;print sum of number
    mov ah,2
   
    mov dl,bh
    int 21h
    
    
    
     
     
   
    ;dos exit
    mov ah,4ch
    int 21h
    
    main endp
end main