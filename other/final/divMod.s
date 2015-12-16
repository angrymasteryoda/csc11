/* 
	Functions
		scaleRight
		addSub
		scaleLeft
		divMod
*/

.text

/*void scaleRight(int &r1,int &r3,int &r2) */
.globl scaleRight
scaleRight:
	push {r4, lr}             /* Push lr onto the stack */
	doWhile_r1_lt_r2:     /* Shift right until just under the remainder */
		mov r3,r3,ASR #1; /* Division counter */
		mov r2,r2,ASR #1  /* Mod/Remainder subtraction */
	cmp r1,r2
	blt doWhile_r1_lt_r2
	pop {r4, lr}              /* Pop lr from the stack */
    bx lr                 /* Leave scaleRight */
/* end scaleRight */

/* void addSub(int &r3,int &r2,int &r0,int &r1) */
.globl addSub
addSub:
	push {r4, lr}       /* Push lr onto the stack */
	doWhile_r3_ge_1:
		add r0,r0,r3
		sub r1,r1,r2
		bl scaleRight
	cmp r3,#1
	bge doWhile_r3_ge_1
    pop {r4, lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */
/* end addSub */

/* void scaleLeft(int &r1,int &r3,int &r2) */
.globl scaleLeft
scaleLeft:
	push {r4, lr}             /* Push lr onto the stack */
	doWhile_r1_ge_r2:     /* Scale left till overshoot with remainder */
		mov r3,r3,LSL #1  /* scale factor */
		mov r2,r2,LSL #1  /* subtraction factor */
		cmp r1,r2
	bge doWhile_r1_ge_r2  /* End loop at overshoot */
	mov r3,r3,ASR #1      /* Scale factor back */
	mov r2,r2,ASR #1      /* Scale subtraction factor back */
	pop {r4, lr}              /* Pop lr from the stack */
    bx lr                 /* Leave addSub */
/* end scaleLeft */

/* void divMod(int &r2,int &r0,int &r1) */
.globl divMod
divMod:
	push {r4, lr}       /* Push lr onto the stack */
	/* Determine the quotient and remainder */
	mov r0,#0
	mov r3,#1
	cmp r1,r2
	blt end
		bl scaleLeft
		bl addSub
	end:
	pop {r4, lr}       /* Pop lr from the stack */
    bx lr          /* Leave addSub */
/* end divMod */

/* my incomplete code
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
*/