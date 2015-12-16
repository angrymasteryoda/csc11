.data

@inputMsg: .asciz "Enter menu number or 5 to exit: "
@scanPatt: .asciz "%d"
@.balign 4
@input: .word 0
@test: .asciz "entered %d\n"

a: .float 0.073
b: .float 0.876
result: .asciz "result: %f\n"
m: .asciz "%d\n"
mf: .asciz "%f\n"
.text
p4:
	push {r4-r12, lr}
	mov r10, #0
loop:
	@load floats
	ldr r3, aAddr
	vldr s6, [r3]  @ load a into float register
	ldr r4, bAddr
	vldr s8, [r4]  @ load b into float register

	vmov s15, r10 @ mov x to a float register
	vcvt.f32.s32 s4, s15 @convert to float type
/*
	vmul.f32 s2, s4, s4 @ x*x
	vmul.f32 s2, s2, s6 @ a*(x^2)
	vmul.f32 s10, s8, s4 @ b * x
	vadd.f32 s2, s2, s10 @ (a*(x^2)) + (b*x)
*/
	@print out the result
	ldr r0, =result
	vcvt.f64.f32 d0, s4 @ convert the result in s2 to a double for printing
	vmov r1, r2, d0 @ mov to int registers to print
	bl printf

	add r10, r10, #1 @ x++
	cmp r10, #255 @ x < 255
	ble loop

end:
	pop {r4-r12, lr}
	bx lr
	
.global main
main:
	push {r4-r12, lr}
bl p4
/*
menuloop:
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	cmp r1, #4
	beq problem4
	bal exit
problem4:
	bl p4
	b menuloop*/
exit:
	pop {r4-12, lr}
	bx lr
	
@inputAddr: .word input
aAddr: .word a
bAddr: .word b
.global printf
.global scanf
