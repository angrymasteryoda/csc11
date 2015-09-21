/*
michael risher
r0 = num of inches
r1 = conversion of in to ft
r0 = number of feet
*/

.global _start

_start:
	mov r1, #108
	ldr r2, =0x155556
	mul r0, r2, r1
	lsr r0, #24				/* right shift */
	mov r7, #1
	swi 0
