.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 10          ; Outer loop: 10 rows

outer_loop:
    push cx             ; Save outer loop counter

    mov cx, 10          ; Inner loop: 10 columns
inner_loop:
    mov ah, 2
    mov dl, '*'         ; Print '*'
    int 21h

    ; Optional: print space after *
    mov dl, ' '
    int 21h

    loop inner_loop

    call new_line       ; Move to next line

    pop cx              ; Restore outer loop counter
    loop outer_loop

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; Procedure to print new line
new_line proc
    mov ah, 2
    mov dl, 0Dh         ; Carriage return
    int 21h
    mov dl, 0Ah         ; Line feed
    int 21h
    ret
new_line endp

end main
