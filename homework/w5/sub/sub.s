/*
michael risher
subtract
*/

.global _start

_start:
	mov r1, #0	@result of r3/r2
	mov r2, #6	@denominator
	mov r3, #55	@numerator
	mov r0, r3	@place num in r0
loop:			@r0 >= r2
	cmp r0, r2	@compare
	blt _output
	add r1, r1, #1
	sub r0, r0, r2 	@subtract the denominator
	bal loop
_output:
	mov r7, #1
	swi 0
