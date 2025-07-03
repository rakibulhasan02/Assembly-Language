.model small
.stack 100h

.data
    prompt db "Enter a line of text: $"
    input db 100 dup('$')        ; buffer for input
    no_caps db 13, 10, "No capital letters$"
    first_msg db 13, 10, "First capital letter alphabetically: $"
    last_msg db 13, 10, "Last capital letter alphabetically: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print prompt
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Read input (up to 100 chars)
    mov ah, 0Ah
    lea dx, input
    int 21h

    ; Initialize min and max to 0 (no capital found yet)
    mov bl, 0      ; min
    mov bh, 0      ; max

    ; Start scanning characters
    lea si, input+2  ; input+2 = start of actual user input
    mov cl, [input+1] ; number of chars entered
    xor ch, ch        ; clear upper byte for loop counter

scan_loop:
    mov al, [si]
    cmp al, 'A'
    jl skip_char
    cmp al, 'Z'
    jg skip_char

    ; It's a capital letter
    cmp bl, 0
    je set_first    ; if first capital

    ; Update min (bl) and max (bh)
    cmp al, bl
    jb set_min
    cmp al, bh
    ja set_max
    jmp skip_char

set_first:
    mov bl, al
    mov bh, al
    jmp skip_char

set_min:
    mov bl, al
    jmp skip_char

set_max:
    mov bh, al
    jmp skip_char

skip_char:
    inc si
    loop scan_loop

    ; Show result
    cmp bl, 0
    je no_capitals

    ; Print first message
    mov ah, 9
    lea dx, first_msg
    int 21h

    mov dl, bl
    mov ah, 2
    int 21h

    ; Print last message
    mov ah, 9
    lea dx, last_msg
    int 21h

    mov dl, bh
    mov ah, 2
    int 21h

    jmp exit

no_capitals:
    mov ah, 9
    lea dx, no_caps
    int 21h

exit:
    mov ah, 4ch
    int 21h
end main
