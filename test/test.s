.data

.balign 4
test: .asciz "got: '%c'\n"

.balign 4
comp: .word 'a'

patt: .asciz "%c"
.balign 4
input: .word 0

.balign 4
trueM: .asciz "it  was true"

.text

.global main
main:
	push {lr}
	ldr r0, =patt
	ldr r1, =input
	bl scanf
	
	ldr r1, =input
	ldr r1, [r1]
	ldr r0, =test
	bl printf
	ldr r1, =comp
	ldr r1, [r1]
	ldr r0, =test
	bl printf
cmpa:
	ldr r1, =input
	ldr r1, [r1]
	ldr r2, =comp
	ldr r2, [r2]
	cmp r1, r2
	beq true
	b end
true:
	ldr r0, =trueM
	bl printf
end:
	
	pop {lr}
	bx lr
	

.global scanf
.global printf
