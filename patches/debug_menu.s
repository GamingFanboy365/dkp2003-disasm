@ Boot into the hidden debug menu instead of the language screen.
@ Build: tools/make_patch.py baserom.gba patches/debug_menu.s out.ips
@ (.org values are ROM offsets.)
	.syntax unified
	.cpu arm7tdmi
	.thumb

@ After the logos, the boot code (in eeprom.s) calls fe_options_init(1),
@    the language screen.  Call debug_menu_init (0x0800271C) instead; it
@    installs its own per-frame handler in gStateFunc.  The menu's
@    "New Frontend" item (fe_title_init) leads on to the normal front end.
@    Controls: UP/DOWN choose an item; A/B change Level, Player and Play
@    Mode; LEFT/RIGHT change Volume; A/B/START open the other items, and
@    START on Level starts a race.
	.org 0x1EE14
	bl . + (0x0800271C - 0x0801EE14)
