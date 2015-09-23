/*
michael risher
homework 1
*/

.global _start

_start:
  ldr r1, =0x7167  /* bp-8 wd 16 */
  ldr r2, =0x517d  /*bp-16 wd 16*/
  mul r0, r2, r1  /*bp-24 wd 32*/
  lsr r0, #24
  mov r7, #1
  swi 0
