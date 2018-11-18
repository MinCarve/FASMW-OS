mov ax, 9ch
mov ss, ax
mov sp, 4096d
mov ax, 7c0h
mov ds, ax
;----------------------------------------------------------
mov ah, 09h
mov cx, 1000h
mov al, 20h
mov bl, 09h
int 10h


mov ah, 09h
mov cx, 80d
mov al, 20h
mov bl, 87h
int 10h


;--------------------------------
mov ah, 01h
mov cx, 07h
int 10h

mov bl, 0h
mov cl, 0h

_mouser:
mov ah, 02h
mov dl, bl
mov dh, cl
int 10h
mov ah, 00h
int 16h
mov ah, 08h
int 16h
cmp al, 77h
je _up
cmp al, 73h
je _down
cmp al, 61h
je _left
cmp al, 64h
je _right
cmp al, 20h
je _click
jmp _mouser

_up:
cmp cl, 0h
je _mouser
sub cl, 1h
jmp _mouser

_down:
cmp cl, 24d
je _mouser
add cl, 1h
jmp _mouser

_left:
cmp bl, 0h
je _mouser
sub bl, 1h
jmp _mouser

_right:
cmp bl, 79d
je _mouser
add bl, 1h
jmp _mouser


_click:
mov ah, 0eh
mov al, 37h
int 10h
jmp _mouser

;--------------------------------

printstring:
lodsb
cmp al, 24h
je printstring_eof
mov ah, 0eh
int 10h
jmp printstring

printstring_eof:
ret

msg db 'Hello, World!$'
;----------------------------------------------------------
times 510-($-$$) db 0
dw 0xAA55
