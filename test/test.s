.data

.balign 4
test: .asciz "got: '%c'\n"

@.balign 1
comp: .byte 'a'

patt: .asciz "%c"
input: .asciz ""

.balign 4
trueM: .asciz "it  was true"

.text

.global main
main:
	push {lr}
	ldr r0, =patt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	ldr r0, =test
	bl printf
	
	pop {lr}
	bx lr
	
inputAddr: .asciz input
/*main:
	push { lr}
	bl getchar
	mov r1, r0
	ldr r0, =test
	bl printf
cmpa:
	ldr r2, =comp
	ldrb r2, [r2]
	cmp r1, r2
	beq true
	b end
true:
	ldr r0, =trueM
	bl printf
end:
	pop {lr}
	bx lr
	*/


.global getchar
.global scanf
.global printf
