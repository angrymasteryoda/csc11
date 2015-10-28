.data

.balign 4
inputMsg: .asciz "Enter menu number or 4 to exit: "

.balign 4
scanPatt: .asciz "%d"

.balign
input: .word 0

.balign 4
test: .asciz "entered %d\n"

.text
.global main
main:
loop:
	push {lr}
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	cmp r1, #1
	beq problem1
	cmp r1, #2
	beq problem2
	cmp r1, #3
	beq problem3
	b end
problem1:
	ldr r0, =test
	bl printf
	b loop
problem2:
	ldr r0, =test
	bl printf
	b loop
problem3:
	bl p3
	b loop

end:
	pop {lr}
	bx lr
	
inputAddr: .word input
.global p3

.global printf
.global scanf
