.data
result: .asciz "result: %d\n"
.text

.global main

main:
	push {lr}
	@load the scaled ints
	ldr r3, =0x12b0  @bp-16 wd 16
	ldr r4, =0xe042  @bp-16 wd 16
	
	mov r2, #1
	
	@do the amth
	mul r1, r2, r2 @ x*x
	mul r1, r1, r3 @ a*(x^2)
	mul r5, r4, r2 @ b * x
	add r1, r1, r5 @ (a*(x^2)) + (b*x)
	
	@output result
	asr r1, #16
	ldr r0, =result
	bl printf
	pop {lr}
	bx lr
.global printf
