.data
.balign 4
inputPatt: .asciz "%c"
.balign 4
inputMsg: .asciz "Enter the plan type (a, b, or c): "
.balign 4
input: .word 0
.balign 4
compa: .word 'a'
.balign 4
compb: .word 'b'
.balign 4
compc: .word 'c'
.balign 4
hourMsg: .asciz "Enter hours: "
.balign 4
hours: .word 0
.balign 4
hoursPatt: .asciz "%d"
.balign 4
output: .asciz "You owe: $%d\n"

/* all input data */
.balign 4
allMsg: .asciz "Enter the plan type (a, b, or c) and hours used. ( a||b||c, hours ):"
.balign 4
allPatt: .asciz "%c,%d"

.text
/*
r8 = hours;
r1 = result
*/
.global p2
p2:
	push {lr}
	/*
	ldr r0, =allMsg
	bl printf
	
	ldr r0, =allMsg
	ldr r1, =input
	ldr r2, =hours
	bl scanf
		
	ldr r1, =input
	ldr r9, [r1]
	ldr r1, =hours
	ldr r8, [r1]*/
	/*get character */
	ldr r0, =inputMsg
	bl printf
	
	/* scanf way */
	ldr r0, =inputPatt
	ldr r1, =input
	bl scanf
	ldr r1, =input
	ldr r9, [r1]
	
	ldr r0, =hourMsg
	bl printf
	
	ldr r0, =hoursPatt
	ldr r1, =hours
	bl scanf
	
	ldr r1, hoursAddr
	ldr r8, [r1]
	@ */
	
	ldr r2, =compa
	ldr r2, [r2]
	cmp r9, r2
	beq parta
	ldr r2, =compb
	ldr r2, [r2]
	cmp r9, r2
	beq partb
	ldr r2, =compc
	ldr r2, [r2]
	cmp r9, r2
	beq partc
	
	b end
	
/* a plan */
parta:
	cmp r8, #11
	bgt amore11
	ble aless
amore11:
	cmp r8, #22
	bgt amax
	mov r1, #30 @base of $30
	sub r2, r8, #11 @hrs - 11
	mov r3, #3 @ temp register for mul
	mul r3, r2, r3
	add r1, r1, r3
	b end
amax:
	mov r1, #30 @base of $30
	mov r2, #11 @ 22-11 is always 11
	mov r3, #3 @ temp register for mul
	mul r3, r2 , r3 @ (22-11)*3
	add r1, r1, r3 @add it to result
	sub r2, r8, #22 @ (hrs - 22)
	mov r3, #6 @temp
	mul r3, r2, r3 @(hrs - 22) * 6
	add r1, r1, r3 @added to total
	b end
aless:
	mov r1, #30
	b end

/* b plan */
partb:
	cmp r8, #22
	bgt bmore22
	ble bless
bmore22:
	cmp r8, #44
	bgt bmax
	mov r1, #35 @base of $35
	sub r2, r8, #22 @hrs - 11
	mov r3, #2 @ temp register for mul
	mul r3, r2, r3
	add r1, r1, r3
	b end
bmax:
	mov r1, #35 @base of $35
	mov r2, #22 @ 44-22 is always 22
	mov r3, #2 @ temp register for mul
	mul r3, r2 , r3 @ (44-22)*2
	add r1, r1, r3 @add it to result
	sub r2, r8, #44 @ (hrs - 44)
	mov r3, #4 @temp
	mul r3, r2, r3 @(hrs - 44) * 4
	add r1, r1, r3 @added to total
	b end
bless:
	mov r1, #35
	b end
	
/* c plan */
partc:
	cmp r8, #33
	bgt cmore33
	ble cless
cmore33:
	cmp r8, #44
	bgt cmax
	mov r1, #40 @base of $40
	sub r2, r8, #33 @hrs - 33
	mov r3, #1 @ temp register for mul
	mul r3, r2, r3
	add r1, r1, r3
	b end
cmax:
	mov r1, #40 @base of $35
	mov r2, #33 @ 44-22 is always 22
	mov r3, #1 @ temp register for mul
	mul r3, r2 , r3 @ (44-22)*2
	add r1, r1, r3 @add it to result
	sub r2, r8, #66 @ (hrs - 44)
	mov r3, #2 @temp
	mul r3, r2, r3 @(hrs - 44) * 4
	add r1, r1, r3 @added to total
	b end
cless:
	mov r1, #40
	b end
	
end:
	ldr r0, =output
	bl printf
	
	pop {lr}
	bx lr

hoursAddr: .word hours
.global scanf
.global printf

