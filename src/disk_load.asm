disk_load:
    pusha
    push dx

    mov ah, 0x02; specify read instruction
    mov al, dh; number of sectors to read
    mov cl, 0x02; first sector
    mov ch, 0x00; cylinder number
    mov dh, 0x00; head number

    int 0x13
    jc disk_error

    pop dx
    cmp al, dh
    jne sector_error

    popa 
    ret

disk_error:
    mov si, DISK_ERROR
    call print
    mov dh, ah
    call print_hex
    jmp disk_load

    DISK_ERROR:
        db "Disk read error", 0

sector_error:
    mov bx, SECTOR_ERROR
    call print

SECTOR_ERROR:
    db "Sector read error", 0