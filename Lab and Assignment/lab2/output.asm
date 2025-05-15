.model small
.stack 100h
.code
main proc
;output ?
    mov ah,2
    mov dl,'?'
    int 21h
    ;input character
    mov ah,1
    int 21h
    mov bl,al
    ;print newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    ;print character
    mov dl,bl
    int 21h

    mov ax,4ch;return dos
    int 21h


main endp
end main