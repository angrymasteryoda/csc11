.data

.balign 4
inputMsg: .asciz "Enter menu number"


.text
.global main
main:
	push {lr}
	ldr r0, =inputMsg
	bl printf

	pop {lr}
	bx lr

.global printf
.global scanf
