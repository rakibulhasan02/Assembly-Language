.model small
.stack 100h
.data
m1 db 'Loop concept$' 
m2 db 10,13,'$' 
m3 db 10,13,'Print A to Z :$'

.code
main proc
    mov ax,@data
    mov ds,ax
     ;loop concept
    mov ah,9
    lea dx,m1
    int 21h 
    
    
    
   
    mov cx,10
    mov ah,1
    
    level1:
    int 21h
    inc al
    loop level1
    
     
    mov ax,4ch
    int 21h
    
    main endp
end main
