;write a program to read a chracter and if its 'y' or 'Y',display it otherwise terminate the program

.model small
.stack
.data
m db "Enter a character: $"
nw db 0dh,0ah,"$"
m1 db 0dh,0ah,"The program is terminated$"
m2 db 0dh,0ah,"Display : $"
.code
main proc
    mov dx,@data
    mov ds,dx
    
    mov ah,9
    lea dx,m
    int 21h
    
    ;read character
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'y'
    je display
    cmp bl,'Y'
    je display
    jmp exit
    
    display: 
    mov ah,9
    lea dx,m2
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
   
     
    
   
    exit:
    mov ah,9
    lea dx,m1
    int 21h 
    mov ah,4ch
    int 21h
main endp
end main