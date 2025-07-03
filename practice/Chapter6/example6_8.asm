;Example 6.8 Write a count-controlled loop to display a row of 80 stars.
.model small
.stack 100h
.data
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov cx,80
    mov ah,2
    mov dl,'*'
    
    top:
    int 21h
    loop top
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main