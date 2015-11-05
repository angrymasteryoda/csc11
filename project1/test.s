.data
msg: .asciz "The outputs are a div b = %d and a mod b = %d\n"
.text
.global main
main:
	push {lr}
	mov r1, #6
	mov r2, #3
	bl divMod

	mov r2, r1
	mov r1, r0
	ldr r0, =msg
	bl printf
	pop {lr}
	bx lr

.global printf
.global divMod
