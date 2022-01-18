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
	.globl _InvaderCheckPlayerCollision
	.globl _RandomNumber
	.globl _GetAvailableBulletSprite
	.globl _fill_bkg_rect
	.globl _set_bkg_tile_xy
	.globl _rowsAtEnd
	.globl _moveRow
	.globl _shotTimer
	.globl _topRow
	.globl _invaderCounter
	.globl _invaderSpeed
	.globl _invaders
	.globl _tiles
	.globl _SetupInvaders
	.globl _UpdateInvaderTiles
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
_shotTimer::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_moveRow::
	.ds 1
_rowsAtEnd::
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:16: void SetupInvaders(){
;	---------------------------------
; Function SetupInvaders
; ---------------------------------
_SetupInvaders::
	add	sp, #-15
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:18: uint8_t alienTypes[3]={INVADER1_TILES_START,INVADER2_TILES_START,INVADER3_TILES_START};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x05
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x15
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x25
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:20: for(uint8_t i=0;i<40;i++){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:21: invaders[i].column=(i%8)*2+2;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:22: invaders[i].row=(i/8)+2;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:23: invaders[i].slide=0;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:24: invaders[i].active=1;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:25: invaders[i].originalTile=alienTypes[i/16];
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:28: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:20: for(uint8_t i=0;i<40;i++){
	ldhl	sp,	#14
	inc	(hl)
	jp	00103$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:32: topRow=2;
	ld	hl, #_topRow
	ld	(hl), #0x02
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:33: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:34: slideDir=-1;
	ld	hl, #_slideDir
	ld	(hl), #0xff
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:35: moveRow=0;
	ld	hl, #_moveRow
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:36: rowsAtEnd=0;
	ld	hl, #_rowsAtEnd
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:37: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:38: invaderSpeed=3;
	ld	hl, #_invaderSpeed
	ld	(hl), #0x03
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:39: invadersRemaining=40;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x28
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:40: }
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:42: void InvaderCheckPlayerCollision(uint8_t i){
;	---------------------------------
; Function InvaderCheckPlayerCollision
; ---------------------------------
_InvaderCheckPlayerCollision::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:44: uint8_t playerColumn=paddle.x/8;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:45: uint8_t playerRow=paddle.y/8;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:47: if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:48: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:49: paddle.lives=0;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x00
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:51: }
	inc	sp
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:53: void UpdateInvaderTiles(uint8_t i){
;	---------------------------------
; Function UpdateInvaderTiles
; ---------------------------------
_UpdateInvaderTiles::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:56: if(invaders[i].active==0){
	ldhl	sp,	#10
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
	ldhl	sp,	#7
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:58: if(invaders[i].slide>=0)set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:65: }else if(invaders[i].slide==0){
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:58: if(invaders[i].slide>=0)set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	ld	b, a
	rlca
	and	a,#0x01
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:56: if(invaders[i].active==0){
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00113$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:58: if(invaders[i].slide>=0)set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:67: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	dec	hl
	dec	hl
	dec	hl
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:58: if(invaders[i].slide>=0)set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	ld	e, b
	bit	0, c
	jr	NZ, 00102$
	ld	b, e
	inc	b
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00103$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:59: else set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,0);
	dec	e
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	d,a
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
00103$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:62: set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00115$
00113$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:67: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	pop	de
	push	de
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:65: }else if(invaders[i].slide==0){
	ld	a, b
	or	a, a
	jr	NZ, 00110$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:67: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:68: set_bkg_tile_xy(invaders[i].column-slideDir,invaders[i].row,0);
	ldhl	sp,#4
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
	jp	00115$
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:71: } else if(invaders[i].slide>0){
	ld	e, b
	xor	a, a
	ld	d, a
	sub	a, b
	bit	7, e
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jr	NC, 00107$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:74: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile+16-invaders[i].slide);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	add	a, #0x10
	sub	a, b
	ld	c, a
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:75: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
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
	jr	00115$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:79: }else if(invaders[i].slide<0){
	ld	a, c
	or	a, a
	jr	Z, 00115$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:81: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile-invaders[i].slide);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	sub	a, b
	ld	c, a
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:82: set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,invaders[i].originalTile+8-invaders[i].slide);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
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
00115$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:86: }
	add	sp, #8
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:88: uint8_t SlideInvader(uint8_t i){
;	---------------------------------
; Function SlideInvader
; ---------------------------------
_SlideInvader::
	add	sp, #-4
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:90: if(invaders[i].column==0&&slideDir!=1)return 0;
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
	ld	a, (bc)
	ld	e, a
	ld	a, (#_slideDir)
	dec	a
	ld	a, #0x01
	jr	Z, 00151$
	xor	a, a
00151$:
	ld	d, a
	ld	a, e
	or	a, a
	jr	NZ, 00102$
	bit	0, d
	jr	NZ, 00102$
	ld	e, #0x00
	jr	00110$
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:91: if(invaders[i].column>=19&&slideDir==1)return 0;
	ld	a, e
	sub	a, #0x13
	jr	C, 00105$
	ld	a, d
	or	a, a
	jr	Z, 00105$
	ld	e, #0x00
	jr	00110$
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:94: invaders[i].slide+=slideDir*2;
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
	sla	e
	add	a, e
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
	push	de
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:98: if(invaders[i].slide>7||invaders[i].slide<-7){
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
	jr	Z, 00152$
	bit	7, d
	jr	NZ, 00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z, 00153$
	scf
00153$:
	jr	C, 00107$
	ldhl	sp,	#3
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x79
	jr	NC, 00108$
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:102: invaders[i].slide=0;
	pop	hl
	push	hl
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:103: invaders[i].column+=slideDir;
	ld	a, (bc)
	ld	hl, #_slideDir
	add	a, (hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:106: return(invaders[i].column==0)||(invaders[i].column>=19);
	ld	(bc), a
	or	a, a
	jr	Z, 00113$
	sub	a, #0x13
	jr	NC, 00113$
	ld	e, #0x00
	jr	00110$
00113$:
	ld	e, #0x01
	jr	00110$
00108$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:109: return 0;
	ld	e, #0x00
00110$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:110: }
	add	sp, #4
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:112: void InvaderTryFireBullet(uint8_t i){
;	---------------------------------
; Function InvaderTryFireBullet
; ---------------------------------
_InvaderTryFireBullet::
	dec	sp
	dec	sp
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:117: uint8_t availableBulletSprite=GetAvailableBulletSprite();
	call	_GetAvailableBulletSprite
	ld	a,e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:120: if(availableBulletSprite!=0){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:126: move_sprite(availableBulletSprite,invaders[i].column*8+12+invaders[i].slide,invaders[i].row*8+24);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:129: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
00105$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:131: }
	inc	sp
	inc	sp
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:133: void ShiftAllInvadersDown(){
;	---------------------------------
; Function ShiftAllInvadersDown
; ---------------------------------
_ShiftAllInvadersDown::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:136: for(uint8_t i=0;i<40;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00101$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:137: invaders[i].row++;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:140: UpdateInvaderTiles(i);
	push	bc
	ld	a, c
	push	af
	inc	sp
	call	_UpdateInvaderTiles
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:136: for(uint8_t i=0;i<40;i++){
	inc	c
	jr	00103$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:144: slideDir=-slideDir;
	xor	a, a
	ld	hl, #_slideDir
	sub	a, (hl)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:146: fill_bkg_rect(0,topRow,20,1,0);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:149: topRow++;
	ld	hl, #_topRow
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:150: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:152: uint8_t InvadersShouldMove(){
;	---------------------------------
; Function InvadersShouldMove
; ---------------------------------
_InvadersShouldMove::
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:153: return invaderCounter>12-topRow/2||topRow>9;
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
	ld	a, #0x0c
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:154: }
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:156: void UpdateInvaders(){
;	---------------------------------
; Function UpdateInvaders
; ---------------------------------
_UpdateInvaders::
	add	sp, #-5
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:159: uint8_t anyInvaderHasReachedEndOfScreen=0;
	ld	c, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:162: invaderCounter++;
	ld	hl, #_invaderCounter
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:163: if(shotTimer!=0)shotTimer--;
	ld	hl, #_shotTimer
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
	dec	(hl)
00102$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:165: for(uint8_t i=moveRow*8;i<moveRow*8+8;i++){
	ld	a, (#_moveRow)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#4
	ld	(hl), a
00126$:
	ld	hl, #_moveRow
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #0x0008
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00196$
	bit	7, d
	jr	NZ, 00197$
	cp	a, a
	jr	00197$
00196$:
	bit	7, d
	jr	Z, 00197$
	scf
00197$:
	jr	NC, 00112$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:168: if(invaders[i].active==1){
	ldhl	sp,	#4
	ld	e, (hl)
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:170: if(shotTimer==0&&RandomNumber(0,100)<10){
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:171: InvaderTryFireBullet(i);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_InvaderTryFireBullet
	inc	sp
	pop	bc
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:174: InvaderCheckPlayerCollision(i);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_InvaderCheckPlayerCollision
	inc	sp
	pop	bc
00107$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:178: if(InvadersShouldMove()){
	push	bc
	call	_InvadersShouldMove
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00127$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:183: if(SlideInvader(i)){
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_SlideInvader
	inc	sp
	ld	a, e
	pop	bc
	or	a, a
	jr	Z, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:184: anyInvaderHasReachedEndOfScreen=1;
	ld	c, #0x01
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:188: UpdateInvaderTiles(i);
	push	bc
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_UpdateInvaderTiles
	inc	sp
	pop	bc
00127$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:165: for(uint8_t i=moveRow*8;i<moveRow*8+8;i++){
	ldhl	sp,	#4
	inc	(hl)
	jp	00126$
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:198: if(anyInvaderHasReachedEndOfScreen){
	ld	a, c
	or	a, a
	jr	Z, 00116$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:199: rowsAtEnd++;
	ld	hl, #_rowsAtEnd
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:200: if(rowsAtEnd==5){
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00116$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:201: rowsAtEnd=0;
	ld	hl, #_rowsAtEnd
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:205: ShiftAllInvadersDown();
	call	_ShiftAllInvadersDown
00116$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:210: if(InvadersShouldMove()){
	call	_InvadersShouldMove
	ld	a, e
	or	a, a
	jr	Z, 00128$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:212: if(moveRow==4||moveRow==2){
	ld	a, (#_moveRow)
	sub	a, #0x04
	jr	Z, 00119$
	ld	a, (#_moveRow)
	sub	a, #0x02
	jr	NZ, 00120$
00119$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:213: NR21_REG=0x43;
	ld	a, #0x43
	ldh	(_NR21_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:214: NR22_REG=0x81;
	ld	a, #0x81
	ldh	(_NR22_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:215: NR23_REG=0xED;
	ld	a, #0xed
	ldh	(_NR23_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:216: NR24_REG=0xC1;
	ld	a, #0xc1
	ldh	(_NR24_REG + 0), a
	jr	00121$
00120$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:217: }else if(moveRow==0){
	ld	a, (#_moveRow)
	or	a, a
	jr	NZ, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:218: NR21_REG=0x83;
	ld	a, #0x83
	ldh	(_NR21_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:219: NR22_REG=0x81;
	ld	a, #0x81
	ldh	(_NR22_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:220: NR23_REG=0xED;
	ld	a, #0xed
	ldh	(_NR23_REG + 0), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:221: NR24_REG=0xC1;
	ld	a, #0xc1
	ldh	(_NR24_REG + 0), a
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:225: moveRow=(moveRow+1)%5;
	ld	hl, #_moveRow
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	de, #0x0005
	push	de
	push	bc
	call	__modsint
	add	sp, #4
	ld	hl, #_moveRow
	ld	(hl), e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:228: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
00128$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:232: }
	add	sp, #5
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__moveRow:
	.db #0x00	; 0
__xinit__rowsAtEnd:
	.db #0x00	; 0
	.area _CABS (ABS)
