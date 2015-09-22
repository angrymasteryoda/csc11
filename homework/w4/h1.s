/*
michael risher
homework 1
*/

.global _start

_start:
  mov r1, #88  /* bp0 width7 */
  ldr r2, =0x00155556   /*bp-24 wd24
  mul r0, r1, r2
  lsr r0, #24
  swi 0
