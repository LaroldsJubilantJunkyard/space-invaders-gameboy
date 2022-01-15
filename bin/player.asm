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
	.ds 4
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:8: void SetupPlayer(){
;	---------------------------------
; Function SetupPlayer
; ---------------------------------
_SetupPlayer::
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:13: paddle.x=80;
	ld	hl, #_paddle
	ld	(hl), #0x50
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:14: paddle.y=128;
	ld	hl, #(_paddle + 1)
	ld	(hl), #0x80
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:15: paddle.dead=0;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:16: paddle.lives=3;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:17: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:19: void UpdatePlayer(){
;	---------------------------------
; Function UpdatePlayer
; ---------------------------------
_UpdatePlayer::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:21: if(joypad() & J_LEFT)paddle.x-=2;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:22: else if(joypad() & J_RIGHT)paddle.x+=2;
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00105$
	ld	bc, #_paddle+0
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:25: if(paddle.x<8)paddle.x=8;
	ld	bc, #_paddle+0
	ld	a, (bc)
	sub	a, #0x08
	jr	NC, 00107$
	ld	a, #0x08
	ld	(bc), a
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:26: if(paddle.x>152)paddle.x=152;
	ld	a, (bc)
	ld	e, a
	ld	a,#0x98
	cp	a,e
	jr	NC, 00109$
	ld	(bc), a
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:29: if((joypadCurrent & J_A) && !(joypadPrevious & J_A)){
	ld	a, (#_joypadCurrent)
	bit	4, a
	jr	Z, 00113$
	ld	a, (#_joypadPrevious)
	bit	4, a
	jr	NZ, 00113$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:31: if(shadow_OAM[2].tile==0){
	ld	a, (#(_shadow_OAM + 10) + 0)
	or	a, a
	jr	NZ, 00113$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:32: shadow_OAM[2].x=paddle.x+4;
	ld	de, #_shadow_OAM+9
	ld	a, (bc)
	add	a, #0x04
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:33: shadow_OAM[2].y=paddle.y+12;
	ld	bc, #_shadow_OAM+8
	ld	a, (#(_paddle + 1) + 0)
	add	a, #0x0c
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:34: shadow_OAM[2].tile=42;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x2a
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:39: move_sprite(0,paddle.x,paddle.y+12);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:40: move_sprite(1,paddle.x+8,paddle.y+12);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:40: move_sprite(1,paddle.x+8,paddle.y+12);
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\player.c:41: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
