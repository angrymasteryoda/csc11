.global main
main:
	mov r0, #30
	mov r1, #3
	@actually stuff
	mov r5, r0
	mov r1, r4
	mov r1, #0
	mov r2, #1
	mov r3, r4
doloop:
	lsl r3, #1
	lsl r2, #1
	cmp r0, r3 @r0>r3
	bgt doloop
	lsr r3, #1
	lsr r2, #1
subwhile
	cmp r0, r2 @r0>=r3
	blt end
	add r1, r1, r2
	sub r0, r0, r3
	cmp r2, #1 @ r2>1
	cmp r3, r0 @ r3>r0
	
end: