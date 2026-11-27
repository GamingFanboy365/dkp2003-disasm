@ Common assembler setup for all generated sources.
	.syntax unified
	.cpu arm7tdmi

@ One entry of a level object list (assets/levels/*/objects.s):
@ position and a pointer to the object's class info (first byte = class).
	.macro level_object x, y, z, info
	.4byte \x, \y, \z, \info
	.endm

@ End of a level object list (an all-zero record).
	.macro level_objects_end
	.4byte 0, 0, 0, 0
	.endm
