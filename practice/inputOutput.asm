.model small
.stack 100h
.data
.code
main proc
    ;input first number
    mov ah,1 ;read char
    int 21h
    mov bl,al ;save char in bl
    
    ;input second number
    mov ah,1
    int 21h
    mov bh,al
    
    ;print first number
    mov ah,2 ;print char
    mov dl,bl
    int 21h
    
    ;print second number
    mov ah,2
    mov dl,bh
    int 21h
    
    main endp
end main