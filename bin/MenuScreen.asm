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
	.globl _DrawText
	.globl _set_sprite_data
	.globl _set_bkg_tile_xy
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:16: void SetupMenuScreen(){
;	---------------------------------
; Function SetupMenuScreen
; ---------------------------------
_SetupMenuScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:19: spaceInvadersFontCurrentStart=SPACEINVADERSFONT_TILES_START;
	ld	hl, #_spaceInvadersFontCurrentStart
	ld	(hl), #0x35
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:20: set_sprite_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	ld	bc, #_Player_tiles+0
	push	bc
	ld	hl, #0x201
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:21: set_sprite_data(BULLETA_SPRITE_START,BulletA_TILE_COUNT,BulletA_tiles);
	ld	de, #_BulletA_tiles
	push	de
	ld	hl, #0x503
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:22: set_sprite_data(BULLETB_SPRITE_START,BulletB_TILE_COUNT,BulletB_tiles);
	ld	de, #_BulletB_tiles
	push	de
	ld	hl, #0x108
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:23: set_sprite_data(BULLETC_SPRITE_START,BulletC_TILE_COUNT,BulletC_tiles);
	ld	de, #_BulletC_tiles
	push	de
	ld	hl, #0x109
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:24: set_sprite_data(ALIEN_SPRITE_START,Alien_TILE_COUNT,Alien_tiles);
	ld	de, #_Alien_tiles
	push	de
	ld	hl, #0x20a
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:25: set_sprite_data(EXPLOSION_SPRITE_START,Explosion_TILE_COUNT,Explosion_tiles);
	ld	de, #_Explosion_tiles
	push	de
	ld	hl, #0x40c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:27: set_bkg_data(PLAYER_SPRITE_START,Player_TILE_COUNT,Player_tiles);
	push	bc
	ld	hl, #0x201
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:28: set_bkg_data(ALIEN_TILES_START,Alien_TILE_COUNT,Alien_tiles);
	ld	de, #_Alien_tiles
	push	de
	ld	hl, #0x203
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:29: set_bkg_data(INVADER1_TILES_START,Invader1_TILE_COUNT,Invader1_tiles);
	ld	de, #_Invader1_tiles
	push	de
	ld	hl, #0x1005
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:30: set_bkg_data(INVADER2_TILES_START,Invader2_TILE_COUNT,Invader2_tiles);
	ld	de, #_Invader2_tiles
	push	de
	ld	hl, #0x1015
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:31: set_bkg_data(INVADER3_TILES_START,Invader3_TILE_COUNT,Invader3_tiles);
	ld	de, #_Invader3_tiles
	push	de
	ld	hl, #0x1025
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:32: set_bkg_data(SPACEINVADERSFONT_TILES_START,SpaceInvadersFont_TILE_COUNT,SpaceInvadersFont_tiles);
	ld	de, #_SpaceInvadersFont_tiles
	push	de
	ld	hl, #0x2b35
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:33: set_bkg_data(BARRICADE_TILES_START,Barricade_TILE_COUNT,Barricade_tiles);
	ld	de, #_Barricade_tiles
	push	de
	ld	hl, #0xf60
	push	hl
	call	_set_bkg_data
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:35: DrawText(8,2,"PLAY");
	ld	de, #___str_0
	push	de
	ld	hl, #0x208
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:36: DrawText(3,4,"SPACE  INVADERS");
	ld	de, #___str_1
	push	de
	ld	hl, #0x403
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:37: DrawText(0,7,"*SCORE ADVANCE TABLE");
	ld	de, #___str_2
	push	de
	ld	hl, #0x700
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:39: DrawText(6,9,"=? MYSTERY");
	ld	de, #___str_3
	push	de
	ld	hl, #0x906
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:40: DrawText(6,11,"=30 POINTS");
	ld	de, #___str_4
	push	de
	ld	hl, #0xb06
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:41: DrawText(6,13,"=20 POINS");
	ld	de, #___str_5
	push	de
	ld	hl, #0xd06
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:42: DrawText(6,15,"=10 POINTS");
	ld	de, #___str_6
	push	de
	ld	hl, #0xf06
	push	hl
	call	_DrawText
	add	sp, #4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:44: set_bkg_tile_xy(4,9,ALIEN_TILES_START);
	ld	hl, #0x309
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:45: set_bkg_tile_xy(5,9,ALIEN_TILES_START+1);
	ld	hl, #0x409
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:47: set_bkg_tile_xy(5,11,INVADER1_TILES_START);
	ld	hl, #0x50b
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:48: set_bkg_tile_xy(5,13,INVADER2_TILES_START);
	ld	hl, #0x150d
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:49: set_bkg_tile_xy(5,15,INVADER3_TILES_START);
	ld	hl, #0x250f
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:52: }
	ret
___str_0:
	.ascii "PLAY"
	.db 0x00
___str_1:
	.ascii "SPACE  INVADERS"
	.db 0x00
___str_2:
	.ascii "*SCORE ADVANCE TABLE"
	.db 0x00
___str_3:
	.ascii "=? MYSTERY"
	.db 0x00
___str_4:
	.ascii "=30 POINTS"
	.db 0x00
___str_5:
	.ascii "=20 POINS"
	.db 0x00
___str_6:
	.ascii "=10 POINTS"
	.db 0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:53: uint8_t UpdateMenuScreen(){
;	---------------------------------
; Function UpdateMenuScreen
; ---------------------------------
_UpdateMenuScreen::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:55: if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00102$
	ld	a, (#_joypadPrevious)
	bit	4, a
	jr	NZ, 00102$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:57: level=1;
	ld	hl, #_level
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:59: return NEXTLEVELSCREEN;
	ld	e, #0x04
	ret
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:62: return MENUSCREEN;
	ld	e, #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\MenuScreen.c:64: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
