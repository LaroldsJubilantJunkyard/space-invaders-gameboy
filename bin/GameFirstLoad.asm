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
	.globl _set_sprite_data
	.globl _set_bkg_data
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:16: const palette_color_t blackAndWhite[4] = {
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:21: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:22: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:23: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:24: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:25: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/include/gb/gb.h:1195: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:29: set_sprite_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	ld	de, #_Player_tiles
	push	de
	ld	hl, #0x201
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:30: set_sprite_data(BULLETA_SPRITE_START,BulletA_TILE_COUNT,BulletA_tiles);
	ld	de, #_BulletA_tiles
	push	de
	ld	hl, #0x303
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:31: set_sprite_data(BULLETB_SPRITE_START,BulletB_TILE_COUNT,BulletB_tiles);
	ld	de, #_BulletB_tiles
	push	de
	ld	hl, #0x306
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:32: set_sprite_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);
	ld	de, #_Player_tiles
	push	de
	ld	hl, #0x209
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:34: set_bkg_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	ld	de, #_Player_tiles
	push	de
	ld	hl, #0x201
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:35: set_bkg_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);
	ld	de, #_Player_tiles
	push	de
	ld	hl, #0x209
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:36: set_bkg_data(BARRICADE_TILES_START,Barricade_TILE_COUNT,Barricade_tiles);
	ld	de, #_Barricade_tiles
	push	de
	ld	hl, #0xf03
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:37: set_bkg_data(INVADER1_TILES_START,Invader1_TILE_COUNT,Invader1_tiles);
	ld	de, #_Invader1_tiles
	push	de
	ld	hl, #0x1012
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:38: set_bkg_data(INVADER2_TILES_START,Invader2_TILE_COUNT,Invader2_tiles);
	ld	de, #_Invader2_tiles
	push	de
	ld	hl, #0x1022
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:39: set_bkg_data(INVADER3_TILES_START,Invader3_TILE_COUNT,Invader3_tiles);
	ld	de, #_Invader3_tiles
	push	de
	ld	hl, #0x1032
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:40: set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
	ld	de, #_SpaceInvadersFont_tiles
	push	de
	ld	hl, #0x2b42
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:42: set_sprite_palette(0,1,blackAndWhite);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\GameFirstLoad.c:49: }
	add	sp, #12
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
