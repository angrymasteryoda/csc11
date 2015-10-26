.data
.balign 4
inputNum: .word 0
.balign 4
inputMsg: .asciz "input: %d"
.balign 4
outMsg: .asciz "answer: %d\n"

.text

.global main
main:
	ldr r0, =outMsg
	mov r1, #45
	bl printf
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

