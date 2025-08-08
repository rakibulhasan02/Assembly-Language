;Write a program that will prompt the user to enter a hex digit character("0"--"9 or 
 ;"A"--"F"). Display it on the next line in decimal and ask the user i.i he or she wants
;to do it agains .if the user types "Y" or "y". The program repeats . If the user types anything
;Else,the program terminates. If the user enters an illigal character, prompt the user to try again 
.model small
.stack 100h
.data
m1 db 0dh,0ah,"Enter a hex digit (0-9 or A-F): $"
m2 db 0dh,0ah,"Decimal value: $"
m3 db 0dh,0ah,"Invalid input. Try again.$"
m4 db 0dh,0ah,"Do you want to try again? (y/Y): $"
nw db 0dh,0ah,"$"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    start:
    ;prompt
    mov ah,9
    lea dx,m1
    int 21h
    
    ;read a character
    mov ah,1
    int 21h
    mov bl,al
    mov cl,al
    
    ;0-9
    cmp bl,'0'
    jb invalid
    cmp bl,'9'
    jbe print1
    ;A-F
    cmp cl,'A'
    jb invalid
    cmp cl,'F'
    ja invalid
    jmp print2
    
    
    print1:
    mov ah,9
    lea dx,m2
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    jmp try_again
    
    print2:
    mov ah,9
    lea dx,m2
    int 21h
    mov ah,2
    mov dl,'1'
    int 21h
    sub cl,17
    mov ah,2
    mov dl,cl
    int 21h
    jmp try_again
    
    invalid:
    mov ah,9
    lea dx,m3
    int 21h
    
    try_again:
    mov ah,9
    lea dx,m4
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    cmp bl,'y'
    je start
    cmp bl,'Y'
    je start
     
     ;exit
     mov ah,4ch
     int 21h

main endp
end main
