.data
intro: .asciz "Mastermind!\nGuess the 3 digit octal in 10 tries\n"
showAsk: .asciz "Show number? (y/n)\n"
showPatt: .asciz "%1s"
inAsk: .asciz "Enter a 3 digit number separated with spaces\n" 
inPatt: .asciz "%d %d %d"
ans: .asciz "The number is %d%d%d\n"
won: .asciz "You Won!\n"
guesses: .asciz "It took %d guesses\n"
lost: .asciz "You lost the correct number was %d%d%d\n"
again: .asciz "Play again? (y/n)\n"

.balign 4
in: .word 0
.balign 4
n1: .word 0
.balign 4
n2: .word 0
.balign 4
n3: .word 0
.balign 4
y: .word 'y'
.balign 4
n: .word 'n'
.text

.global main
main:
	push {lr}
	mov r0, #0
	bl time
	bl srand
	ldr r0, =intro
	bl printf
gameloop:
	@make the random numbers and store them
	bl gRand
	mov r7, r0
	bl gRand
	mov r8, r0
	bl gRand
	mov r9, r0
	@ as if you want to see the number
	ldr r0, =showAsk
	bl printf
	ldr  r0, =showPatt
	ldr r1, =in
	bl scanf
	ldr r1, =in
	ldr r1, [r1]
	ldr r2, =y
	ldr r2, [r2]
	cmp r1, r2
	beq showNumber
	b startLoop
startLoop:
	mov r10, #0 @loop counter
	b loop
loop:
	ldr r0, =inAsk
	bl printf
	ldr r0, =inPatt
	ldr r1, =n1
	ldr r2, =n2
	ldr r3, =n3
	bl scanf
	@check the inputs
	@cmp r6, #1
	cmp r10, #1
	bge lose
	add r10, r10, #1
	b loop
showNumber:
	ldr r0, =ans
	mov r1, r7
	mov r2, r8
	mov r3, r9
	bl printf
	b startLoop
win:
	ldr r0, =win
	bl printf
	add r1, r10, #1
	ldr r0, =guesses
	bl printf
	b end
lose:
	ldr r0, =lost
	mov r1, r7
	mov r2, r8
	mov r3, r9
	bl printf
	b end
end:
@*/
	pop {lr}
	bx lr

inAddr: .word in
n1Addr: .word n1
n2Addr: .word n2
n3Addr: .word n3

.global time
.global srand
.global gRand
.global printf
.global scanf
.global check
