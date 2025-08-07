;Display a '?' and read two decimal digit whose sum less than 10 and display their sum as result
.model small
.stack
.data
m db "Enter two decimal digit : $"
nw db 0dh,0ah,"$"
m1 db "Sum : $"

.code
main proc
    mov dx,@data
    mov ds,dx
    
    ;print '?'
    mov ah,2
    mov dl,'?'
    int 21h
   ;read two decimal digit
   mov ah,1
   int 21h
   mov bl,al
   int 21h
   mov cl,al
   
   ;sum
    add cl,bl 
    sub cl,48
    ;newline
    mov ah,9
    lea dx,nw
    int 21h
    ;print prompt
    
    lea dx,m1
    int 21h
    ;print result
    mov ah,2
    mov dl,cl
    int 21h
    
    
    
    ;exit
    mov ah,4ch
    int 21h
main endp
end main