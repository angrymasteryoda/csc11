/*
my first function
*/

.data
.balign 4
msg1: .asciz "type a number: "

.balign 4
msg2: .asciz "%d\n"

.balign 4
scanPattern: .asciz "%d"

.balign 4
numberRead: .word 0

return: .word 0

.text

.global main
main:
	push {lr}
        ldr r0, =msg1
        bl printf

        ldr r0, =scanPattern
        ldr r1, =numberRead
        bl scanf

	ldr r1, numberReadAddr
	ldr r1, [r1]
	ldr r0, =msg2
	bl printf

	pop {lr}
        bx lr
msg1Addr: .word msg1
msg2Addr: .word msg2
scanPatAddr: .word scanPattern
numberReadAddr: .word numberRead
returnAddr: .word return

.global printf
.global scanf


