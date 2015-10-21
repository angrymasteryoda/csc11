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
test: .asciz "%d\t%d\n"

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
	/*
	mov r1, r2
	ldr r0, =test
	bl printf
	*/
	
	ldr r0, inputBegAddr
	ldr r0, [r0]
	ldr r1, inputEndAddr
	ldr r1, [r1]
	cmp r2, #1
	
	/* change to bleq when in different file */
	beq cToF
	
	pop {lr}
	bx lr
cToF:
/* 
r0 = print str
r1 = fahrenheit
r2 = centigrade
r3 = end
*/
	mov r3, r1
	mov r2, r0
	ldr r4, =0x1CCD @bp -12 (9/5)
	ldr r0, =test
	mul r1, r4, r2
	lsr r1, #12
	add r1, r1, #32
	bl printf
	
	
	
	
	
inputBegAddr: .word inputBeg
inputEndAddr: .word inputEnd
menuNumAddr: .word menuNum

/*
.global cToF
.global fToC*/
.global scanf
.global printf
