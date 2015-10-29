.data

.balign 4
test: .asciz "got: '%c'\n"

@.balign 1
comp: .byte 'a'

.balign 4
trueM: .asciz "it  was true"

.text

.global main
main:
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


.global getchar
.global scanf
.global printf