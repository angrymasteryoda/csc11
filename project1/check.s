.data

rightplace: .asciz "%d digit(s) are correct and in the right place\n"
correct: .asciz  "%d digit(s) are correct\n"
m: .asciz "%d, %d ~ (%d, %d, %d)"
.text
/*
 r0 = n1
 r1 = n2
 r2 = n3
 r3 = u1
 r4 = u2
 r5 = u3 
 */
 
.global check
check:
	push {lr}
	ldr r0, =m
	bl printf
	pop {lr}
	bx lr
	/*
	mov r6, #0 @did we win
	mov r7, #0 @right place
	mov r8, #0 @correct number
	cmp r3, r0
	beq r3eqr0
	cmp r3, r1
	addeq r8, r8, #1
	cmp r3, r2
	addeq r8, r8, #1
	b checkn2
r3eqr0:
	add r7, r7, #1
	b checkn2
checkn2:
	cmp r4, r1
	beq r4eqr1
	cmp r4, r0
	addeq r8, r8, #1
	cmp r4, r2
	addeq r8, r8, #1
	b checkn3
r4eqr1:
	add r7, r7, #1
	b checkn3
checkn3:
	cmp r5, r2
	beq r5eqr2
	cmp r5, r1
	addeq r8, r8, #1
	cmp r5, r0
	addeq r8, r8, #1
	b output
r5eqr2:
	add r7, r7, #1
	b output
output:
	ldr r0, =rightplace
	mov r1, r7
	bl printf
	ldr r0, =correct
	mov r1, r8
	bl printf
	pop {lr}
	bx lr
*/	
.global printf
