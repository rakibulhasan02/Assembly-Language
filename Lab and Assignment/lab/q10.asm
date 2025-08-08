;write a program using stack to input a string and reverse it
.model small
.stack 100h
.data
    m1 db 0Dh, 0Ah, 'Enter a string (end with Enter): $'
    nw db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax
    ;prompt
    mov ah,9
    lea dx,m1
    int 21h
   ; xor cx,cx ;cx=counter for number of character
   mov cx,0
    loop_:
    ;read character
    mov ah,1
    int 21h
    cmp al,0dh    ;carriage
    je reverse
    
    ;else
    push ax    ;save character on stack
    inc cx     ;count character
    jmp loop_
    
    reverse:
    ;print newline
    mov ah,9
    lea dx,nw
    int 21h
 
 print:
    ;check if anything left to print
    cmp cx,0
    je exit
    
    pop dx ;get character from stack
    mov ah,2
    int 21h
    dec cx
    jmp print
    
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main
