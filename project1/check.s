.data

.text
.global check
check:
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
/*
 r0 = n1
 r1 = n2
 r2 = n3
 r3 = u1
 r4 = u2
 r5 = u3 
 */