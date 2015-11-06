.data
msg: .asciz "The outputs are a div b = %d and a mod b = %d\n"
.text
.global main
main:
	push {lr}
	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	mov r4, #5
	sub sp, sp, #4 @resize up 4 bytes
	str r4, [sp]
	mov r5, #6
	sub sp, sp, #4
	str r5, [sp]
	bl check
	add sp, sp, #4 @resize back down
	pop {lr}
	bx lr

.global printf
.global check
