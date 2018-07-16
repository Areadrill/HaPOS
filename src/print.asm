print:
    push ax
    push si
    mov ah, 0x0e

printLoop:
    lodsb

    cmp al, 0
    je end

    int 0x10
    jmp printLoop

end:
    pop si
    pop ax
    ret