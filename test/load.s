.global main
main:
	ldr r1, =string
	ldr r3, =numbers
	mov r2, #26
	
_loop:
	ldrb r0, [r1, r2]
	strb r0, [r3, r2]
	subs r2, r2, #1
	bpl _loop
_write:
	mov r0, #1
	ldr r1, =numbers
	mov r2, #26
	mov r7, #4
	swi 0
_exit:
	mov r7, #1
	swi 0
	
.data
string: .asciz "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers: .asciz "01234567891011121314151617"
