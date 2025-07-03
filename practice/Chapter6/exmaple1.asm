.model small
.stack 100h
.data
.code
main proc
    mov ah,2
    mov cx,256   ;number of character to display
    mov dl,0
    
    print_loop:
    
    int 21h  ;display a char
    inc dl ;increment ascii code
    dec cx  ;decrement counter
    
    jnz print_loop
    
    ;dos exit
    mov ah,4ch
    int 21h
    
    
    
    main endp
end main