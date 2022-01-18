;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module player
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _joypad
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
	.ds 5
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:9: void SetupPlayer(){
;	---------------------------------
; Function SetupPlayer
; ---------------------------------
_SetupPlayer::
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:14: paddle.x=80;
	ld	hl, #_paddle
	ld	(hl), #0x50
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:15: paddle.y=138;
	ld	hl, #(_paddle + 1)
	ld	(hl), #0x8a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:16: paddle.dead=0;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:17: paddle.lives=3;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:18: paddle.damageTimer=0;
	ld	hl, #(_paddle + 4)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:19: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:21: void UpdatePlayer(){
;	---------------------------------
; Function UpdatePlayer
; ---------------------------------
_UpdatePlayer::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:23: if(joypad() & J_LEFT)paddle.x-=2;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:24: else if(joypad() & J_RIGHT)paddle.x+=2;
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00105$
	ld	bc, #_paddle+0
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:27: if(paddle.x<8)paddle.x=8;
	ld	bc, #_paddle+0
	ld	a, (bc)
	sub	a, #0x08
	jr	NC, 00107$
	ld	a, #0x08
	ld	(bc), a
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:28: if(paddle.x>152)paddle.x=152;
	ld	a, (bc)
	ld	e, a
	ld	a,#0x98
	cp	a,e
	jr	NC, 00109$
	ld	(bc), a
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:31: if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00113$
	ld	a, (#_joypadPrevious)
	bit	4, a
	jr	NZ, 00113$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:33: if(shadow_OAM[2].tile==0){
	ld	a, (#(_shadow_OAM + 10) + 0)
	or	a, a
	jr	NZ, 00113$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:34: shadow_OAM[2].x=paddle.x+4;
	ld	de, #_shadow_OAM+9
	ld	a, (bc)
	add	a, #0x04
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:35: shadow_OAM[2].y=paddle.y+12;
	ld	bc, #_shadow_OAM+8
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:36: shadow_OAM[2].tile=BULLETC_SPRITE_START;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x09
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:40: if(paddle.damageTimer>0){
	ld	bc, #_paddle + 4
	ld	a, (bc)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:46: move_sprite(0,paddle.x,paddle.y+12);
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:40: if(paddle.damageTimer>0){
	ld	e, a
	or	a, a
	jr	Z, 00119$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:42: paddle.damageTimer--;
	dec	e
	ld	a, e
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:44: if(paddle.damageTimer/3%2==0){
	ld	d, #0x00
	ld	bc, #0x0003
	push	bc
	push	de
	call	__divsint
	add	sp, #4
	ld	bc, #0x0002
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ld	a, d
	or	a, e
	jr	NZ, 00116$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:46: move_sprite(0,paddle.x,paddle.y+12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ldhl	sp,	#0
	ld	(hl), a
	ld	hl, #_paddle
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:47: move_sprite(1,paddle.x+8,paddle.y+12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#_paddle + 0)
	add	a, #0x08
	ld	e, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:47: move_sprite(1,paddle.x+8,paddle.y+12);
	jr	00127$
00116$:
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+4
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:51: move_sprite(1,0,0);
	jr	00127$
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:56: move_sprite(0,paddle.x,paddle.y+12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	b, a
	ld	hl, #_paddle
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:57: move_sprite(1,paddle.x+8,paddle.y+12);
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	b, a
	ld	a, (#_paddle + 0)
	add	a, #0x08
	ld	c, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:57: move_sprite(1,paddle.x+8,paddle.y+12);
00127$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:59: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
