.global main
.func main

main:
	mov r0, #7	@put 7 in r0
	mov r1, #7	@put 7 in r1
	add r0, r0, r1	@add it up
	bx lr
