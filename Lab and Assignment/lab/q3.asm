;write a program that accepts input and if  al contains 1 or 3,display 'o'
;if al contains 2 or 4,display 'e'
.model small
.stack
.data
m db "Enter a character: $"
nw db 0dh,0ah,"$"


.code
main proc
    mov dx,@data
    mov ds,dx
    
    ;prompt
    mov ah,9
    lea dx,m
    int 21h
    ;read character
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'1'
    je odd
    cmp bl,'3'
    je odd
    
    cmp bl,'2'
    je even
    cmp bl,'4'
    je even
    
   
    
    odd: 
     ;print newline
    mov ah,9
    lea dx,nw
    int 21h
    
    mov ah,2
    mov dl,'o'
    int 21h 
    jmp exit
    
    even:
     ;print newline
    mov ah,9
    lea dx,nw
    int 21h
    
    mov ah,2
    mov dl,'e'
    int 21h
    
   
    exit:
    mov ah,4ch
    int 21h
main endp
end main