.model small
.stack 100h
.data
m1 db 'Enter first value : $'
m2 db 10,13,'Enter second value : $' 
m3 db 10,13,'Subtraction of a and b(c=a-b) : $'
m4 db 10,13,'c = $'
a db ?
b db ?
c db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
     .
     ;input first value
    mov ah,1
    int 21h
    sub al,48
    mov a,al 
    
     mov ah,9
    lea dx,m2
    int 21h 
    
    ;input second value
    mov ah,1
    int 21h
    sub al,48
    mov b,al
      
     mov ah,9
     lea dx,m3 
     int 21h
     lea dx,m4
     int 21h 
      
     ;sum a-b 
    mov ah,2
    mov dl,a
    sub dl,b
    add dl,48 
    int 21h 
    
   
    
    
    mov ax,4ch
    int 21h
    
    main endp
end main
    
    
                      
                      
    