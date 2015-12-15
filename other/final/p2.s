.data
yearStr: .asciz "Input the number of years 1-20\n"
rateStr: .asciz "Input the interest rate 5-10\n"
amntStr: .asciz "Input the present value $1000-$5000\n"
years: .word 0
rate: .word 0
amnt: .word 0
intIn: .word 0
intPatt: .asciz "%d"
array: .skip 80 
m: .asciz "%f\n"
mi: .asciz "%d\n"
.text

.global main

main:
	push {lr}
hourask:
	@ask for years
	ldr r0, =yearStr
	bl printf
		
	ldr r0, =intPatt
	ldr r1, yearsAddr
	bl scanf

	@validate
	ldr r0, yearsAddr
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
	
	mov r10, #1  @i counter
	ldr r12, yearsAddr
	ldr r12, [r12]
loopyears:
	@get years
	cmp r10, r12
	bgt loopyearsend
	ldr r0, rateAddr
	ldr r0, [r0]
	vmov s10, r0
	vcvt.f32.s32 s8, s10
	
	mov r0, #100
	vmov s10, r0
	vcvt.f32.s32 s10, s10
	
	vdiv.f32 s8, s8, s10 @ rate/100
	
	mov r0, #1
	vmov s10, r0
	vcvt.f32.s32 s10, s10
	
	vadd.f32 s8, s8, s10 @ rate% + 1
	
	mov r11, #0
powerloop:
	cmp r11, r12
	bgt powerloopend
	add r11, r11, #1
	b powerloop
powerloopend:
	add r10, r10, #1
	mov r1, r10
	ldr r0, =mi
	bl printf
	b loopyears
loopyearsend:	
	@test printf
	
	/*
	mov r1, r10
	ldr r0, =mi
	bl printf
	
	vcvt.f64.f32 d0, s2
	vmov r1, r2, d0
	ldr r0, =m
	bl printf
*/	
	pop {lr}
	bx lr
amntAddr: .word amnt
rateAddr: .word rate
intInAddr: .word intIn
yearsAddr: .word years
arrAddr: .word array
.global printf
