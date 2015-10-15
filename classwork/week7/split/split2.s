.data
.balign 4
return2: .word 0

.text

.global multiply5
multiply5:
	ldr r1, return2Addr
	str lr, [r1]
	add r0, r0, r0, lsl #2	/* r0 <- r0 + 4 * r0 */
	ldr lr, return2Addr
	ldr lr, [lr]
	bx lr
return2Addr: .word return2
