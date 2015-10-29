.data

.balign 4
test: .asciz "got: '%c'\n"

@.balign 1
comp: .byte 'a'

patt: .asciz "%c"
input: .byte 0

.balign 4
trueM: .asciz "it  was true"

.text

.global main
main:
	push {lr}
	ldr r0, =patt
	ldr r1, =input
	bl scanf
	
	ldr r1, =inputAddr
	ldr r1, [r1]
	ldr r0, =test
	bl printf
	
	pop {lr}
	bx lr
	
inputAddr: .byte input

.global scanf
.global printf
