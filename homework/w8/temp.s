.data
msg: .asciz "%d"

.text

.global main

main:
	push {lr}
	ldr r0, =msg
	mov r2, #1
	ldr r3, =0x1ccd @bp -12
	mul r1, r2, r3
	lsr r1, #12
	add r1, r1, #32
	bl printf
	pop {lr}
	bx lr

