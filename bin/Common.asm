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
	.globl _ClearBackground
	.globl _ClearAllSprites
	.globl _GetNextAvailableSprite
	.globl _fill_bkg_rect
	.globl _slideDir
	.globl _spaceInvadersFontCurrentStart
	.globl _highScore
	.globl _level
	.globl _invadersRemaining
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
_invadersRemaining::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_level::
	.ds 1
_highScore::
	.ds 1
_spaceInvadersFontCurrentStart::
	.ds 1
_slideDir::
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:6: uint8_t GetNextAvailableSprite(){
;	---------------------------------
; Function GetNextAvailableSprite
; ---------------------------------
_GetNextAvailableSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:8: for(uint8_t i=2;i<40;i++){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:8: for(uint8_t i=2;i<40;i++){
	inc	d
	ld	e, d
	jr	00106$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:13: return 39;
	ld	e, #0x27
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:14: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:16: void ClearAllSprites(){
;	---------------------------------
; Function ClearAllSprites
; ---------------------------------
_ClearAllSprites::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:18: for(uint8_t i=0;i<40;i++){
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x28
	ret	NC
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:18: for(uint8_t i=0;i<40;i++){
	inc	c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:22: }
	jr	00105$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:23: void ClearBackground(){
;	---------------------------------
; Function ClearBackground
; ---------------------------------
_ClearBackground::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:25: fill_bkg_rect(0,0,20,18,0);
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:26: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:29: uint8_t RandomNumber(uint8_t min, uint8_t max){
;	---------------------------------
; Function RandomNumber
; ---------------------------------
_RandomNumber::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:32: uint8_t v = DIV_REG+shadow_OAM[0].x+shadow_OAM[2].x+shadow_OAM[3].x;
	ld	hl, #(_shadow_OAM + 1)
	ld	c, (hl)
	ldh	a, (_DIV_REG + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 9) + 0)
	add	a, c
	ld	c, a
	ld	a, (#(_shadow_OAM + 13) + 0)
	add	a, c
	ldhl	sp,	#0
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:34: return min+(v % (max-min));    // get value at memory address
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	c, a
	ld	b, #0x00
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, e
	ld	e, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:35: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__level:
	.db #0x01	; 1
__xinit__highScore:
	.db #0x00	; 0
__xinit__spaceInvadersFontCurrentStart:
	.db #0x00	; 0
__xinit__slideDir:
	.db #0xff	; -1
	.area _CABS (ABS)
