.model small
.stack 100h
.data
    newline db 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 80h     ; ???? ???
    mov si, 0       ; ???? ????????

print_loop:
    mov dl, cl      ; ????????????? dl-? ????
    mov ah, 02h
    int 21h         ; ?????

    ; ????? ?????
    mov dl, ' '
    int 21h

    inc si          ; ????? ???? ???? ???????????
    cmp si, 10
    jne skip_line

    ; ???? ?????
    lea dx, newline
    mov ah, 09h
    int 21h

    mov si, 0       ; ????? ???? ????????

skip_line:
    inc cx
    cmp cx, 0FFh
    jbe print_loop

    ; ????? ??????????? FFh ?????
    mov dl, 0FFh
    mov ah, 02h
    int 21h

    ; ????????? ???
    mov ah, 4Ch
    int 21h
main endp
end main
