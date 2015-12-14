.data
inStr: .asciz "Enter an interger"
inPatt: .asciz "%d"
in: .word 0
result: .asciz "result: %d"
.text

.global main

main:
	ldr r0, =inStr@input string
	bl printf
	
	ldr r0, =inPatt
	ldr r1, inAddr
	bl scanf
	
	@load input to r1
	ldr r1, =in
	ldr r1, [r1]
	
	@load the scaled ints
	ldr r2, =0x12b0  @bp-16 wd 16
	ldr r3, =0xe042  @bp-16 wd 16
	
	@do the amth
	mul r0, r1, r1
	mul r0, r0, r2
	
	mul r4, r3, r1
	add r0, r0, r4
	
	@output result
	ldr r0, =result
	mov r1, r0
	bl printf
inAddr: .word in
.global printf