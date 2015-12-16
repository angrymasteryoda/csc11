.data

.balign 4
inputMsg: .asciz "Enter menu number or 5 to exit: "

.balign 4
scanPatt: .asciz "%d"

.balign
input: .word 0

.balign 4
test: .asciz "entered %d\n"

.text
.global main
main:
	push {r4-r11, lr}
loop:
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	/*cmp r1, #1
	beq problem1
	cmp r1, #2
	beq problem2
	cmp r1, #3
	beq problem3*/
	cmp r1, #4
	beq problem4
	bal end
/*
problem1:
	bl p1
	b loop
problem2:
	bl p2
	b loop
problem3:
	bl p3
	b loop*/
problem4:
	bl p4
	b loop
end:
	pop {r4-r11, lr}
	bx lr
	
inputAddr: .word input
.global p4
.global p3
.global p2
.global p1

.global printf
.global scanf
