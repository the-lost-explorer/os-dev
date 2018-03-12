%include "print.asm"

MAIN:
[org 0x7c00]

	mov bx, BOOT
	call printf	

	mov bx, newline ;print a new line
	call printf 

	mov dx, 0x1aab
	call printh 	
	
	
jmp DONE

;Data
newline:
	db 0x0a, 0x0d, 0

BOOT:
	db 'Booting your OS', 0

DONE:
jmp $
; Padding and magic number.
times 510-($-$$) db 0
dw 0xaa55
