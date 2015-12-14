.data
hourStr: .asciz "Input the number of hours 1-20\n"
rateStr: .asciz "Input the interest rate 5-10\n"
amntStr: .asciz "Input the present value $1000-$5000\n"
hours: .word 0
rate: .word 0
amnt: .word 0
intIn: .word 0
intPatt: .asciz "%d"
array: .skip 4 
m: .asciz "%f\n"
mi: .asciz "%d\n"
.text

.global main

main:
	push {lr}
	
	@ask for hours
	ldr r0, =hourStr
	bl printf
	
	ldr r0, =intPatt
	ldr r1, hoursAddr
	bl scanf
	
	@ask for rate
	ldr r0, =rateStr
	bl printf
	
	ldr r0, =intPatt
	ldr r1, rateAddr
	bl printf
	
	ldr r0, =intPatt
	ldr r1, =rate
	bl printf
	
	
	
	pop {lr}
	bx lr

rateAddr: .word rate
intInAddr: .word intIn
hoursAddr: .word hours
arrAddr: .word array
.global printf
