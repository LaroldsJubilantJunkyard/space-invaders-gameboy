;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module GameFirstLoad
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GameFirstLoad
	.globl _set_sprite_palette
	.globl _set_bkg_palette
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:14: void GameFirstLoad(){
;	---------------------------------
; Function GameFirstLoad
; ---------------------------------
_GameFirstLoad::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:16: const palette_color_t blackAndWhite[4] = { RGB8(255, 255, 255), RGB8(0, 0, 0),RGB8(0, 0, 0),RGB8(0, 0, 0)    };
	ldhl	sp,	#0
	ld	c,l
	ld	b,h
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0x7f
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	inc	de
	ld	(de), a
	ld	hl, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	ld	hl, #0x0006
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:19: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:20: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:21: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:22: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:24: set_sprite_palette(0,1,blackAndWhite);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:28: }
	add	sp, #12
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
