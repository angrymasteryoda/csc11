.global main

main:
	vadd.f32 s1, s2, s3
	vadd.f32 s1, s8, s15
	vadd.f32 s8, s16, s24
	vadd.f32 s10, s16, s24
	vadd.f32 s8, s16, s3
	bx lr