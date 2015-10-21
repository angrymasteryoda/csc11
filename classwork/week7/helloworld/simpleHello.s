/* 
hello world program
*/

.data
msg:
	.asciz "hello world"



.text

.global main
main:
	push {lr}
	ldr r0, =msg
	bl puts
	pop {lr}
	bx lr
msgAddr: .word msg



.global puts
