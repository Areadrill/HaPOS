[org 0x7c00]

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 2
call disk_load

mov dx, [0x9000 + 512]
call print_hex

mov si, message
call print

mov dx, 0xcafe
call print_hex
jmp $

%include "print.asm"
%include "print_hex.asm"
%include "disk_load.asm"

message db "Hello my friend", 13, 10, 0

times 510-($-$$) db 0
dw 0xaa55

times 256 dw 0xdada
times 256 dw 0xface