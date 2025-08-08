;Write a program to input hex-digit character and if the user fails to enter a hex-digit character
;in three tries,display a message and terminate the program
.model small
.stack 100h
.data
m db 0dh,0ah,"Enter a hex digit(0-9,A-F): $"
m1 db 0dh,0ah,"You entered: $"
m2 db 0dh,0ah,"Invalid input 3 times. Terminating....$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,3
    loop_:
    ;prompt
    mov ah,9
    lea dx,m
    int 21h
    ;read character
    mov ah,1
    int 21h
    mov bl,al
    
    ;check 0-9
    cmp bl,'0'
    jb invalid
    cmp bl,'9'
    jbe valid
    
    ;check A-F
    cmp bl,'A'
    jb chksml
    cmp bl,'F'
    jbe valid
    
    chksml:
    cmp bl,'a'
    jb invalid
    cmp bl,'f'
    jbe valid
    
    invalid:
    loop loop_
    
    ;if all 3 tries failed
    mov ah,9
    lea dx,m2
    int 21h
    jmp exit
     
     valid:
     mov ah,9
     lea dx,m1
     int 21h
     mov ah,2
     mov dl,bl
     int 21h
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
main endp
end main
