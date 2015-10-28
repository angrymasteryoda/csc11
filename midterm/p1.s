.data
.balign 4
inputHour: .word 0
.balign 4
inputRate: .word 0
.balign 4
inputMsg: .asciz "Input hours worked and payrate (hours, payrate): "
.balign 4
scanPat: .asciz "%d,%d"
.balign 4
outMsg: .asciz "Your pay is: %d\n"
.balign 4
errorMsg: .asciz "hours must be less than 60"

.text

/*
r1 = hours
r2 = rate
r3 = result;
r4 = temp
*/
.global main
main:
	push {lr}
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPat
	ldr r1, =inputHour
	ldr r2, =inputRate
	bl scanf
	
	ldr r1, inputHourAddr
	ldr r1, [r1]
	ldr r2, inputRateAddr
	ldr r2, [r2]
	mov r3, #0
	mov r4, #0
	
	cmp r1, #60
	bge error
	cmp r1, #40
	ble straight
	cmp r1, #50
	blt double
	bge triple
straight:
	mul r3, r2, r1
	b out
double:
	mul r3, r2, #40 @r2 * 40
	mul r4, r2, #2 @r2 - 2
	sub r5, r1, #40 @r1 - 40
	mul r4, r4, r5 @( r1 - 40 ) * ( r2 * 2 )
	add r3, r3, r4
	b out
	
	
	
	
error:
	ldr r0, =errorMsg
	bl printf
	b end
out:
	ldr r0, =outMsg
	mov r1, r3
	bl printf
end:
	pop {lr}
	bx lr

inputHourAddr: .word inputHour
inputRateAddr: .word inputRate
.global scanf
.global printf
