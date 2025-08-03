.model small
.stack 100h
.data 

msg1 db "Enter a upper case character:$"
msg2 db "Upper case to Lower case: $"
msg3 db "Enter a lower case character: $"  
msg4 db "Lower case to Upper case: $"

.code
main proc
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,msg1
     int 21h
     ;input 
     mov ah,1
     int 21h 
     add al,32
     mov bl,al 
     
     ;new line print
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah 
     int 21h
      
      ;input
      mov ah,9
      lea dx,msg3
      int 21h  
      
      mov ah,1
      int 21h
      sub al,32
      mov cl,al
      
         ;new line print
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah 
     int 21h 
      
     ;display lower case character
       mov ah,9
       lea dx,msg2
       int 21h
       
     mov ah,2
     mov dl,bl
     int 21h 
     
       ;new line print
     mov ah,2
     mov dl,0dh
     int 21h
     mov dl,0ah 
     int 21h 
       
       ;display upper case letter
      mov ah,9
      lea dx,msg4
      int 21h 
      
     mov ah,2
     mov dl,cl
     int 21h
     
     
     
    
    
    
    ;dos exit
    mov ah,4ch
    int 21h
    
main endp
end main