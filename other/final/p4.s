.data

a: .float 0.073
b: .float 0.876
result: .asciz "result: %f\n"

.global main

main:
	push {lr}
	mov r2, #6
loop:
	@load floats
	ldr r3, =a
	vldr s6, [r3]
	ldr r4, =b
	vldr s8, [r4]
	
	vmov s15, r2
	vcvt.f32.s32 s4, s15
	/*
	vmul.f32 s2, s4, s4 @ x*x
	vmul.f32 s2, s2, s6 @ a*(x^2)
	vmul.f32 s10, s8, s4 @ b * x
	vadd.f32 s2, s2, s10 @ (a*(x^2)) + (b*x)
	*/
	push {r2}
	ldr r0, =result
	@vcvt.f64.f32 d0, s2
	vcvt.f64.f32 d0, s4
	vmov r1, r2, d0
	bl printf
	pop {r2}
	/*
	add r2, r2, #1
	cmp r2, #255
	ble loop*/
end:
	pop {lr}
	bx lr
.global printf

