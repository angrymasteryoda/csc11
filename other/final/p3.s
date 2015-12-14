.data
result: .asciz "result: %d\n"
.text

.global main

main:
	push {lr}
	mov r2, #0
loop:
	@load the scaled ints
	ldr r3, =0x12b0  @bp-16 wd 16
	ldr r4, =0xe042  @bp-16 wd 16
		
	@do the amth
	mul r1, r2, r2 @ x*x
	mul r1, r1, r3 @ a*(x^2)
	mul r5, r4, r2 @ b * x
	add r1, r1, r5 @ (a*(x^2)) + (b*x)
	
	@output result
	push {r2}
	lsr r1, #16
	ldr r0, =result
	bl printf
	pop {r2}
	@add to counter
	add r2, r2, #1
	cmp r2, #255
	ble loop
end:
	pop {lr}
	bx lr
.global printf
