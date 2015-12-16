.data

inputMsg: .asciz "Enter menu number or 5 to exit: "
scanPatt: .asciz "%d"
test: .asciz "entered %d\n"

.balign
input: .word 0


/*
			Problem 1
*/
.align 4
k1: .word 1000
.align 4
num: .word 0
.align 4
guesses: .word 10
.align 4
in: .word 0
.align 4
y: .word 'y'

low: .asciz "To low. Try agian\n"
high: .asciz "To high. Try agian\n"
many: .asciz "To many tries\n"
won: .asciz "Congratulations, You guessed the number!\nWould you like to play again(y or n)?\n"
inPatt: .asciz "%d"
inStr: .asciz "Enter num: "
ynPatt: .asciz "%s"

.text
.global main
main:
	push {r4, lr}
menuloop:
	ldr r0, =inputMsg
	bl printf
	
	ldr r0, =scanPatt
	ldr r1, =input
	bl scanf
	
	ldr r1, inputAddr
	ldr r1, [r1]
	
	cmp r1, #1
	beq problem1
	cmp r1, #2
	beq problem2
	cmp r1, #3
	beq problem3
	cmp r1, #4
	beq problem4
	bal end
problem1:
gameloop:
	@make the random number
	mov r0, #0
	bl time
	bl srand
	bl rand
	mov r1, r0, asr #1
	ldr r2, =k1
	ldr r2, [r2]
	bl divMod
	mov r0, r1
	add r0, r0, #1
	@got random num lets store it
	ldr r1, =num
	str r0, [r1]

	@print random num
	ldr r0, =m
	ldr r1, [r1]
	bl printf

	mov r10, #0
	@loop i=0; i < 10; i++
p1loop:
	@output input message
	ldr r0, =inStr
	bl printf

	@get input
	ldr r0, =inPatt
	ldr r1, inAddr
	bl scanf

	@load the rand num
	ldr r5, =num
	ldr r5, [r5]
	@load user num
	ldr r6, =in
	ldr r6, [r6]
	@compare r5 r6
	cmp r6, r5
	beq winner @you won go to winner
	blt less @was less than
	bgt more @was more
winner:
	ldr r0, =won
	bl printf
	@ask if play agian
	ldr r0, =ynPatt
	ldr r1, =in
	bl scanf
	
	@load the 'y' into r0 test if equal
	ldr r0, =y
	ldr r0, [r0]
	@load the user char
	ldr r1, =in
	ldr r1, [r1]
	cmp r0, r1
	beq gameloop @go to gameloop
	b end
less:
	@if ur guess less than num
	ldr r0, =low
	bl printf
	b endloop
more:
	ldr r0, =high
	bl printf
	b endloop
endloop: @the end part of the loop not "end the loop"
	add r10, r10, #1
	@load guesses to register
	ldr r9, =guesses
	ldr r9, [r9]
	cmp r10, r9
	blt p1loop
end:
	b menuloop
problem2:
	bl p2
	b menuloop
problem3:
	bl p3
	b menuloop
problem4:
	bl p4
	b menuloop
end:
	pop {r4, lr}
	bx lr
	
inputAddr: .word input
.global p4
.global p3
.global p2
.global p1

.global printf
.global scanf