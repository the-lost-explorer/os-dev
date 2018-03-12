jmp EXIT
printf: 
			mov al, [bx]
			cmp al, 0
			jz ENDPRINTF
			mov ah, 0x0e
			int 0x10
			inc bx
			jmp printf

ENDPRINTF:	
			ret

printh:
					mov cx, 0x0005
	printhloop:		mov bx, dx      ;dx=bx=0x1234 
					and bx, 0xf000	;bx=0x1000
					shr bx, 12		;bx=0x0001
					shl dx, 4		;dx=0x2340
					dec cx
					cmp cx, 0x0000
					je ENDPRINTH
					cmp bx, 0x0009
					jg letter
					add bx, 0x0030
					jmp send
	letter:			add bx, 0x0037
	send:			mov al, bl
					mov ah, 0x0e
					int 0x10
					jmp printhloop

ENDPRINTH:
			ret

EXIT: ;
