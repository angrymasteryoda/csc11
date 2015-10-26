.data
.balign 4
inputNum: .word 0
.balign 4
inputMsg: .asciz "Input a number for fibbonacii: "
.balign 4
scanPat: .asciz "%d"
.balign 4
outMsg: .asciz "answer: %d\n"

.text

.global main
main:
	push {lr}
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPat
	ldr r1, =inputNum
	bl scanf
	
	ldr r0, = outMsg
	ldr r1, inputNumAddr
	ldr r1, [r1]
	
	cmp r1, #1 ;r1 <= 1
	ble print
	mov r2, #1 ;fibo
	mov r3, #1 ;fibo previous
	mov r4, #2 ;counter
loop:
	mov r5, r2 ;temp
	add r2, r2, r3
	mov r3, r5
	cmp r4, r1
	blt loop
	mov r1, r2
print:
	ldr r0, =outMsg
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

