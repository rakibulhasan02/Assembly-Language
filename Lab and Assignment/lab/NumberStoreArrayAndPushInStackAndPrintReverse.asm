;A program that uses array to store 5 numbers and push in stack and print reverse order
.model small
.stack 100h
.data
arr db 5 dup(?) ;array to store user input(5 characters)
len equ 5
msg db "Enter 5 character: $"
nw db 0dh,0ah,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    ;display prompt
    mov ah,9
    lea dx,msg
    int 21h
    
    ;Take 5 character input from user and store in array
    mov cx,len  ;
    mov si,0
    input_loop:
    mov ah,1
    int 21h
    mov arr[si],al  ;store in array
    push ax  ;also push on stack
    inc si
    loop input_loop
    
    ;pop characters back (reverse) into array
    mov cx,len
    mov si,0
    reverse_loop:
    pop ax
    mov arr[si],al
    inc si
    loop reverse_loop
    
    ;newline before output
    mov ah,9
    lea dx,nw
    int 21h
    
    ;display reverse array
    mov cx,len
    mov si,0
    display_loop:
    mov dl,arr[si]
    mov ah,2
    int 21h
    inc si
    loop display_loop
    
    ;exit
    mov ah,4ch
    int 21h
main endp 
end main
