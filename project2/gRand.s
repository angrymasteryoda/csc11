.global gRand
gRand:
	push {lr}
	mov r0, #0
@	bl time
@	bl srand
	bl rand
	mov r1, r0, asr #1
	mov r2, #7
	bl divMod
	mov r0, r1
	pop {lr}
	bx lr
.global divMod
.global time
.global srand
.global rand
