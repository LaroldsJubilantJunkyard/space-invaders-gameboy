;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module invaders
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _GetInvaderForNode
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
	add	sp, #-10
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:17: UINT8 alienTypes[3]={21,29,37};
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x15
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x1d
	inc	bc
	inc	bc
	ld	a, #0x25
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:19: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#9
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#9
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
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	and	a, #0x07
	add	a, a
	add	a, #0x02
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:21: invaders[i].row=(i/8);
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#4
	bit	7, (hl)
	jr	Z, 00107$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
00107$:
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:22: invaders[i].slide=0;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:23: invaders[i].active=1;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:24: invaders[i].originalTile=21;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x15
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:27: set_bkg_tile_xy(invaders[i].column,invaders[i].row,invaders[i].originalTile);
	ld	e, (hl)
	ld	a, (bc)
	ld	h, e
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:19: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#9
	inc	(hl)
	jp	00103$
00101$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:31: topRow=0;
	ld	hl, #_topRow
	ld	(hl), #0x00
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
	add	sp, #10
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:39: UINT8 GetInvaderForNode(UINT8 column, UINT8 row){
;	---------------------------------
; Function GetInvaderForNode
; ---------------------------------
_GetInvaderForNode::
	add	sp, #-8
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:42: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#0
	ld	(hl), #0x00
	ldhl	sp,	#7
	ld	(hl), #0x00
00120$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00118$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:45: if(invaders[i].active==0)continue;
	ld	bc, #_invaders+0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	or	a, a
	jp	Z, 00117$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:54: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:48: if(column==invaders[i].column&&row==invaders[i].row)return i;
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	jr	NZ, 00104$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NZ, 00104$
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00121$
00104$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:51: if(invaders[i].slide>0){
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:54: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:51: if(invaders[i].slide>0){
	ldhl	sp,	#4
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00182$
	bit	7, d
	jr	NZ, 00183$
	cp	a, a
	jr	00183$
00182$:
	bit	7, d
	jr	Z, 00183$
	scf
00183$:
	jr	NC, 00115$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:54: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
	inc	bc
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00117$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00121$
00115$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:57: }else if(invaders[i].slide<0){
	ldhl	sp,	#4
	bit	7, (hl)
	jr	Z, 00117$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:60: if(column==invaders[i].column-1&&row==invaders[i].row)return i;
	inc	hl
	dec	bc
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00117$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00117$
	ldhl	sp,	#0
	ld	e, (hl)
	jr	00121$
00117$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:42: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#7
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	jp	00120$
00118$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:65: return 255;
	ld	e, #0xff
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:66: }
	add	sp, #8
	ret
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:67: void UpdateInvaders(){
;	---------------------------------
; Function UpdateInvaders
; ---------------------------------
_UpdateInvaders::
	add	sp, #-10
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:69: UINT8 playerColumn=paddle.x/8;
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
	jr	Z, 00159$
	ld	hl, #0x0007
	add	hl, bc
00159$:
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:70: UINT8 playerRow=paddle.y/8;
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
	jr	Z, 00160$
	ld	hl, #0x0007
	add	hl, bc
00160$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#1
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:72: UINT8 anyInvaderHasReachedEndOfScreen=0;
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:74: invadersRemaining=0;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:75: invaderCounter++;
	ld	hl, #_invaderCounter
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:76: if(shotTimer!=0)shotTimer--;
	ld	hl, #_shotTimer
	ld	a, (hl)
	or	a, a
	jr	Z, 00186$
	dec	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:78: for(UINT8 i=0;i<40;i++){
00186$:
	ldhl	sp,	#9
	ld	(hl), #0x00
00152$:
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00142$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:82: if(invaders[i].active==1){
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
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	dec	a
	jp	NZ,00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:84: invadersRemaining++;
	ld	hl, #_invadersRemaining
	inc	(hl)
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:86: if(shotTimer==0&&RandomNumber(0,100)<10){
	ld	a, (#_shotTimer)
	or	a, a
	jr	NZ, 00106$
	ld	hl, #0x6400
	push	hl
	call	_RandomNumber
	pop	hl
	ld	a, e
	sub	a, #0x0a
	jr	NC, 00106$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:88: UINT8 availableBulletSprite=GetAvailableBulletSprite();
	call	_GetAvailableBulletSprite
	ld	a, e
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:90: if(availableBulletSprite!=0){
	or	a, a
	jr	Z, 00106$
;C:/gbdk/include/gb/gb.h:1326: shadow_OAM[nb].tile=tile;
	ld	l, c
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
	ld	(hl), #0x2a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:93: move_sprite(availableBulletSprite,invaders[i].column*8+4+invaders[i].slide*2,invaders[i].row*8+16);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	inc	de
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x10
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, a
	ldhl	sp,	#8
	add	a, (hl)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1399: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/gbdk/include/gb/gb.h:1400: itm->y=y, itm->x=x;
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:94: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
00106$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:99: if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)){
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_invaders
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00109$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00109$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:100: paddle.dead=1;
	ld	hl, #_paddle + 2
	ld	(hl), #0x01
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:101: paddle.lives=0;
	ld	bc, #_paddle + 3
	xor	a, a
	ld	(bc), a
00109$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:104: if(PlayerBulletSprite.tile!=0){
	ld	bc, #_shadow_OAM+10
	ld	a, (bc)
	or	a, a
	jr	Z, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:106: INT8 xd = (PlayerBulletSprite.x-4)-(invaders[i].column*8+4+(invaders[i].slide*2));
	ld	bc, #_shadow_OAM+9
	ld	a, (bc)
	add	a, #0xfc
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	e, a
	push	de
	ld	de, #_invaders
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	add	a, a
	add	a, e
	ld	e, a
	ldhl	sp,	#8
	ld	a, (hl-)
	sub	a, e
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:107: INT8 yd = (PlayerBulletSprite.y-12)-invaders[i].row*8+4;
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:109: if(xd<0)xd=-xd;
	ld	(hl-), a
	bit	7, (hl)
	jr	Z, 00112$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00112$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:110: if(yd<0)yd=-yd;
	ldhl	sp,	#8
	bit	7, (hl)
	jr	Z, 00114$
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00114$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:112: if(xd<5&&yd<8){
	ldhl	sp,	#7
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jr	NC, 00121$
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x88
	jr	NC, 00121$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:114: IncreaseScore(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_IncreaseScore
	inc	sp
	pop	bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:117: invaders[i].active=0;
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:120: PlayerBulletSprite.tile=0;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x00
00121$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:82: if(invaders[i].active==1){
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:126: if(invaders[i].active==0){
	ld	bc,#_invaders
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:129: set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	e, a
	ld	a, (hl+)
	ld	c, a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:132: }else if(invaders[i].slide==0){
	ld	a, (hl-)
	ld	b, a
	inc	bc
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:126: if(invaders[i].active==0){
	ld	a, e
	or	a, a
	jr	NZ, 00131$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:129: set_bkg_tile_xy(invaders[i].column,invaders[i].row,0);
	inc	hl
	inc	hl
	ld	a, (bc)
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:130: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00132$
00131$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:132: }else if(invaders[i].slide==0){
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	or	a, a
	jr	NZ, 00128$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:135: set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4]);
	ld	a, (#(_tiles + 4) + 0)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	h, (hl)
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:136: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,0);
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	a
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jp	00132$
00128$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:138: }else if(invaders[i].slide>0){
	ld	e, l
	xor	a, a
	ld	d, a
	sub	a, l
	bit	7, e
	jr	Z, 00316$
	bit	7, d
	jr	NZ, 00317$
	cp	a, a
	jr	00317$
00316$:
	bit	7, d
	jr	Z, 00317$
	scf
00317$:
	jr	NC, 00125$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:141: set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4-invaders[i].slide]);
	ld	a, #0x04
	sub	a, l
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_tiles
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	h, (hl)
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:142: set_bkg_tile_xy(invaders[i].column+1,invaders[i].row,tiles[8-invaders[i].slide]);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	sub	a, l
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_tiles
	add	hl, de
	ld	a, (hl)
	push	af
	ld	a, (bc)
	ld	b, a
	pop	af
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
	inc	c
	push	af
	inc	sp
	push	bc
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00132$
00125$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:144: }else if(invaders[i].slide<0){
	bit	7, l
	jr	Z, 00132$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:146: set_bkg_tile_xy(invaders[i].column-1,invaders[i].row,tiles[-invaders[i].slide]);
	xor	a, a
	sub	a, l
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_tiles
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (bc)
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	ld	d, l
	dec	d
	ldhl	sp,	#8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:147: set_bkg_tile_xy(invaders[i].column,invaders[i].row,tiles[4-invaders[i].slide]);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
	sub	a, l
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_tiles
	add	hl, de
	ld	a, (hl)
	push	af
	ld	a, (bc)
	ld	b, a
	pop	af
	ldhl	sp,#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, a
	inc	sp
	push	bc
	call	_set_bkg_tile_xy
	add	sp, #3
00132$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:150: if(invaderCounter>4-topRow/2||topRow>9){
	ld	hl, #_topRow
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00161$
	inc	hl
	ld	c, l
	ld	b, h
00161$:
	sra	b
	rr	c
	ld	a, #0x04
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
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
	jr	Z, 00318$
	bit	7, d
	jr	NZ, 00319$
	cp	a, a
	jr	00319$
00318$:
	bit	7, d
	jr	Z, 00319$
	scf
00319$:
	jr	C, 00139$
	ld	a, #0x09
	ld	hl, #_topRow
	sub	a, (hl)
	jr	NC, 00153$
00139$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:152: invaders[i].slide+=slideDir;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_slideDir
	ld	c, (hl)
	add	a, c
	ld	b, a
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:154: if(invaders[i].slide>4||invaders[i].slide<-4){
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	e, b
	ld	a,#0x04
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00320$
	bit	7, d
	jr	NZ, 00321$
	cp	a, a
	jr	00321$
00320$:
	bit	7, d
	jr	Z, 00321$
	scf
00321$:
	jr	C, 00136$
	ld	a, c
	xor	a, #0x80
	sub	a, #0x7c
	jr	NC, 00153$
00136$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:155: invaders[i].slide=0;
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:156: invaders[i].column+=slideDir;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_slideDir
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:157: if((invaders[i].column==0)||(invaders[i].column==19)){
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	c
	dec	c
	jr	Z, 00133$
	sub	a, #0x13
	jr	NZ, 00153$
00133$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:158: anyInvaderHasReachedEndOfScreen=1;
	ldhl	sp,	#2
	ld	(hl), #0x01
00153$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:78: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#9
	inc	(hl)
	jp	00152$
00142$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:168: if(invaderCounter>4-topRow/2||topRow>9){
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
	jr	Z, 00162$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00162$:
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
	jr	Z, 00324$
	bit	7, d
	jr	NZ, 00325$
	cp	a, a
	jr	00325$
00324$:
	bit	7, d
	jr	Z, 00325$
	scf
00325$:
	jr	C, 00143$
	ld	a, #0x09
	ld	hl, #_topRow
	sub	a, (hl)
	jr	NC, 00144$
00143$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:169: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
00144$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:175: if(anyInvaderHasReachedEndOfScreen){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00157$
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:178: for(UINT8 i=0;i<40;i++){invaders[i].row++;}
	ld	c, #0x00
00155$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00146$
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
	ld	a, (hl)
	inc	c
	jr	00155$
00146$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:181: slideDir=-slideDir;
	xor	a, a
	ld	hl, #_slideDir
	sub	a, (hl)
	ld	(hl), a
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:183: fill_bkg_rect(0,topRow,20,1,0);
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
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:186: topRow++;
	ld	hl, #_topRow
	inc	(hl)
00157$:
;D:\Business\LaroldsJubilantJunkyard\game-remakes\space-invaders\source\main\default\States\Gameplay\invaders.c:188: }
	add	sp, #10
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
