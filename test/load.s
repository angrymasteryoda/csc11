.global main
main:
	adr r0, value
	mov r1, #15
exit:
	mov r7, #15
	swi 0
	
value: .word 255