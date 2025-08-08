; Display 80 stars in given rows using count-controlled loops
.model small
.stack 100h
.data
m  db 0Dh,0Ah, "Enter number of rows (2, 4, or 5): $"
newline db 0Dh,0Ah, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    ;prompt
    mov ah,9
    lea dx,m
    int 21h 
    
    ;read character
    mov ah,1
    int 21h 
    sub al,'0' ;convert ascii to number
    mov bl,al 
     
     ;newline
     mov ah,9
     lea dx,newline
     int 21h
    ;calculate stars per row =80/rows
    
    mov ax,80
    mov dx,0    ;remainder
    mov cl,bl
    mov ch,0
    div cx    ;AX/CX=AX,DX=remainder
    mov bh,al ;BH=stars per row(quatient)  
    
    ;outer loop
    mov dh,bl  ;DH=row counter
    row_loop:
    push dx      ;save rowcounter
    
    mov cl,bh    ;stars counter
    inner_loop:
    mov ah,2
    mov dl,'*'
    int 21h 
    
    loop inner_loop
    mov ah,9
    lea dx,newline
    int 21h  
     pop dx
    dec dh
  
    jnz row_loop
    
    
    
  
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
