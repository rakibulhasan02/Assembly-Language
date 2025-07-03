;Write· a program to read one of the hex digits A-I', and <.lisplay it on the next line in decimal.
;Sample execution:
;Enter a hex digit : C
;IN DECIMAL IT is 12 

.model small
.stack 100h
.data
msg1 db "Enter a hex digit : $"
msg2 db "In decimal it is $"
nw db 0ah,0dh,"$"

.code
main proc 
     mov ax,@data
     mov ds,ax
     
     ;print 1st msg
     mov ah,9
     lea dx,msg1
     int 21h
     
     ;input 1st character
     mov ah,1
     int 21h
     sub al,17
     mov bl,al
   
     
     ;print newline
     mov ah,9
     lea dx,nw
     int 21h
     
     ;print 2nd msg
     lea dx,msg2
     int 21h
     
     ;print 1 and others
     mov ah,2
     mov dl,'1'
     int 21h
     mov dl,bl
     int 21h
     
    
    
    ;dos exit
    mov ah,4ch
    int 21h
    
    main endp
end main



