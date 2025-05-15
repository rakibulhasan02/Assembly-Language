.model small
.stack 100h
.data
msg db 'I love Bangladesh$'
msg1 db 10,13,'I hate India$'
.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,msg
    int 21h 
    
    lea dx,msg1
    int 21h

    mov ax,4ch
    int 21h

    main endp
    end main