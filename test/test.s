.data

.balign 4
test: .asciz "got: '%c'"

.balign 1
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

	ldr r2, =comp
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
