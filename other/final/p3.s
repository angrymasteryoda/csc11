.data
result: .asciz "result: %d\n"
.text

.global p3

p3:
	push {r4-r12, lr}
	mov r10, #0
loop:
	@load the scaled ints
	ldr r3, =0x12b0  @bp-16 wd 16
	ldr r4, =0xe042  @bp-16 wd 16
		
	@do the amth
	mul r1, r10, r10 @ x*x
	mul r1, r1, r3 @ a*(x^2)
	mul r5, r4, r10 @ b * x
	add r1, r1, r5 @ (a*(x^2)) + (b*x)
	
	@output result
	lsr r1, #16
	ldr r0, =result
	bl printf
	@add to counter
	add r10, r10, #1
	cmp r10, #255
	ble loop
end:
	pop {r4-r12, lr}
	bx lr
.global printf
