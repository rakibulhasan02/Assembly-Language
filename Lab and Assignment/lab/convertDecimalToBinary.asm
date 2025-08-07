;convert decimal to binary
.model small
.stack 100h
.data
m db "Binary of 13 is: $"
nw db 0dh,0ah,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
     ;show message 
     mov ah,9
     lea dx,m
     int 21h   
     
     ;convert decimal 13 to binary using stack
     
     mov ax,13   ;Number to convert 
     xor cx,cx ;count of bits,initially zero
     
     convert_loop:
     xor dx,dx  ;clear remainder
     mov bx,2
     div bx  ;AX/2 --Quotient in AX,Remainder in DX
     push dx  ;push remainder(0 or 1)
     inc cx   ;count how many bits pushed
     cmp ax,0
     jne convert_loop
     
     
     
     print_binary:
     pop dx
     add dl,'0'  ;convert asci
     mov ah,2
     int 21h
     loop print_binary
     
     
     
    
    
    ;exit
    mov ah,4ch
    int 21h
    
main endp
end main
