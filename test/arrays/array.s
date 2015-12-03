.data
.balign 4
array: .skip 400 @array[100]

m: .asciz "%d, "
.text

.global main
main:
	push {lr}
/*
for( int i = 0; i < 100; i ++ ){}
*/
	ldr r1, addr_array
	mov r2, #0  /* i = 0 */
loop:
	cmp r2, #100 /* reached 100? */
	beq end
	add r3, r1, r2, LSL #2 /* r3 = r1 + ( r2*4 )*/
	str r2, [r3]
	add r2, r2, #1
	b loop
end:
	pop {lr}
	bx lr

addr_array: .word array
