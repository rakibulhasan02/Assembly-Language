;Example 6.9 Write some code to count the number of characcters In n input line. 
.model small
.stack 100h
.data
.code
main proc
    mov dx,0  ;dx count character
    mov ah,1   ;prepare to read
    int 21h     ;character in al
    
    while:
    cmp al,0dh
    je end_while
    inc dx
    int 21h
    jmp while
    
    end_while:
    mov ah,4ch
    int 21h
    main endp
        end main
    