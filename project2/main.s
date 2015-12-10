.data
intro: .asciz "Mastermind!\nGuess the 3 digit octal in 10 tries\n"
showAsk: .asciz "Show number? (y/n)\n"
showPatt: .asciz "%1s"
inAsk: .asciz "Enter a 3 digit number separated with spaces\n" 
inPatt: .asciz "%d %d %d"
ans: .asciz "The number is %d%d%d\n"
won: .asciz "You Won!\n"
guesses: .asciz "It took %d guesses\n"
guesspercent: .asciz "used %f%% of your guesses\n"
lost: .asciz "You lost the correct number was %d%d%d\n"
again: .asciz "Play again? (y/n)\n"
rightplace: .asciz "%d digit(s) are correct and in the right place\n"
correct: .asciz  "%d digit(s) are correct\n"
.align 4
total: .float 10.00
.balign 4
in: .word 0
.align 4
nums: .skip 12  @user numbers int[3]
@todo delete
.balign 4
n1: .word 0
.balign 4
n2: .word 0
.balign 4
n3: .word 0
@these n1-n3
.balign 4
y: .word 'y'
.balign 4
n: .word 'n'
.align 4
orgs: .skip 12  @orignal numbers int[3]
@TODO delete r1-r3
.balign 4
r1: .word 0
.balign 4
r2: .word 0
.balign 4
r3: .word 0
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
	ldr r1, =orgs
	str r7, [r1]
	bl gRand
	
	mov r8, r0
	ldr r1, =orgs
	str r8, [r1, +#4]
	bl gRand
	
	mov r9, r0
	ldr r1, =orgs
	str r9, [r1, +#8]
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
	ldr r4, numsAddr
	ldr r1, numsAddr
	add r2, r4, #4
	add r3, r4, #8
	@ldr r3, =n3
	bl scanf
	@ reload the numbers
	ldr r0, =inPatt
	ldr r3, =nums
	ldr r3, [r3]
	ldr r4, =nums
	ldr r4, [r4, #4]
	ldr r5, =nums
	ldr r5, [r5, #8]
	@mov correct numbers to r0-r2
	ldr r0, =orgs
	ldr r1, [r0, #4]
	ldr r2, [r0, #8]
	ldr r0, [r0]
	@check the inputs
	b check
afterCheck:
	ldr r7, =nums
	ldr r7, [r7]
	ldr r8, =nums
	ldr r8, [r8, #4]
	ldr r9, =nums
	ldr r9, [r9, #8]
	@pop {r7-r10, lr}
	cmp r6, #1
	beq win
	add r10, r10, #1
	cmp r10, #10
	beq lose
	b loop
showNumber:
	ldr r0, =ans
	ldr r1, =orgs
	ldr r1, [r1]
	ldr r2, =orgs
	ldr r2, [r2, +#4]
	ldr r3, =orgs
	ldr r3, [r3, +#8]
	bl printf
	b startLoop
win:
	ldr r0, =won
	bl printf
	add r1, r10, #1
	ldr r0, =guesses
	bl printf
	/*
	vmov s12, r1  @ guesses
	vcvt.f32.s32 s2, s12
	*/
	ldr r0, totalAddr @total 10.0
	vldr s4, [r0]
	/*
	vdiv.f32 s2, s2, s4
	
	mov r0, #100
	vmov s12, r0
	vcvt.f32.s32 s4, s12
	
	vmul.f32 s2, s2, s4
	
	vcvt.f64.f32 d0, s2*/
/*
	ldr r0, =total
	vldr s1, [r0]
	vmov s14, r1
	vcvt.f32.s32 s0, s14
	@get percent
	vdiv.f32 s0, s0, s1
	
	@multiply by 100
	/*
	mov r1, #100
	vmov s15, r1
	vcvt.f32.s32 s1, s15
	vmul.f32 s0, s0, s1
	vcvt.f64.f32 d0, s0
	*/
	/*ldr r0, =guesspercent
	vmov r1, r2, d0
	bl printf*/
	b end
lose:
	ldr r0, =lost
	mov r1, r7
	mov r2, r8
	mov r3, r9
	bl printf
	b end
check:
	mov r6, #0 @did we win
	mov r7, #0 @right place
	mov r8, #0 @correct number
	cmp r3, r0
	beq r3eqr0
	cmp r3, r1
	addeq r8, r8, #1
	cmp r3, r2
	addeq r8, r8, #1
	b checkn2
r3eqr0:
	add r7, r7, #1
	b checkn2
checkn2:
	cmp r4, r1
	beq r4eqr1
	cmp r4, r0
	addeq r8, r8, #1
	cmp r4, r2
	addeq r8, r8, #1
	b checkn3
r4eqr1:
	add r7, r7, #1
	b checkn3
checkn3:
	cmp r5, r2
	beq r5eqr2
	cmp r5, r1
	addeq r8, r8, #1
	cmp r5, r0
	addeq r8, r8, #1
	b output
r5eqr2:
	add r7, r7, #1
	b output
output:
	mov r3, r0
	mov r4, r1
	mov r5, r2
	cmp r7, #3
	moveq r6, #1
	movne r6, #0
	ldr r0, =rightplace
	mov r1, r7
	bl printf
	ldr r0, =correct
	mov r1, r8
	bl printf
	b afterCheck
end:
@*/
	ldr r0, =again
	bl printf
	ldr r0, =showPatt
	ldr r1, =in
	bl scanf
	ldr r0, =in
	ldr r0, [r0]
	ldr r1, =y
	ldr r1, [r1]
	cmp r0, r1
	beq gameloop
	pop {lr}
	bx lr

inAddr: .word in
n1Addr: .word n1
n2Addr: .word n2
n3Addr: .word n3
numsAddr: .word nums
totalAddr: .word total

.global time
.global srand
.global gRand
.global printf
.global scanf
