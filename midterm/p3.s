.data
inputNum: .word 0

inputMsg: .asciz "input: %d"

outMsg: .asciz "answer: %d\n"

.text

.global main
main:
	ldr r0, =inputMsg
	ldr r1, =inputNum
	bl scanf
	
	
	
inputNumAddr: .word inputNum
.global scanf
.global printf