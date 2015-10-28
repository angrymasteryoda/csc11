.data

.balign 4
test: .asciz "got: '%c'"

.balign 4


.text

.global main
main:
	push { lr}
	bl getchar
	
	ldr r0, =test
	bl printf
	
	pop {lr}
	bx lr
	
.global getchar
.global scanf
.global printf
