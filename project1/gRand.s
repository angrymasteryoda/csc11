.global gRand
gRand:
	push {lr}
	mov r0, #0
	bl time
	bl srand
	bl rand
	@todo make mod function
	pop {lr}
	bx lr
.global time
.global srand
.global rand
