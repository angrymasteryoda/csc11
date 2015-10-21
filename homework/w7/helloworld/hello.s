/* 
hello world program
*/

.data
msg:
	.asciz "hello world"

.balign 4
return: .word

.text

.global main
main:
	LDR r1, returnAddr
	STR LR, [r1]
	LDR r0, msgAddr
	BL puts
	LDR r1, returnAddr
	LDR lr, [r1]
	BX lr
msgAddr: .word msg
returnAddr: .word return


.global puts
