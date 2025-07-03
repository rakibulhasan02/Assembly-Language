;Write a program to (a) prompt the user, (b) read first, middle, and last initials of a person's name, and (c) display them duwn the left margin.
;Sample execution:
;ENTER THRl::E INITIALS: JFK
;J
;f
;K
.model small
.stack 100h
.data
msg1 db "Enter three initials :$"
nw db 0ah,0dh,"$"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;print first massege
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input threee initial char
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al
    
    int 21h
    mov cl,al
     
      ;print newline
     mov ah,9
     lea dx,nw
     int 21h 
    
    ;print 1st character
     mov ah,2
     mov dl,bl
     int 21h
     
     ;print newline
     mov ah,9
     lea dx,nw
     int 21h 
     
     ;print 2nd character
     mov ah,2
     mov dl,bh
     int 21h
     
     ;print newline
     mov ah,9
     lea dx,nw
     int 21h 
     
     ;print 3rd character
     mov ah,2
     mov dl,cl
     int 21h
     
    
    
    
    ;exit dos
    mov ah,4ch
    int 21h
    
    main endp
end main