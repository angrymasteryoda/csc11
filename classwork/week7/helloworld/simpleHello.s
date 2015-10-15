/* 
hello world program
*/

.data
msg:
	.asciz "hello world"



.text

.global main
main:
	ldr r0, =msg
	bl printf
	bx lr
msgAddr: .word msg



.global printf
