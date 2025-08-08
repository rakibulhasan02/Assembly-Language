;Write a program to read a character and display it,as well a convert uppercase to lowercase letter and vice versa.
.model small
.stack 100h
.data
m db 0dh,0ah,"Enter a uppercase letter: $"
m1 db 0dh,0ah,"Enter a lowercase letter: $"
m2 db 0dh,0ah, "Lower case: $"
m3 db 0dh,0ah,"Upper case: $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m
    int 21h
    mov ah,1
    int 21h 
    add al,32
    mov bl,al  
    
    ;call newline   
    
    mov ah,9
    lea dx,m1
    int 21h
    mov ah,1
    int 21h 
    sub al,32
    mov cl,al
    
     ;call newline 
     
     mov ah,9
     lea dx,m2
     int 21h
     mov ah,2
     mov dl,bl
     int 21h
     
     ;call newline 
     mov ah,9
     lea dx,m3
     int 21h
     mov ah,2
     mov dl,cl
     int 21h
    
    ;exit
    mov ah,4ch
    int 21h
main endp

end main
