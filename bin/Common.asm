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
	.globl _DrawNumber
	.globl _GetNextAvailableSprite
	.globl _set_win_tiles
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:7: UINT8 GetNextAvailableSprite(){
;	---------------------------------
; Function GetNextAvailableSprite
; ---------------------------------
_GetNextAvailableSprite::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:9: for(UINT8 i=2;i<40;i++){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:10: if(get_sprite_tile(i)==0){
	or	a, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:11: return i;
	ret	Z
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:9: for(UINT8 i=2;i<40;i++){
	inc	d
	ld	e, d
	jr	00106$
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:14: return 39;
	ld	e, #0x27
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:15: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:17: void DrawNumber(UINT8 x,UINT8 y, UINT16 number,UINT8 digits){
;	---------------------------------
; Function DrawNumber
; ---------------------------------
_DrawNumber::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:19: if(digits>=5)set_win_tiles(x++,y,5,1,(number/10000)%10+47);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x05
	jr	C, 00102$
	dec	hl
	dec	hl
	ld	de, #0x2710
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x002f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	b, (hl)
	ld	a, b
	inc	a
	ld	(hl+), a
	push	de
	ld	de, #0x105
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:20: if(digits>=4)set_win_tiles(x++,y,5,1,(number/1000)%10+47);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x04
	jr	C, 00104$
	dec	hl
	dec	hl
	ld	de, #0x03e8
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x002f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	b, (hl)
	ld	a, b
	inc	a
	ld	(hl+), a
	push	de
	ld	de, #0x105
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:21: if(digits>=3)set_win_tiles(x++,y,5,1,(number/100)%10+47);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00106$
	dec	hl
	dec	hl
	ld	de, #0x0064
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x002f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	b, (hl)
	ld	a, b
	inc	a
	ld	(hl+), a
	push	de
	ld	de, #0x105
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:22: if(digits>=2)set_win_tiles(x++,y,5,1,(number/10)%10+47);
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x02
	jr	C, 00108$
	dec	hl
	dec	hl
	ld	de, #0x000a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
	add	sp, #4
	ld	bc, #0x000a
	push	bc
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x002f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	b, (hl)
	ld	a, b
	inc	a
	ld	(hl+), a
	push	de
	ld	de, #0x105
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tiles
	add	sp, #6
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:23: set_win_tiles(x,y,5,1,number%10+47);
	ld	de, #0x000a
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__moduint
	add	sp, #4
	ld	hl, #0x002f
	add	hl, de
	push	hl
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#7
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_win_tiles
	add	sp, #6
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:24: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:26: UINT8 RandomNumber(UINT8 min, UINT8 max){
;	---------------------------------
; Function RandomNumber
; ---------------------------------
_RandomNumber::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:32: UINT8 v = (*(ptr_div_reg))+shadow_OAM[0].x+shadow_OAM[1].x+shadow_OAM[2].x+shadow_OAM[3].x+shadow_OAM[4].x;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:34: return min+(v % (max-min));    // get value at memory address
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\Common.c:35: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__level:
	.db #0x01	; 1
__xinit__highScore:
	.db #0x00	; 0
	.area _CABS (ABS)
