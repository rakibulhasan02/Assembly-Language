;Example 6.5: If AL contains I or 3, display "o"; if AL contains 2 or 4,dlisplay "e".        
.model small
.stack 100h
.data 
msg1 db "Enter a number : $"
msg2 db 0ah,0dh,"Display : $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    ;input number
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    ;case 1,3
    cmp bl,1
    je odd
    cmp bl,3
    je odd
    
    ;case 2,4
    cmp bl,2
    je even
    cmp bl,4
    je even
    jmp exit
    
    ;odd
    odd:
    mov ah,9
    lea dx,msg2
    int 21h 
    
    mov ah,2
    mov dl,'o'
    int 21h 
    jmp exit
    
    ;even 
    even:
      mov ah,9
    lea dx,msg2
    int 21h
    mov ah,2
    mov dl,'e'
    int 21h 
    jmp exit
    
    
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main