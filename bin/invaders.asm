;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module invaders
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InvadersShouldMove
	.globl _ShiftAllInvadersDown
	.globl _InvaderTryFireBullet
	.globl _SlideInvader
	.globl _UpdateInvaderTiles
	.globl _InvaderCheckBulletCollision
	.globl _InvaderCheckPlayerCollision
	.globl _RandomNumber
	.globl _IncreaseScore
	.globl _GetAvailableBulletSprite
	.globl _fill_bkg_rect
	.globl _set_bkg_tile_xy
	.globl _shotTimer
	.globl _invadersRemaining
	.globl _topRow
	.globl _invaderCounter
	.globl _invaderSpeed
	.globl _invaders
	.globl _tiles
	.globl _SetupInvaders
	.globl _UpdateInvaders
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_invaders::
	.ds 200
_invaderSpeed::
	.ds 1
_invaderCounter::
	.ds 1
_topRow::
	.ds 1
_invadersRemaining::
	.ds 1
_shotTimer::
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:15: void SetupInvaders(){
;	---------------------------------
; Function SetupInvaders
; ---------------------------------
_SetupInvaders::
	add	sp, #-15
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:17: UINT8 alienTypes[3]={INVADER1_TILES_START,INVADER2_TILES_START,INVADER3_TILES_START};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x03
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x13
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x23
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:19: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#14
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00101$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:20: invaders[i].column=(i%8)*2+2;
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	and	a, #0x07
	add	a, a
	add	a, #0x02
	ld	c, a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:21: invaders[i].row=(i/8)+2;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	a,(hl)
	ld	b,a
	rlca
	and	a,#0x01
	ldhl	sp,	#11
	ld	(hl), a
	or	a, a
	jr	Z, 00107$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00107$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	inc	c
	inc	c
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:22: invaders[i].slide=0;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:23: invaders[i].active=1;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:24: invaders[i].originalTile=alienTypes[i/16];
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
00108$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#12
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:27: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	ldhl	sp,#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	ldhl	sp,#5
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	ld	b, a
	push	bc
	ld	a, l
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:19: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#14
	inc	(hl)
	jp	00103$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:31: topRow=2;
	ld	hl, #_topRow
	ld	(hl), #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:32: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:33: slideDir=-1;
	ld	hl, #_slideDir
	ld	(hl), #0xff
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:34: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:35: invaderSpeed=3;
	ld	hl, #_invaderSpeed
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:36: invadersRemaining=40;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x28
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:37: }
	add	sp, #15
	ret
_tiles:
	.db #0x19	; 25
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:39: void InvaderCheckPlayerCollision(UINT8 i){
;	---------------------------------
; Function InvaderCheckPlayerCollision
; ---------------------------------
_InvaderCheckPlayerCollision::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:41: UINT8 playerColumn=paddle.x/8;
	ld	a, (#_paddle + 0)
	ld	c, a
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00106$
	ld	hl, #0x0007
	add	hl, bc
00106$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#0
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:42: UINT8 playerRow=paddle.y/8;
	ld	a, (#(_paddle + 1) + 0)
	ld	c, a
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00107$
	ld	hl, #0x0007
	add	hl, bc
00107$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:44: if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00104$
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00104$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:45: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:46: paddle.lives=0;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x00
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:48: }
	inc	sp
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:50: void InvaderCheckBulletCollision(UINT8 i){
;	---------------------------------
; Function InvaderCheckBulletCollision
; ---------------------------------
_InvaderCheckBulletCollision::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:52: if(PlayerBulletSprite.tile!=0){
	ld	a, (#(_shadow_OAM + 10) + 0)
	or	a, a
	jr	Z, 00110$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:54: INT8 xd = (PlayerBulletSprite.x-4)-(invaders[i].column*8+4+(invaders[i].slide*2));
	ld	a, (#(_shadow_OAM + 9) + 0)
	add	a, #0xfc
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	e, a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, e
	ld	e, a
	ldhl	sp,	#1
	ld	a, (hl-)
	sub	a, e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:55: INT8 yd = (PlayerBulletSprite.y-12)-invaders[i].row*8+4;
	ld	(hl+), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	ld	a, #0xf8
	sub	a, e
	ld	(hl), a
	ld	a, (#(_shadow_OAM + 8) + 0)
	add	a, (hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:57: if(xd<0)xd=-xd;
	ld	(hl-), a
	bit	7, (hl)
	jr	Z, 00102$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:58: if(yd<0)yd=-yd;
	ldhl	sp,	#1
	bit	7, (hl)
	jr	Z, 00104$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:60: if(xd<5&&yd<8){
	ldhl	sp,	#0
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jr	NC, 00110$
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00110$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:62: IncreaseScore(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:65: invaders[i].active=0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:68: PlayerBulletSprite.tile=0;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x00
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:72: }
	inc	sp
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:74: void UpdateInvaderTiles(UINT8 i){
;	---------------------------------
; Function UpdateInvaderTiles
; ---------------------------------
_UpdateInvaderTiles::
	add	sp, #-9
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:77: if(invaders[i].active==0){
	ldhl	sp,	#11
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	inc	sp
	inc	sp
	ld	c, l
	ld	b, h
	push	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:80: set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:77: if(invaders[i].active==0){
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	NZ, 00110$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:80: set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:81: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl-), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	inc	a
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00112$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:84: }else if(invaders[i].slide==0){
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:86: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:84: }else if(invaders[i].slide==0){
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:86: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:87: set_bkg_tile_xy(invaders[i].column-slideDir,invaders[i].row,0);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	hl, #_slideDir
	sub	a, (hl)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00112$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:90: } else if(invaders[i].slide>0){
	ldhl	sp,	#6
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00134$
	bit	7, d
	jr	NZ, 00135$
	cp	a, a
	jr	00135$
00134$:
	bit	7, d
	jr	Z, 00135$
	scf
00135$:
	jr	NC, 00104$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:93: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile+16-invaders[i].slide);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x10
	sub	a, (hl)
	ld	c, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:94: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	dec	hl
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	inc	a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00112$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:98: }else if(invaders[i].slide<0){
	ldhl	sp,	#6
	bit	7, (hl)
	jr	Z, 00112$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:100: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile-invaders[i].slide);
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	sub	a, (hl)
	ld	c, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:101: set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	dec	hl
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	sub	a, c
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	dec	a
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:105: }
	add	sp, #9
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:107: UINT8 SlideInvader(UINT8 i){
;	---------------------------------
; Function SlideInvader
; ---------------------------------
_SlideInvader::
	add	sp, #-4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:110: invaders[i].slide+=slideDir;
	ldhl	sp,	#6
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_invaders
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	hl, #_slideDir
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
	push	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:114: if(invaders[i].slide>7||invaders[i].slide<-7){
	ld	a, (hl+)
	ld	(de), a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl-), a
	ld	e, (hl)
	ld	a,#0x07
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00124$
	bit	7, d
	jr	NZ, 00125$
	cp	a, a
	jr	00125$
00124$:
	bit	7, d
	jr	Z, 00125$
	scf
00125$:
	jr	C, 00101$
	ldhl	sp,	#3
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x79
	jr	NC, 00102$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:118: invaders[i].slide=0;
	pop	hl
	push	hl
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:119: invaders[i].column+=slideDir;
	ld	a, (bc)
	ld	hl, #_slideDir
	add	a, (hl)
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:122: return(invaders[i].column==0)||(invaders[i].column==19);
	push	af
	ld	a, (bc)
	ld	c, a
	pop	af
	or	a, a
	jr	Z, 00107$
	ld	a, c
	sub	a, #0x13
	jr	Z, 00107$
	ld	e, #0x00
	jr	00104$
00107$:
	ld	e, #0x01
	jr	00104$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:125: return 0;
	ld	e, #0x00
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:126: }
	add	sp, #4
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:128: UINT8 InvaderTryFireBullet(UINT8 i){
;	---------------------------------
; Function InvaderTryFireBullet
; ---------------------------------
_InvaderTryFireBullet::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:133: UINT8 availableBulletSprite=GetAvailableBulletSprite();
	call	_GetAvailableBulletSprite
	ld	a,e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:136: if(availableBulletSprite!=0){
	or	a, a
	jr	Z, 00105$
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:142: move_sprite(availableBulletSprite,invaders[i].column*8+12+invaders[i].slide*2,invaders[i].row*8+24);
	ldhl	sp,	#4
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	de, #_invaders
	pop	hl
	push	hl
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x18
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x0c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	add	a, a
	add	a, l
	ld	e, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:145: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:147: }
	inc	sp
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:149: void ShiftAllInvadersDown(){
;	---------------------------------
; Function ShiftAllInvadersDown
; ---------------------------------
_ShiftAllInvadersDown::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:152: for(UINT8 i=0;i<40;i++){invaders[i].row++;}
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00101$
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_invaders
	add	hl, de
	inc	hl
	inc	(hl)
	inc	c
	jr	00103$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:155: slideDir=-slideDir;
	xor	a, a
	ld	hl, #_slideDir
	sub	a, (hl)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:157: fill_bkg_rect(0,topRow,20,1,0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	ld	a, (#_topRow)
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_fill_bkg_rect
	add	sp, #5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:160: topRow++;
	ld	hl, #_topRow
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:161: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:163: UINT8 InvadersShouldMove(){
;	---------------------------------
; Function InvadersShouldMove
; ---------------------------------
_InvadersShouldMove::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:164: return invaderCounter>4-topRow/2||topRow>9;
	ld	hl, #_topRow
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00106$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00106$:
	sra	h
	rr	l
	ld	a, #0x04
	sub	a, l
	ld	c, a
	sbc	a, a
	sub	a, h
	ld	b, a
	ld	hl, #_invaderCounter
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	ld	d, b
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	bit	7, e
	jr	Z, 00122$
	bit	7, d
	jr	NZ, 00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z, 00123$
	scf
00123$:
	jr	C, 00104$
	ld	a, #0x09
	ld	hl, #_topRow
	sub	a, (hl)
	jr	C, 00104$
	ld	e, #0x00
	ret
00104$:
	ld	e, #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:165: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:167: void UpdateInvaders(){
;	---------------------------------
; Function UpdateInvaders
; ---------------------------------
_UpdateInvaders::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:169: UINT8 anyInvaderHasReachedEndOfScreen=0;
	ld	c, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:171: invadersRemaining=0;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:172: invaderCounter++;
	ld	hl, #_invaderCounter
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:173: if(shotTimer!=0)shotTimer--;
	ld	hl, #_shotTimer
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
	dec	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:175: for(UINT8 i=0;i<40;i++){
00131$:
	ld	b, #0x00
00116$:
	ld	a, b
	sub	a, #0x28
	jr	NC, 00110$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:178: if(invaders[i].active==1){
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_invaders
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00107$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:181: invadersRemaining++;
	ld	hl, #_invadersRemaining
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:183: if(shotTimer==0&&RandomNumber(0,100)<10){
	ld	a, (#_shotTimer)
	or	a, a
	jr	NZ, 00104$
	push	bc
	ld	hl, #0x6400
	push	hl
	call	_RandomNumber
	pop	hl
	ld	a, e
	pop	bc
	sub	a, #0x0a
	jr	NC, 00104$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:184: InvaderTryFireBullet(i);
	push	bc
	push	bc
	inc	sp
	call	_InvaderTryFireBullet
	inc	sp
	pop	bc
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:187: InvaderCheckPlayerCollision(i);
	push	bc
	push	bc
	inc	sp
	call	_InvaderCheckPlayerCollision
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:188: InvaderCheckBulletCollision(i);
	push	bc
	push	bc
	inc	sp
	call	_InvaderCheckBulletCollision
	inc	sp
	pop	bc
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:193: if(InvadersShouldMove()){
	push	bc
	call	_InvadersShouldMove
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:196: anyInvaderHasReachedEndOfScreen=anyInvaderHasReachedEndOfScreen||SlideInvader(i);
	ld	a, c
	or	a, a
	jr	NZ, 00121$
	push	bc
	push	bc
	inc	sp
	call	_SlideInvader
	inc	sp
	ld	a, e
	pop	bc
	or	a,a
	jr	NZ, 00121$
	ld	c,a
	jr	00122$
00121$:
	ld	c, #0x01
00122$:
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:201: UpdateInvaderTiles(i);
	push	bc
	push	bc
	inc	sp
	call	_UpdateInvaderTiles
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:175: for(UINT8 i=0;i<40;i++){
	inc	b
	jr	00116$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:205: if(InvadersShouldMove()){
	push	bc
	call	_InvadersShouldMove
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00112$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:206: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:213: if(anyInvaderHasReachedEndOfScreen){
	ld	a, c
	or	a, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:214: ShiftAllInvadersDown();
	jp	NZ,_ShiftAllInvadersDown
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:216: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
