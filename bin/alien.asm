;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module alien
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UpdateAlien
	.globl _SetupAlien
	.globl _IncreaseScore
	.globl _RandomNumber
	.globl _alienCounter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_alienCounter::
	.ds 2
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:8: void SetupAlien(){
;	---------------------------------
; Function SetupAlien
; ---------------------------------
_SetupAlien::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:10: alienCounter=0;
	xor	a, a
	ld	hl, #_alienCounter
	ld	(hl+), a
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+32
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+36
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:18: move_sprite(ALIEN_OAM_SPRITE+1,0,0);
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:19: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:21: void UpdateAlien(){
;	---------------------------------
; Function UpdateAlien
; ---------------------------------
_UpdateAlien::
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:23: if(shadow_OAM[ALIEN_OAM_SPRITE].tile==0){
	ld	a, (#(_shadow_OAM + 34) + 0)
	or	a, a
	jr	NZ, 00102$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:24: alienCounter++;;
	ld	hl, #_alienCounter
	inc	(hl)
	jr	NZ, 00196$
	inc	hl
	inc	(hl)
00196$:
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:28: if(alienCounter>=400&&shadow_OAM[ALIEN_OAM_SPRITE].tile==0){
	ld	hl, #_alienCounter
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x90
	ld	a, b
	sbc	a, #0x01
	jr	C, 00121$
	ld	a, (#(_shadow_OAM + 34) + 0)
	or	a, a
	jr	NZ, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:30: if(RandomNumber(0,100)<10){
	ld	hl, #0x6400
	push	hl
	call	_RandomNumber
	pop	hl
	ld	a, e
	sub	a, #0x0a
	jr	NC, 00104$
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x0a
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x0b
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, #0x18
	ld	(hl+), a
	ld	(hl), #0xe7
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ld	a, #0x18
	ld	(hl+), a
	ld	(hl), #0xef
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:38: move_sprite(ALIEN_OAM_SPRITE+1,239,24);
	jp	00134$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:41: alienCounter=0;
	xor	a, a
	ld	hl, #_alienCounter
	ld	(hl+), a
	ld	(hl), a
	jp	00134$
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:44: }else if(shadow_OAM[ALIEN_OAM_SPRITE].tile!=0){
	ld	a, (#(_shadow_OAM + 34) + 0)
	or	a, a
	jp	Z, 00134$
;C:/gbdk/include/gb/gb.h:1415: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+32
;C:/gbdk/include/gb/gb.h:1416: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1415: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+36
;C:/gbdk/include/gb/gb.h:1416: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:51: if(PlayerBulletSprite.tile!=0){
	ld	a, (#(_shadow_OAM + 10) + 0)
	or	a, a
	jr	Z, 00114$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:55: INT8 xd = PlayerBulletSprite.x-(shadow_OAM[ALIEN_OAM_SPRITE+1].x-8);
	ld	hl, #(_shadow_OAM + 9)
	ld	c, (hl)
	ld	a, (#(_shadow_OAM + 37) + 0)
	add	a, #0xf8
	ld	b, a
	ld	a, c
	sub	a, b
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:56: INT8 yd = PlayerBulletSprite.y-shadow_OAM[ALIEN_OAM_SPRITE+1].y;
	ld	a, (#(_shadow_OAM + 8) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	de, #_shadow_OAM+36
	ld	a, (de)
	ld	e, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, e
	ld	b, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:58: if(xd<0)xd=-xd;
	bit	7, c
	jr	Z, 00107$
	xor	a, a
	sub	a, c
	ld	c, a
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:59: if(yd<0)yd=-yd;
	bit	7, b
	jr	Z, 00109$
	xor	a, a
	sub	a, b
	ld	b, a
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:62: if(xd<=8&&yd<=8){
	ld	e, c
	ld	a,#0x08
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00197$
	bit	7, d
	jr	NZ, 00198$
	cp	a, a
	jr	00198$
00197$:
	bit	7, d
	jr	Z, 00198$
	scf
00198$:
	jr	C, 00114$
	ld	e, b
	ld	a,#0x08
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00199$
	bit	7, d
	jr	NZ, 00200$
	cp	a, a
	jr	00200$
00199$:
	bit	7, d
	jr	Z, 00200$
	scf
00200$:
	jr	C, 00114$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:66: shadow_OAM[ALIEN_OAM_SPRITE].x=178;
	ld	hl, #(_shadow_OAM + 33)
	ld	(hl), #0xb2
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:69: PlayerBulletSprite.tile=0;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:70: PlayerBulletSprite.x=0;
	ld	hl, #(_shadow_OAM + 9)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:71: PlayerBulletSprite.y=0;
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:74: IncreaseScore(100);
	ld	a, #0x64
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
00114$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:81: if(shadow_OAM[ALIEN_OAM_SPRITE].x>168 &&shadow_OAM[ALIEN_OAM_SPRITE].x<200){       
	ld	hl, #(_shadow_OAM + 33)
	ld	c, (hl)
	ld	a, #0xa8
	sub	a, c
	jr	NC, 00134$
	ld	a, (#(_shadow_OAM + 33) + 0)
	sub	a, #0xc8
	jr	NC, 00134$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:83: alienCounter=0;     
	xor	a, a
	ld	hl, #_alienCounter
	ld	(hl+), a
	ld	(hl), a
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x00
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 32)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 36)
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	xor	a, a
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:91: move_sprite(ALIEN_OAM_SPRITE+1,0,0);
00134$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\alien.c:95: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
