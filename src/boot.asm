[org 0x7c00]


mov si, message
call print

mov dx, 0xcafe
call print_hex
jmp $

%include "print.asm"
%include "print_hex.asm"

message db "Hello my friend", 13, 10, 0

times 510-($-$$) db 0
dw 0xaa55