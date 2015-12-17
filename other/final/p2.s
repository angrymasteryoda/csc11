.data
yearStr: .asciz "Input the number of years 1-20\n"
rateStr: .asciz "Input the interest rate 5-10\n"
amntStr: .asciz "Input the present value $1000-$5000\n"
.align 4
years: .word 0
.align 4
rate: .word 0
.align 4
amnt: .word 0
.align 4
intIn: .word 0
intPatt: .asciz "%d"
.align 4
array: .skip 80 
outyear: .asciz "year %d = "

m: .asciz "%f\n"
mi: .asciz "%d\n"
.text

.global main

main:
	push {r4-r12, lr}  /* Keep integer registers */
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
loopyears:
	@get years
	ldr r0, yearsAddr
	ldr r0, [r0]
	cmp r10, r0
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
	cmp r11, r10
	beq powerloopend
	
	@s10 was set to 1 on line 90-92
	vmul.f32 s10, s10, s8
	
	add r11, r11, #1
	b powerloop
	@cmp r11, 
powerloopend:
	@load in present value
	ldr r0, amntAddr
	ldr r0, [r0]
	vmov s12, r0
	vcvt.f32.s32 s12, s12
	
	vmul.f32 s0, s12, s10
	
	@store in array
	vmov r4, s0
	ldr r5, arrAddr
	sub r9, r10, #1
	str r4, [r5, r9, lsl #2]
	
	add r10, r10, #1
	b loopyears
loopyearsend:
	mov r10, #1
	mov r9, #0
	ldr r5, arrAddr
	ldr r11, yearsAddr
	ldr r11, [r11]
output:
	@output
	ldr r0, =outyear
	mov r1, r10
	bl printf
	
	ldr r0, =m
	ldr r4, [r5, r9, lsl #2]
	vmov s2, r4
	vcvt.f64.f32 d0, s2
	vmov r1, r2, d0
	bl printf
	add r10, r10, #1
	add r9, r9, #1
	cmp r10, r11
	ble output
	
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
    pop {r4-r12, lr}
	bx lr
amntAddr: .word amnt
rateAddr: .word rate
intInAddr: .word intIn
yearsAddr: .word years
arrAddr: .word array
.global printf
