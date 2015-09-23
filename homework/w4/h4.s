/*
michael risher
homework 1
problem 4
*/

.global _start

_start:
  mov r1, #6  /* bp0 wd3 */
  ldr r2, =0x003243f6 /*bp-20 wd24 */
  mul r0, r2, r1  /*bp-20 wd 27*/
  lsr r0, #20
  mov r7, #1
  swi 0
