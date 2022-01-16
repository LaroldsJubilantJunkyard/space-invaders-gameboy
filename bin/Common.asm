;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Common
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RandomNumber
	.globl _GetNextAvailableSprite
	.globl _highScore
	.globl _level
	.globl _slideDir
	.globl _joypadPrevious
	.globl _joypadCurrent
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_joypadCurrent::
	.ds 1
_joypadPrevious::
	.ds 1
_slideDir::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_level::
	.ds 1
_highScore::
	.ds 1
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:6: UINT8 GetNextAvailableSprite(){
;	---------------------------------
; Function GetNextAvailableSprite
; ---------------------------------
_GetNextAvailableSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:8: for(UINT8 i=2;i<40;i++){
	ld	de, #0x202
00106$:
	ld	a, d
	sub	a, #0x28
	jr	NC, 00103$
;C:/gbdk/include/gb/gb.h:1337: return shadow_OAM[nb].tile;
	ld	bc, #_shadow_OAM+0
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, (hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:9: if(get_sprite_tile(i)==0){
	or	a, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:10: return i;
	ret	Z
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:8: for(UINT8 i=2;i<40;i++){
	inc	d
	ld	e, d
	jr	00106$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:13: return 39;
	ld	e, #0x27
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:14: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:17: UINT8 RandomNumber(UINT8 min, UINT8 max){
;	---------------------------------
; Function RandomNumber
; ---------------------------------
_RandomNumber::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:23: UINT8 v = (*(ptr_div_reg))+shadow_OAM[0].x+shadow_OAM[1].x+shadow_OAM[2].x+shadow_OAM[3].x+shadow_OAM[4].x;
	ld	hl, #0xff04
	ld	c, (hl)
	ld	a, (#(_shadow_OAM + 1) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 5) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 9) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 13) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 17) + 0)
	add	a, c
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:25: return min+(v % (max-min));    // get value at memory address
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	b, #0x00
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, #0x00
	ld	d, a
	push	de
	push	bc
	call	__modsint
	add	sp, #4
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, e
	ld	e, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:26: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__level:
	.db #0x01	; 1
__xinit__highScore:
	.db #0x00	; 0
	.area _CABS (ABS)
