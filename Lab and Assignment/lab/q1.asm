;Write a program to read a character and display it,as well a convert uppercase to lowercase letter and vice versa.
.model small
.stack 100h
.data
m db "Enter a upper case letter :$"
nl db 0dh,0ah,"$"
m1 db "Lower case: $"
m2 db "Upper case: $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;print prompt
    mov ah,9
    lea dx,m
    int 21h
    ;read character
    mov ah,1
    int 21h  
    
    add al,32    ;upper case to lower case
    mov bl,al    
    sub al,32     ;lower to upper case
    mov  cl,al
    
    ;newline
    mov ah,9 
    lea dx,nl
    int 21h
    ;print lower case
    lea dx,m1
    int 21h
   
    mov ah,2
    mov dl,bl
    int 21h 
    ;newline
    mov ah,9 
    lea dx,nl
    int 21h 
    
      ;print upper case
    lea dx,m2
    int 21h
   
    mov ah,2
    mov dl,cl
    int 21h  
    
    ;exit
    mov ah,4ch
    int 21h
main endp
end main