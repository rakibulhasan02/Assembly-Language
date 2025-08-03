.model small
.stack 100h
.data
msg1 db "Hello World$"
msg2 db "Learning assembly language$" 
nw db 0dh,0ah,"$"

.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    
    ;print 1st string
    mov ah,9
    lea dx,msg1
    int 21h
     
    ;print newline 
    lea dx,nw
    int 21h
     
    ;print 2nd string
    lea dx,msg2
    int 21h
    
    ;dos exit
    mov ah,4ch
    int 21h
main endp
end main