.model small
.stack 100h
.data 
msg db "Enter three initials : $"  
a db ?
b db ?
c db ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    
   ;print ?
   mov ah,2
   mov dl,'?'
   int 21h
   
   ;print newline
   call newline
   
   ;print msg
   mov ah,9
   lea dx,msg
   int 21h
   
   ;read three initials
   mov ah,1
   int 21h
   mov a,al
   int 21h
   mov b,al
   int 21h
   mov c,al
   ;newline print
   call newline
   
   ;loop
   mov cx,11     ;row counter
   mov si,0     ;row index=si
   row_loop:
   push cx  ;same row counter
   
   mov cx,11  ;  column counter
   mov di,0    ;column index=di
   
   col_loop:
   ; cheack if row==5
   mov ax,si
   cmp ax,5
   jne print_star
   
   ;cheack column
   cmp di,4
   je print_a
   cmp di,5
   je print_b
   cmp di,6
   je print_c
   
   print_star:
   mov ah,2
   mov dl,'*'
   int 21h 
   jmp next_col
   
   print_a:
   call beep
   mov ah,2
   mov dl,a
   int 21h
   jmp next_col
   
   print_b:
   call beep
   mov ah,2
   mov dl,b
   int 21h
   jmp next_col
   
   print_c:
   call beep
   mov ah,2
   mov dl,c
   int 21h
   jmp next_col
   
   next_col:
   inc di  ;column ++
   loop col_loop
   
   call newline
   
   inc si  ;row++
   pop cx ;restore row counter
   loop row_loop
   
   
    
   ;exit
   mov ah,4ch
   int 21h 
main endp
newline proc
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    ret
newline endp 
beep proc
    mov ah,2
    mov dl,7
    int 21h
    ret
beep endp
end main
