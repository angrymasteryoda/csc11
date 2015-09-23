/*
michael risher
homework 2
problem 4
*/

.global _start

_start:
  mov r1, #110  /* bp0 wd7 */
  ldr r2, =0x00517cc1 /*bp-24 wd24 */
  mul r0, r2, r1  /*bp-24 wd 31*/
  lsr r0, #24
  mov r7, #1
  swi 0
