[org 0x7c00]


mov ah, 0x0e
mov al, 'H'
int 0x10
mov al, [the_secret]
int 0x10
int 0x10

the_secret:
    db 'E'

times 510-($-$$) db 0
dw 0xaa55