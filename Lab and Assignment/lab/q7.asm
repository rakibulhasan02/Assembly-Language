 ;Write a program to display a '?',read two capital  letters,and display them on next line in alphabetical order
.model small
.stack 100h
.data
m   db "Enter a characters: $"
nw  db 0dh, 0ah, "$"
m1  db 0dh, 0ah, "print character: $"
a db ?
b db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;print '?'
    mov ah,2
    mov dl,'?'
    int 21h
    
   
    
    ;read two character
    mov ah,1
    int 21h
    mov bl,al
    int 21h 
    mov cl,al
    cmp cl,bl
    jl print_cl
     
    jmp print_bl
    
    print_cl: 
     ;print newline
     mov ah,9
     lea dx,nw
     int 21h
     
   mov ah,2
   mov dl,cl
   int 21h
   mov dl,bl
   int 21h 
    jmp exit
    
    
    print_bl: 
     ;print newline
     mov ah,9
     lea dx,nw
     int 21h
     
    mov ah,2
    mov dl,bl
    int 21h
    mov dl,cl
    int 21h
    
    
    exit:
    mov ah, 4ch
    int 21h
main endp
end main
