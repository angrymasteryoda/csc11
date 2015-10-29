.data
.balign 4
test: .asciz "got: '%c'\n"

.balign 4
test2: .asciz "got: '%d'\n"

.balign 4
comp: .word 'a'

.balign 4
patt: .asciz "%c,%d"

.balign 4
inputc: .word 0

.balign 4
inputd: .word 0

.balign 4
trueM: .asciz "it  was true"

.text

.global main
main:
	push {lr}
	ldr r0, =patt
	ldr r1, =inputc
	ldr r2, =inputd
	bl scanf
	
	ldr r1, =inputc
	ldr r1, [r1]
	ldr r0, =test
	bl printf
	
	ldr r1, =inputd
	ldr r1, [r1]
	ldr r0, =test2
	bl printf
	
	pop {lr}
	bx lr
	

.global scanf
.global printf
