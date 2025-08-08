.model small
.stack 100h
.data
m db "Enter number of rows: $"
s equ 80     ; number of stars per row

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Ask for number of rows
    mov ah,9
    lea dx,m
    int 21h

    mov ah,1       ; read one char from keyboard
    int 21h
    sub al,48     ; convert ASCII to number
    mov bl,al      ; store row count in BL

    call newline

    mov bh,0       ; clear upper byte
    mov cx,bx      ; CX = number of rows

outer_loop:
    push cx        ; save row counter

    mov cx,s       ; CX = number of stars
inner_loop:
    mov ah,2
    mov dl,'*'
    int 21h
    loop inner_loop

    call newline
    pop cx         ; restore row counter
    loop outer_loop

    ; Exit
    mov ah,4Ch
    int 21h

main endp

; Newline procedure
newline proc
    mov ah,2
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h
    ret
newline endp
end main
