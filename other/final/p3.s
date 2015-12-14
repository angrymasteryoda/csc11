.data
result: .asciz "result: %d"
.text

.global main

main:
	push {lr}
	@load the scaled ints
	ldr r2, =0x12b0  @bp-16 wd 16
	ldr r3, =0xe042  @bp-16 wd 16
	
	mov r1, #1
	
	@do the amth
	mul r0, r1, r1
	mul r0, r0, r2
	
	mul r4, r3, r1
	add r0, r0, r4
	
	@output result
	lsr r0, #16
	mov r1, r0
	ldr r0, =result
	bl printf
	pop {lr}
	bx lr
.global printf