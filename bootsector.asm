[org 0x7c00] ;Sets origin to 0x7c00, where the BIOS loads the boot sector


mov ah, 0x0e ;Set the teletype output function for BIOS interrupts
mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al , [0x7ffe]
int 0x10

jmp $



times 510-($-$$) db 0 ;Fill the rest of the boot sector with zeros until we reach 510 bytes
dw 0xaa55 ;Last two bytes of the boot sector must be 0xAA55 to indicate a valid boot sector