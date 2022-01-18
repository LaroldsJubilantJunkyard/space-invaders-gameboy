;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Hud
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawText
	.globl _set_bkg_tile_xy
	.globl _DrawNumber
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:4: void DrawNumber(uint8_t x,uint8_t y, uint16_t number,uint8_t digits){
;	---------------------------------
; Function DrawNumber
; ---------------------------------
_DrawNumber::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:6: if(digits>=5)set_bkg_tile_xy(x++,y,(number/10000)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00102$
	push	bc
	ld	de, #0x2710
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	e, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	a, e
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:7: if(digits>=4)set_bkg_tile_xy(x++,y,(number/1000)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00104$
	push	bc
	ld	de, #0x03e8
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	e, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	a, e
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:8: if(digits>=3)set_bkg_tile_xy(x++,y,(number/100)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
	push	bc
	ld	de, #0x0064
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	e, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	a, e
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:9: if(digits>=2)set_bkg_tile_xy(x++,y,(number/10)%10+spaceInvadersFontCurrentStart+26);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jr	C, 00108$
	push	bc
	ld	de, #0x000a
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	ld	e, a
	ldhl	sp,	#2
	ld	d, (hl)
	ld	a, d
	inc	a
	ld	(hl+), a
	ld	a, e
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:10: set_bkg_tile_xy(x,y,number%10+spaceInvadersFontCurrentStart+26);
	ld	de, #0x000a
	push	de
	push	bc
	call	__moduint
	add	sp, #4
	ld	a, e
	ld	hl, #_spaceInvadersFontCurrentStart
	add	a, (hl)
	add	a, #0x1a
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:11: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:13: void DrawText(uint8_t x, uint8_t y, unsigned char *text){
;	---------------------------------
; Function DrawText
; ---------------------------------
_DrawText::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:17: while(text[i]!='\0'){
	ld	c, #0x00
00133$:
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:22: else if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'a'));
	ld	a, (de)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:17: while(text[i]!='\0'){
	ld	e, a
	or	a, a
	jp	Z, 00136$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:21: if(text[i]>='A'&&text[i]<='Z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'A'));
	ld	a, (#_spaceInvadersFontCurrentStart)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, c
	ld	b, a
	ld	d, e
	ld	a, e
	sub	a, #0x41
	jr	C, 00130$
	ld	a, #0x5a
	sub	a, e
	jr	C, 00130$
	ld	a, d
	add	a, #0xbf
	ldhl	sp,	#0
	add	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00131$
00130$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:22: else if(text[i]>='a'&&text[i]<='z')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+(text[i]-'a'));
	ld	a, e
	sub	a, #0x61
	jr	C, 00126$
	ld	a, #0x7a
	sub	a, e
	jr	C, 00126$
	ld	a, d
	add	a, #0x9f
	ldhl	sp,	#0
	add	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00131$
00126$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:23: else if(text[i]>='0'&&text[i]<='9')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+26+(text[i]-'0'));
	ld	a, e
	sub	a, #0x30
	jr	C, 00122$
	ld	a, #0x39
	sub	a, e
	jr	C, 00122$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x1a
	ld	e, a
	ld	a, d
	add	a, #0xd0
	add	a, e
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00131$
00122$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:27: else if(text[i]=='.')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+36);
	ld	a, e
	sub	a, #0x2e
	jr	NZ, 00119$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x24
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00131$
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:28: else if(text[i]=='-')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+37);
	ld	a, e
	sub	a, #0x2d
	jr	NZ, 00116$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x25
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00131$
00116$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:29: else if(text[i]=='=')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+38);
	ld	a, e
	sub	a, #0x3d
	jr	NZ, 00113$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x26
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00131$
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:30: else if(text[i]=='*')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+39);
	ld	a, e
	sub	a, #0x2a
	jr	NZ, 00110$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x27
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00131$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:31: else if(text[i]=='?')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+40);
	ld	a, e
	sub	a, #0x3f
	jr	NZ, 00107$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x28
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00131$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:32: else if(text[i]=='!')set_bkg_tile_xy(x+i,y,spaceInvadersFontCurrentStart+41);
	ld	a, e
	sub	a, #0x21
	jr	NZ, 00104$
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x29
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00131$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:33: else if(text[i]==' ')set_bkg_tile_xy(x+i,y,0);
	ld	a, e
	sub	a, #0x20
	jr	NZ, 00131$
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00131$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:35: i++;
	inc	c
	jp	00133$
00136$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Hud.c:37: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
