.model small 
.stack 100h
.data

msg db "Enter an Uppercase letter:$"
msg1 db 0ah,0dh,"In lowercase letter it is:$"


.code
main proc  
            ;initialize data segment
            mov ax,@data
            mov ds, ax
            
            ;string processing
            mov ah,9
            lea dx,msg
            int 21h
            
            ;input an uppercase letter 
            mov ah,1
            int 21h
            add al,20h
            mov a,al
            
            ;print 2nd messege
            lea dx,msg
            int 21h
            
            
            ;lowercase letter show
            mov ah,2;
            mov dl,a
            
    
    
 
    
    main endp
end main