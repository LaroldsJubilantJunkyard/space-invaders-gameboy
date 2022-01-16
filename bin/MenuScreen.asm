;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module MenuScreen
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateMenuScreen
	.globl _SetupMenuScreen
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:14: void SetupMenuScreen(){
;	---------------------------------
; Function SetupMenuScreen
; ---------------------------------
_SetupMenuScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:17: spaceInvadersFontCurrentStart=SPACEINVADERSFONT_TILES_START;
	ld	hl, #_spaceInvadersFontCurrentStart
	ld	(hl), #0x33
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:18: set_sprite_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	ld	bc, #_Player_tiles+0
	push	bc
	ld	hl, #0x201
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:19: set_sprite_data(BULLETA_SPRITE_START,BulletA_TILE_COUNT,BulletA_tiles);
	ld	de, #_BulletA_tiles
	push	de
	ld	hl, #0x303
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:20: set_sprite_data(BULLETB_SPRITE_START,BulletB_TILE_COUNT,BulletB_tiles);
	ld	de, #_BulletB_tiles
	push	de
	ld	hl, #0x306
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:21: set_sprite_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);
	push	bc
	ld	hl, #0x20a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:23: set_bkg_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	push	bc
	ld	hl, #0x201
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:24: set_bkg_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Player_tiles);
	push	bc
	ld	hl, #0x20a
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:25: set_bkg_data(INVADER1_TILES_START,Invader1_TILE_COUNT,Invader1_tiles);
	ld	de, #_Invader1_tiles
	push	de
	ld	hl, #0x1003
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:26: set_bkg_data(INVADER2_TILES_START,Invader2_TILE_COUNT,Invader2_tiles);
	ld	de, #_Invader2_tiles
	push	de
	ld	hl, #0x1013
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:27: set_bkg_data(INVADER3_TILES_START,Invader3_TILE_COUNT,Invader3_tiles);
	ld	de, #_Invader3_tiles
	push	de
	ld	hl, #0x1023
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:28: set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
	ld	de, #_SpaceInvadersFont_tiles
	push	de
	ld	hl, #0x2b33
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:29: set_bkg_data(BARRICADE_TILES_START,Barricade_TILE_COUNT,Barricade_tiles);
	ld	de, #_Barricade_tiles
	push	de
	ld	hl, #0xf5e
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:31: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:32: UINT8 UpdateMenuScreen(){
;	---------------------------------
; Function UpdateMenuScreen
; ---------------------------------
_UpdateMenuScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:34: if(joypadCurrent & J_A){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00102$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:36: level=1;
	ld	hl, #_level
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:38: return NEXTLEVELSCREEN;
	ld	e, #0x04
	ret
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:41: return MENUSCREEN;
	ld	e, #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:43: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
