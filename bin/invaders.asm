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
	.globl _SpawnEnemyBullet
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _shotTimer
	.globl _invadersRemaining
	.globl _topRow
	.globl _slideDir
	.globl _invaderCounter
	.globl _invaderSpeed
	.globl _invaders
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
	.ds 160
_invaderSpeed::
	.ds 1
_invaderCounter::
	.ds 1
_slideDir::
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
;source/default/invaders.c:19: void SetupInvaders(){
;	---------------------------------
; Function SetupInvaders
; ---------------------------------
_SetupInvaders::
	add	sp, #-7
;source/default/invaders.c:21: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#6
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#6
;source/default/invaders.c:22: invaders[i].column=(i%8)*2+2;
	ld	a,(hl)
	cp	a,#0x28
	jp	NC,00101$
	ldhl	sp,	#0
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_invaders
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	and	a, #0x07
	add	a, a
	add	a, #0x02
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;source/default/invaders.c:23: invaders[i].row=i/8;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	(hl), a
	pop	bc
	push	bc
	ldhl	sp,	#1
	bit	7, (hl)
	jr	Z, 00107$
	pop	de
	push	de
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
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;source/default/invaders.c:24: invaders[i].slide=0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
;source/default/invaders.c:25: invaders[i].active=1;
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
;source/default/invaders.c:27: set_bkg_tile_xy(invaders[i].column,invaders[i].row,21);
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	ld	a, #0x01
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, #0x15
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
;source/default/invaders.c:21: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#6
	inc	(hl)
	jp	00103$
00101$:
;source/default/invaders.c:30: topRow=0;
	ld	hl, #_topRow
	ld	(hl), #0x00
;source/default/invaders.c:31: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
;source/default/invaders.c:32: slideDir=-1;
	ld	hl, #_slideDir
	ld	(hl), #0xff
;source/default/invaders.c:33: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
;source/default/invaders.c:34: invaderSpeed=3;
	ld	hl, #_invaderSpeed
	ld	(hl), #0x03
;source/default/invaders.c:35: invadersRemaining=40;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x28
;source/default/invaders.c:36: }
	add	sp, #7
	ret
;source/default/invaders.c:38: UINT8 GetInvaderForNode(UINT8 column, UINT8 row){
;	---------------------------------
; Function GetInvaderForNode
; ---------------------------------
_GetInvaderForNode::
	add	sp, #-8
;source/default/invaders.c:41: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#0
	ld	(hl), #0x00
	ldhl	sp,	#7
	ld	(hl), #0x00
00120$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00118$
;source/default/invaders.c:44: if(invaders[i].active==0)continue;
	ld	bc, #_invaders+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
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
;source/default/invaders.c:53: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;source/default/invaders.c:47: if(column==invaders[i].column&&row==invaders[i].row)return i;
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
;source/default/invaders.c:50: if(invaders[i].slide>0){
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
;source/default/invaders.c:53: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#1
	ld	c, (hl)
	ld	b, #0x00
;source/default/invaders.c:50: if(invaders[i].slide>0){
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
;source/default/invaders.c:53: if(column==invaders[i].column+1&&row==invaders[i].row)return i;
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
;source/default/invaders.c:56: }else if(invaders[i].slide<0){
	ldhl	sp,	#4
	bit	7, (hl)
	jr	Z, 00117$
;source/default/invaders.c:59: if(column==invaders[i].column-1&&row==invaders[i].row)return i;
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
;source/default/invaders.c:41: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#7
	inc	(hl)
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	jp	00120$
00118$:
;source/default/invaders.c:64: return 255;
	ld	e, #0xff
00121$:
;source/default/invaders.c:65: }
	add	sp, #8
	ret
;source/default/invaders.c:67: UINT8 RandomNumber(UINT8 min, UINT8 max){
;	---------------------------------
; Function RandomNumber
; ---------------------------------
_RandomNumber::
;source/default/invaders.c:73: UINT8 v = (*(ptr_div_reg))+shadow_OAM[0].x+shadow_OAM[1].x+shadow_OAM[2].x+shadow_OAM[3].x+shadow_OAM[4].x;
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
;source/default/invaders.c:75: return min+(v % (max-min));    // get value at memory address
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
;source/default/invaders.c:76: }
	ret
;source/default/invaders.c:78: void UpdateInvaders(){
;	---------------------------------
; Function UpdateInvaders
; ---------------------------------
_UpdateInvaders::
	add	sp, #-34
;source/default/invaders.c:80: UINT8 playerColumn=paddle.x/8;
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
	jr	Z, 00164$
	ld	hl, #0x0007
	add	hl, bc
00164$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#11
	ld	(hl), c
;source/default/invaders.c:81: UINT8 playerRow=paddle.y/8;
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
	jr	Z, 00165$
	ld	hl, #0x0007
	add	hl, bc
00165$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#12
;source/default/invaders.c:83: UINT8 anyInvaderHasReachedEndOfScreen=0;
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
;source/default/invaders.c:85: invadersRemaining=0;
	ld	hl, #_invadersRemaining
	ld	(hl), #0x00
;source/default/invaders.c:86: invaderCounter++;
	ld	hl, #_invaderCounter
	inc	(hl)
;source/default/invaders.c:87: if(shotTimer!=0)shotTimer--;
	ld	hl, #_shotTimer
	ld	a, (hl)
	or	a, a
	jr	Z, 00193$
	dec	(hl)
;source/default/invaders.c:89: for(UINT8 i=0;i<40;i++){
00193$:
	ldhl	sp,	#33
	ld	(hl), #0x00
00154$:
	ldhl	sp,	#33
	ld	a, (hl)
	sub	a, #0x28
	jp	NC, 00145$
;source/default/invaders.c:91: unsigned char tiles[9] = {25,18,19,20,21,22,23,24,25};
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#14
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x19
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	ld	a, #0x12
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, #0x13
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	ld	a, #0x14
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x15
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x16
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x17
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x18
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x19
;source/default/invaders.c:93: unsigned char leftMiddleRight[2] = {0x0,0x0};
	ldhl	sp,	#9
	ld	a, l
	ld	d, h
	ldhl	sp,	#18
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;source/default/invaders.c:95: if(invaders[i].active==1){
	ldhl	sp,	#33
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ld	hl, #_invaders
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#26
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#25
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
;source/default/invaders.c:108: SpawnEnemyBullet(invaders[i].column*8+4+invaders[i].slide*2,invaders[i].row*8+16);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#28
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#30
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#29
	ld	(hl), a
;source/default/invaders.c:95: if(invaders[i].active==1){
	dec	c
	jp	NZ,00112$
;source/default/invaders.c:96: invadersRemaining++;
	ld	hl, #_invadersRemaining
	inc	(hl)
;source/default/invaders.c:98: if(shotTimer==0){
	ld	a, (#_shotTimer)
	or	a, a
	jp	NZ, 00112$
;source/default/invaders.c:100: INT8 xd = invaders[i].column - paddle.x/8;
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#30
	ld	(hl+), a
	ld	a, (#_paddle + 0)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00166$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00166$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, c
	ld	c, a
;source/default/invaders.c:102: if(xd<0)xd=-xd;
	bit	7, c
	jr	Z, 00104$
	xor	a, a
	sub	a, c
	ld	c, a
00104$:
;source/default/invaders.c:104: if(xd<=1){
	ld	e, c
	ld	a,#0x01
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00335$
	bit	7, d
	jr	NZ, 00336$
	cp	a, a
	jr	00336$
00335$:
	bit	7, d
	jr	Z, 00336$
	scf
00336$:
	jr	C, 00112$
;source/default/invaders.c:106: if(RandomNumber(0,100)<10){
	ld	hl, #0x6400
	push	hl
	call	_RandomNumber
	pop	hl
	ld	a, e
	sub	a, #0x0a
	jr	NC, 00112$
;source/default/invaders.c:108: SpawnEnemyBullet(invaders[i].column*8+4+invaders[i].slide*2,invaders[i].row*8+16);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x10
	ld	b, a
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x04
	ld	c, a
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	add	a, c
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_SpawnEnemyBullet
	pop	hl
;source/default/invaders.c:110: shotTimer=SHOT_TIMER_MAX;
	ld	hl, #_shotTimer
	ld	(hl), #0x32
00112$:
;source/default/invaders.c:119: if((playerColumn==invaders[i].column&&playerRow==invaders[i].row)&&invaders[i].active){
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00114$
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00114$
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00114$
;source/default/invaders.c:120: paddle.dead=1;
	ld	hl, #(_paddle + 2)
	ld	(hl), #0x01
;source/default/invaders.c:121: paddle.lives=0;
	ld	hl, #(_paddle + 3)
	ld	(hl), #0x00
00114$:
;source/default/invaders.c:124: if(invaders[i].slide==0){
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#32
	ld	(hl), a
	or	a, a
	jr	NZ, 00132$
;source/default/invaders.c:127: if(invaders[i].active==0){
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00118$
;source/default/invaders.c:128: leftMiddleRight[0]=0;
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;source/default/invaders.c:129: leftMiddleRight[1]=0;
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00119$
00118$:
;source/default/invaders.c:131: leftMiddleRight[0]=tiles[4];
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;source/default/invaders.c:132: leftMiddleRight[1]=25;
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x19
00119$:
;source/default/invaders.c:134: set_bkg_tiles(invaders[i].column,invaders[i].row,2,1,leftMiddleRight);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#32
	ld	(hl), a
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#36
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00133$
00132$:
;source/default/invaders.c:136: }else if(invaders[i].slide>0){
	ldhl	sp,	#32
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00341$
	bit	7, d
	jr	NZ, 00342$
	cp	a, a
	jr	00342$
00341$:
	bit	7, d
	jr	Z, 00342$
	scf
00342$:
	jr	NC, 00129$
;source/default/invaders.c:139: if(invaders[i].active==0){
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00121$
;source/default/invaders.c:140: leftMiddleRight[0]=0;
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;source/default/invaders.c:141: leftMiddleRight[1]=0;
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00122$
00121$:
;source/default/invaders.c:143: leftMiddleRight[0]=tiles[4-invaders[i].slide];
	ld	a, #0x04
	ldhl	sp,	#32
	sub	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;source/default/invaders.c:144: leftMiddleRight[1]=tiles[8-invaders[i].slide];
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x08
	sub	a, c
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00122$:
;source/default/invaders.c:146: set_bkg_tiles(invaders[i].column,invaders[i].row,2,1,leftMiddleRight);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#32
	ld	(hl), a
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#36
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	jp	00133$
00129$:
;source/default/invaders.c:148: }else if(invaders[i].slide<0){
	ldhl	sp,	#32
	bit	7, (hl)
	jr	Z, 00133$
;source/default/invaders.c:151: if(invaders[i].active==0){
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00124$
;source/default/invaders.c:152: leftMiddleRight[0]=0;
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;source/default/invaders.c:153: leftMiddleRight[1]=0;
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00125$
00124$:
;source/default/invaders.c:155: leftMiddleRight[0]=tiles[-invaders[i].slide];
	xor	a, a
	ldhl	sp,	#32
	sub	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;source/default/invaders.c:156: leftMiddleRight[1]=tiles[4-invaders[i].slide];
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x04
	sub	a, c
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#20
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00125$:
;source/default/invaders.c:158: set_bkg_tiles(invaders[i].column-1,invaders[i].row,2,1,leftMiddleRight);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,#22
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
	push	bc
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x02
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
00133$:
;source/default/invaders.c:164: if(invaderCounter>4-topRow/2||topRow>9){
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
	jr	Z, 00167$
	inc	hl
	ld	c, l
	ld	b, h
00167$:
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
	jr	Z, 00343$
	bit	7, d
	jr	NZ, 00344$
	cp	a, a
	jr	00344$
00343$:
	bit	7, d
	jr	Z, 00344$
	scf
00344$:
	jr	C, 00142$
	ld	a, #0x09
	ld	hl, #_topRow
	sub	a, (hl)
	jp	NC, 00155$
00142$:
;source/default/invaders.c:166: invaders[i].slide+=slideDir;
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_slideDir
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#28
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;source/default/invaders.c:168: if(invaders[i].slide>4||invaders[i].slide<-4){
	ldhl	sp,#28
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
	jr	Z, 00345$
	bit	7, d
	jr	NZ, 00346$
	cp	a, a
	jr	00346$
00345$:
	bit	7, d
	jr	Z, 00346$
	scf
00346$:
	jr	C, 00139$
	ld	a, c
	xor	a, #0x80
	sub	a, #0x7c
	jr	NC, 00155$
00139$:
;source/default/invaders.c:169: invaders[i].slide=0;
	ldhl	sp,	#28
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;source/default/invaders.c:170: invaders[i].column+=slideDir;
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_slideDir
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#22
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;source/default/invaders.c:171: if((invaders[i].column==0&&slideDir<0)||(invaders[i].column==19&&slideDir>0)){
	ld	c, a
	or	a, a
	jr	NZ, 00138$
	ld	a, (#_slideDir)
	bit	7, a
	jr	NZ, 00134$
00138$:
	ld	a, c
	sub	a, #0x13
	jr	NZ, 00155$
	ld	hl, #_slideDir
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00349$
	bit	7, d
	jr	NZ, 00350$
	cp	a, a
	jr	00350$
00349$:
	bit	7, d
	jr	Z, 00350$
	scf
00350$:
	jr	NC, 00155$
00134$:
;source/default/invaders.c:172: anyInvaderHasReachedEndOfScreen=1;
	ldhl	sp,	#13
	ld	(hl), #0x01
00155$:
;source/default/invaders.c:89: for(UINT8 i=0;i<40;i++){
	ldhl	sp,	#33
	inc	(hl)
	jp	00154$
00145$:
;source/default/invaders.c:179: if(invaderCounter>4-topRow/2||topRow>9){
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
	jr	Z, 00168$
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00168$:
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
	jr	Z, 00351$
	bit	7, d
	jr	NZ, 00352$
	cp	a, a
	jr	00352$
00351$:
	bit	7, d
	jr	Z, 00352$
	scf
00352$:
	jr	C, 00146$
	ld	a, #0x09
	ld	hl, #_topRow
	sub	a, (hl)
	jr	NC, 00147$
00146$:
;source/default/invaders.c:180: invaderCounter=0;
	ld	hl, #_invaderCounter
	ld	(hl), #0x00
00147$:
;source/default/invaders.c:186: if(anyInvaderHasReachedEndOfScreen){
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00162$
;source/default/invaders.c:189: for(UINT8 i=0;i<40;i++){invaders[i].row++;}
	ld	bc, #_invaders
	ld	e, #0x00
00157$:
	ld	a, e
	sub	a, #0x28
	jr	NC, 00149$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	(hl)
	inc	e
	jr	00157$
00149$:
;source/default/invaders.c:192: slideDir=-slideDir;
	xor	a, a
	ld	hl, #_slideDir
	sub	a, (hl)
	ld	(hl), a
;source/default/invaders.c:195: helper[0]=0;
	ld	hl, #_helper
;source/default/invaders.c:197: for(UINT8  i=0;i<20;i++){
	ld	(hl), #0x00
	ld	b, (hl)
00160$:
	ld	a, b
	sub	a, #0x14
	jr	NC, 00150$
;source/default/invaders.c:198: set_bkg_tiles(i,topRow,1,1,helper);
	ld	de, #_helper
	push	de
	ld	hl, #0x101
	push	hl
	ld	a, (#_topRow)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;source/default/invaders.c:197: for(UINT8  i=0;i<20;i++){
	inc	b
	jr	00160$
00150$:
;source/default/invaders.c:202: topRow++;
	ld	hl, #_topRow
	inc	(hl)
00162$:
;source/default/invaders.c:204: }
	add	sp, #34
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
