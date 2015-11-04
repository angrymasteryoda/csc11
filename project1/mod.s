.global mod
mod:
	push {lr}
	mov r1, r5 @ move the divisor
	mov r2, r5
	cmp r2, r0
	bgt end
	b modStart
loop:
	cmp r2, r0
	bgt subtract
modStart
	lsl r2, #1
	b loop
subtract:
	lsr r2, #1
	cmp r2, r5
	bmi end
	cmp r2, r0
	bgt subtract
	sub r0, r0, r2
	b subtract
end:
	pop {lr}
	bx lr;
	
	
	
	