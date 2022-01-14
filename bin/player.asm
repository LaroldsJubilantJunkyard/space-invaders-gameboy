;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module player
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpawnBullet
	.globl _joypad
	.globl _joypadPrevious
	.globl _joypadCurrent
	.globl _paddle
	.globl _SetupPlayer
	.globl _UpdatePlayer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_paddle::
	.ds 4
_joypadCurrent::
	.ds 1
_joypadPrevious::
	.ds 1
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
;source/default/player.c:8: void SetupPlayer(){
;	---------------------------------
; Function SetupPlayer
; ---------------------------------
_SetupPlayer::
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;source/default/player.c:13: paddle.x=80;
	ld	hl, #_paddle
	ld	(hl), #0x50
;source/default/player.c:14: paddle.y=128;
	ld	hl, #(_paddle + 1)
	ld	(hl), #0x80
;source/default/player.c:15: paddle.dead=0;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x00
;source/default/player.c:17: joypadCurrent=0;
	ld	hl, #_joypadCurrent
	ld	(hl), #0x00
;source/default/player.c:18: joypadPrevious=0; 
	ld	hl, #_joypadPrevious
	ld	(hl), #0x00
;source/default/player.c:19: }
	ret
;source/default/player.c:21: void UpdatePlayer(){
;	---------------------------------
; Function UpdatePlayer
; ---------------------------------
_UpdatePlayer::
;source/default/player.c:23: joypadPrevious=joypadCurrent;
	ld	a, (#_joypadCurrent)
	ld	(#_joypadPrevious),a
;source/default/player.c:24: joypadCurrent=joypad();
	call	_joypad
	ld	hl, #_joypadCurrent
	ld	(hl), e
;source/default/player.c:26: if(joypad() & J_LEFT)paddle.x-=2;
	call	_joypad
	bit	1, e
	jr	Z, 00104$
	ld	bc, #_paddle+0
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
	jr	00105$
00104$:
;source/default/player.c:27: else if(joypad() & J_RIGHT)paddle.x+=2;
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00105$
	ld	bc, #_paddle+0
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
00105$:
;source/default/player.c:30: if(paddle.x<8)paddle.x=8;
	ld	bc, #_paddle+0
	ld	a, (bc)
	sub	a, #0x08
	jr	NC, 00107$
	ld	a, #0x08
	ld	(bc), a
00107$:
;source/default/player.c:31: if(paddle.x>152)paddle.x=152;
	ld	a, (bc)
	ld	e, a
	ld	a,#0x98
	cp	a,e
	jr	NC, 00109$
	ld	(bc), a
00109$:
;source/default/player.c:34: if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00111$
	ld	a, (#_joypadPrevious)
	bit	4, a
	jr	NZ, 00111$
;source/default/player.c:35: SpawnBullet(paddle.x,paddle.y-12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0xf4
	ld	b, a
	ld	a, (#_paddle + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_SpawnBullet
	pop	hl
00111$:
;source/default/player.c:38: move_sprite(0,paddle.x,paddle.y+12);
	ld	bc, #_paddle+0
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	d, a
	ld	a, (bc)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;source/default/player.c:39: move_sprite(1,paddle.x+8,paddle.y+12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;source/default/player.c:39: move_sprite(1,paddle.x+8,paddle.y+12);
;source/default/player.c:40: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
