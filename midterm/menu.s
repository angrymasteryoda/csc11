.data

.balign 4
inputMsg: .asciz "Enter menu number: "

.balign 4
scanPatt: .asciz "%d"

.balign
input: .word 0

.balign 4
test: .asciz "entered %d\n"

.text
.global main
main:
	push {lr}
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	cmp r1, #1
	beq p1
	cmp r1, #2
	beq p2
	cmp r1, #3
	beq p3
p1:
	ldr r0, =test
	bl printf
	b end
p2:
	b end
p3:
	bl p3
	b end
	
	
end:
	pop {lr}
	bx lr
	
inputAddr: .word input
.global p3

.global printf
.global scanf
