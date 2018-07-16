print_hex:
    pusha
    std

    mov cx, 4
    mov di, hex_out + 5

hexLoop:
    mov ax, dx
    and ax, 0x000f

    add al, 0x30
    cmp al, 0x39
    jle step2
    add al, 7

step2:
    stosb
    ror dx, 4
    loop hexLoop

finish:
    cld

    mov si, hex_out
    call print

    popa
    ret

hex_out db '0x0000', 0