.data
.balign 4
inputNum: .word 0
.balign 4
inputMsg: .asciz "input: %d"
.balign 4
outMsg: .asciz "answer: %d\n"
.balign 4
msg: .asciz "Hello world"

.text

.global main
main:
	push {lr}
	ldr r0, =msg
	bl printf
	pop {lr}
	bx lr
	/*
	ldr r0, =inputMsg
	ldr r1, =inputNum
	bl scanf
	bx lr
	*/
	
inputNumAddr: .word inputNum
.global scanf
.global printf

