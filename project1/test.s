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
	mov r5, #6
	bl check
	pop {lr}
	bx lr

.global printf
.global check
