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
hourask:
	@ask for hours
	ldr r0, =hourStr
	bl printf
		
	ldr r0, =intPatt
	ldr r1, hoursAddr
	bl scanf

	@validate
	ldr r0, hoursAddr
	ldr r0, [r0]
	cmp r0, #1
	blt hourask
	cmp r0, #20
	bgt hourask
	
rateask:
	@ask for rate
	ldr r0, =rateStr
	bl printf
	
	ldr r0, =intPatt
	ldr r1, rateAddr
	bl scanf
	
	ldr r0, rateAddr
	ldr r0, [r0]
	cmp r0, #5
	blt rateask
	cmp r0, #10
	bgt rateask
	
presentask:
	@ask for present
	ldr r0, =amntStr
	bl printf
	
	@get present
	ldr r0, =intPatt
	ldr r1, amntAddr
	bl scanf	
	
	@validate
	ldr r0, amntAddr
	ldr r0, [r0]
	ldr r1, =0x3e8
	cmp r0, r1
	blt presentask
	ldr r1, =0x1388
	cmp r0, r1
	bgt presentask
	
	pop {lr}
	bx lr
amntAddr: .word amnt
rateAddr: .word rate
intInAddr: .word intIn
hoursAddr: .word hours
arrAddr: .word array
.global printf
