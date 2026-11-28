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

@ Sprite animation scripts (assets/graphics/sprites/anims.s, run by
@ anims_update): frame numbers, and commands that start with 0xFF.
	.macro anim_frames f:vararg
	.byte \f
	.endm
	.macro anim_goto target          @ continue at target (relative, 16 bits)
	.byte 0xFF, 0x00
	.2byte \target - .
	.endm
	.macro anim_delay n              @ frames per animation frame
	.byte 0xFF, 0x01, \n
	.endm
	.macro anim_stop
	.byte 0xFF, 0x02
	.endm
	.macro anim_done                 @ sets flag bit 0 ("finished", the hold frame follows)
	.byte 0xFF, 0x03
	.endm
	.macro anim_restart              @ clears flag bit 1 (the bit anim_stop sets)
	.byte 0xFF, 0x04
	.endm

@ the CPU racers' path in a level (tools/aipath.py)
.macro ai_path_header flags, count
	.2byte \flags
	.2byte \count
.endm
.macro ai_node x, y, z, first, n, angle, a, b, c, f0, f1, ex, ez, ox, oz, nx, nz, d, bias, g0, g1, g2, g3
	.2byte \x, \y, \z, \first, \n, \angle, \a, \b, \c
	.byte \f0, \f1
	.2byte \ex, \ez, \ox, \oz, \nx, \nz
	.4byte \d, \bias
	.byte \g0, \g1, \g2, \g3
.endm
.macro ai_link node, weight
	.2byte \node, \weight
.endm
