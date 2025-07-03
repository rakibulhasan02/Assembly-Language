;Example 6.10 Write some code to read characters until a blank is read.
.model small
.stack 100h
.data
.code
main proc
    mov ah,1 ;prepare to read
    repeat:
    int 21h    ;character  in al
    cmp al,' '  ;a blank?
    jne repeat  ;no keep reading
   
    end_while:
    mov ah,4ch
    int 21h
    main endp
        end main
    