.data
.balign 4
msg1: .asciz "type a number: "

.balign 4
msg2: .asciz "%d times 5 is %d\n"

.balign 4
scanPattern: .asciz "%d"

.balign 4
numberRead: .word 0

return: .word 0


.text

.global main
main:
	ldr r1, returnAddr
	str lr, [r1]

	ldr r0, msg1Addr
	bl printf

	ldr r0, scanPatAddr
	ldr r1, numberReadAddr
	bl scanf

	ldr r0, numberReadAddr
	ldr r0, [r0]
	bl multiply5

	mov r2, r0
	ldr r1, numberReadAddr
	ldr r1, [r1]
	ldr r0, msg2Addr
	bl printf

	ldr lr, returnAddr
	ldr lr, [lr]
	bx lr

msg1Addr: .word msg1
msg2Addr: .word msg2
scanPatAddr: .word scanPattern
numberReadAddr: .word numberRead
returnAddr: .word return


.global multiply5;
.global printf
.global scanf
