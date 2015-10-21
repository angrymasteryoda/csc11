.data
.balign 4
inputMsg: .asciz "Input Beginning and end of temperature range (beginning, end)"

.balign 4
inputScanPatt: .asciz "%d, %d"

.balign 4
inputBeg: .word 0

.balign 4
inputEnd: .word 0

.balign 4
menuMsg: .asciz "If range is degree Centigrade input 1\nIf range is degree Fahrenheit input 2"

.balign 4
menuScanPatt: .asciz "%d"

.balign 4
menuNum: .word 0

.balign 4
test: .asciz "num %d"

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
	
	ldr r0, =test
	ldr r1, menuNumAddr
	ldr r1, [r1]
	bl printf
	
	pop {lr}
	bx lr

inputBegAddr: .word inputBeg
inputEndAddr: .word inputEnd
menuNumAddr: .word menuNum
.global scanf
.global printf
