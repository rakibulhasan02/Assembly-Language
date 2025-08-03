.model small
.stack 100h
.data
a db ?
.code
main proc
    ;input mode
    mov ah,1
    int 21h
    mov a,al
    
    ;newline
    mov ah,2
    mov dl,0dh   ;carriage return (CR)
    int 21h
    mov dl,0ah   ;line feed(LF)
    int 21h
    
    ;display value
    mov dl,a
    int 21h
    
    ;dos exit
    mov ah,4ch
    int 21h
   
main endp
end main