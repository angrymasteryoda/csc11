.data
.balign 4
inputMsg: .asciz "Input Beginning and end of temperature range (beginning, end): "

.balign 4
inputScanPatt: .asciz "%d, %d"

.balign 4
inputBeg: .word 0

.balign 4
inputEnd: .word 0

.balign 4
menuMsg: .asciz "If range is degree Centigrade input 1\nIf range is degree Fahrenheit input 2: "

.balign 4
menuScanPatt: .asciz "%d"

.balign 4
menuNum: .word 0

.balign 4
outputMsg: .asciz "%d\t%d\n"

.text

.global main
main:
	push {lr}
	/* print the input msg */
	ldr r0, =inputMsg
	bl printf
	
	/*get the input*/
	ldr r0, =inputScanPatt
	ldr r1, =inputBeg
	ldr r2, =inputEnd
	bl scanf
	str r1, [inputBegAddr]
	str r2, [inputEndAddr]
	/*
	ldr r5, inputBegAddr
	ldr r5, [r5]
	ldr r6, inputEndAddr
	ldr r6, [r6]
	;*/
	
	/*print the menu msg*/
	ldr r0, =menuMsg
	bl printf
	
	/*get input*/
	ldr r0, =menuScanPatt
	ldr r1, =menuNum
	bl scanf
	
	/* check which program we should run */
	ldr r2, menuNumAddr
	ldr r2, [r2]
	cmp r2, #1
	
	/* change to bleq when in different file */
	beq cToF
	
	pop {lr}
	bx lr
	
cToF:
/* 
r0 = print str
r1 = fahrenheit
r2 = start centigrade
r3 = end centigrade
*/
	ldr r4, =0x1CCD /*bp -12 (9/5)*/
	ldr r0, =outputMsg
	mul r1, r5, r4 ;
	lsr r1, #12
	add r1, r1,  #32
	bl printf
	
	/*
loop:
	mul r1, r4, r2
	lsr r1, #12
	add r1, r1, #32
	bl printf
	@add 1 to r2 to up counter
	add r2, r2, #1
	cmp r2, r3
	ble loop
	*/
inputBegAddr: .word inputBeg
inputEndAddr: .word inputEnd
menuNumAddr: .word menuNum

/*
.global cToF
.global fToC*/
.global scanf
.global printf
